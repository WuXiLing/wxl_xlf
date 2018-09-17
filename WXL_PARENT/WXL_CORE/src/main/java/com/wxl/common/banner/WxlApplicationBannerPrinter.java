package com.wxl.common.banner;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.util.StringUtils;

import com.wxl.common.config.Global;

public class WxlApplicationBannerPrinter {

	static final String BANNER_LOCATION_PROPERTY = "banner.location";

	static final String BANNER_IMAGE_LOCATION_PROPERTY = "banner.image.location";

	static final String DEFAULT_BANNER_LOCATION = "banner.txt";

	static final String[] IMAGE_EXTENSION = { "gif", "jpg", "png" };

	private static final Banner DEFAULT_BANNER = new WxlBanner();

	private final ResourceLoader resourceLoader;

	private final Banner fallbackBanner;

	public WxlApplicationBannerPrinter(ResourceLoader resourceLoader, Banner fallbackBanner) {
		this.resourceLoader = resourceLoader;
		this.fallbackBanner = fallbackBanner;
	}

	public Banner print(Class<?> sourceClass, Log logger) {
		Banner banner = getBanner(this.fallbackBanner);
		try {
			logger.info(createStringFromBanner(banner, sourceClass));
		} catch (UnsupportedEncodingException ex) {
			logger.warn("Failed to create String for banner", ex);
		}
		return new PrintedBanner(banner, sourceClass);
	}

	public Banner print(Class<?> sourceClass, PrintStream out) {
		Banner banner = getBanner(this.fallbackBanner);
		banner.printBanner(sourceClass, out);
		return new PrintedBanner(banner, sourceClass);
	}

	private Banner getBanner(Banner definedBanner) {
		Banners banners = new Banners();
		banners.addIfNotNull(getImageBanner());
		banners.addIfNotNull(getTextBanner());
		if (banners.hasAtLeastOneBanner()) {
			return banners;
		}
		if (this.fallbackBanner != null) {
			return this.fallbackBanner;
		}
		return DEFAULT_BANNER;
	}

	private Banner getTextBanner() {
		String location = Global.getProperty(BANNER_LOCATION_PROPERTY, String.class, DEFAULT_BANNER_LOCATION);
		Resource resource = this.resourceLoader.getResource(location);
		if (resource.exists()) {
			return new ResourceBanner(resource);
		}
		return null;
	}

	private Banner getImageBanner() {
		String location = Global.getConfig(BANNER_IMAGE_LOCATION_PROPERTY);
		if (StringUtils.hasLength(location)) {
			Resource resource = this.resourceLoader.getResource(location);
			return (resource.exists() ? new ImageBanner(resource) : null);
		}
		for (String ext : IMAGE_EXTENSION) {
			Resource resource = this.resourceLoader.getResource("banner." + ext);
			if (resource.exists()) {
				return new ImageBanner(resource);
			}
		}
		return null;
	}

	private String createStringFromBanner(Banner banner, Class<?> mainApplicationClass) throws UnsupportedEncodingException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		banner.printBanner(mainApplicationClass, new PrintStream(baos));
		String charset = Global.getProperty("banner.charset", String.class, "UTF-8");
		return baos.toString(charset);
	}

	/**
	 * {@link Banner} comprised of other {@link Banner Banners}.
	 */
	private static class Banners implements Banner {

		private final List<Banner> banners = new ArrayList<Banner>();

		public void addIfNotNull(Banner banner) {
			if (banner != null) {
				this.banners.add(banner);
			}
		}

		public boolean hasAtLeastOneBanner() {
			return !this.banners.isEmpty();
		}

		@Override
		public void printBanner(Class<?> sourceClass, PrintStream out) {
			for (Banner banner : this.banners) {
				banner.printBanner(sourceClass, out);
			}
		}

	}

	/**
	 * Decorator that allows a {@link Banner} to be printed again without
	 * needing to specify the source class.
	 */
	private static class PrintedBanner implements Banner {

		private final Banner banner;

		private final Class<?> sourceClass;

		PrintedBanner(Banner banner, Class<?> sourceClass) {
			this.banner = banner;
			this.sourceClass = sourceClass;
		}

		@Override
		public void printBanner(Class<?> sourceClass, PrintStream out) {
			sourceClass = (sourceClass == null ? this.sourceClass : sourceClass);
			this.banner.printBanner(sourceClass, out);
		}

	}

}
