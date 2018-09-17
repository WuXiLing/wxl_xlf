package com.wxl.common.banner;

import java.io.PrintStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.core.env.MapPropertySource;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertyResolver;
import org.springframework.core.env.PropertySourcesPropertyResolver;
import org.springframework.core.io.Resource;
import org.springframework.util.Assert;
import org.springframework.util.StreamUtils;

import com.wxl.common.config.Global;
import com.wxl.common.config.WxlVersion;

public class ResourceBanner implements Banner {

	private static final Log logger = LogFactory.getLog(ResourceBanner.class);

	private Resource resource;

	public ResourceBanner(Resource resource) {
		Assert.notNull(resource, "Resource must not be null");
		Assert.isTrue(resource.exists(), "Resource must exist");
		this.resource = resource;
	}

	@Override
	public void printBanner(Class<?> sourceClass, PrintStream out) {
		try {
			String banner = StreamUtils.copyToString(this.resource.getInputStream(), Charset.forName(Global.getProperty("banner.charset", String.class,String.valueOf("UTF-8"))));

			for (PropertyResolver resolver : getPropertyResolvers(sourceClass)) {
				banner = resolver.resolvePlaceholders(banner);
			}
			out.println(banner);
		} catch (Exception ex) {
			logger.warn("Banner not printable: " + this.resource + " (" + ex.getClass() + ": '" + ex.getMessage() + "')", ex);
		}
	}

	protected List<PropertyResolver> getPropertyResolvers(Class<?> sourceClass) {
		List<PropertyResolver> resolvers = new ArrayList<PropertyResolver>();
		resolvers.add(getVersionResolver(sourceClass));
		resolvers.add(getTitleResolver(sourceClass));
		return resolvers;
	}

	private PropertyResolver getVersionResolver(Class<?> sourceClass) {
		MutablePropertySources propertySources = new MutablePropertySources();
		propertySources.addLast(new MapPropertySource("version", getVersionsMap(sourceClass)));
		return new PropertySourcesPropertyResolver(propertySources);
	}

	private Map<String, Object> getVersionsMap(Class<?> sourceClass) {
		String appVersion = getApplicationVersion(sourceClass);
		String bootVersion = getWxlVersion();
		Map<String, Object> versions = new HashMap<String, Object>();
		versions.put("application.version", getVersionString(appVersion, false));
		versions.put("wxl.version", getVersionString(bootVersion, false));
		versions.put("application.formatted-version", getVersionString(appVersion, true));
		versions.put("spring-boot.formatted-version", getVersionString(bootVersion, true));
		return versions;
	}

	protected String getApplicationVersion(Class<?> sourceClass) {
		Package sourcePackage = (sourceClass == null ? null : sourceClass.getPackage());
		return (sourcePackage == null ? null : sourcePackage.getImplementationVersion());
	}

	protected String getWxlVersion() {
		return WxlVersion.getVersion();
	}

	private String getVersionString(String version, boolean format) {
		if (version == null) {
			return "";
		}
		return (format ? " (v" + version + ")" : version);
	}

	private PropertyResolver getTitleResolver(Class<?> sourceClass) {
		MutablePropertySources sources = new MutablePropertySources();
		String applicationTitle = getApplicationTitle(sourceClass);
		Map<String, Object> titleMap = Collections.<String, Object>singletonMap("application.title", (applicationTitle == null ? "" : applicationTitle));
		sources.addFirst(new MapPropertySource("title", titleMap));
		return new PropertySourcesPropertyResolver(sources);
	}

	protected String getApplicationTitle(Class<?> sourceClass) {
		Package sourcePackage = (sourceClass == null ? null : sourceClass.getPackage());
		return (sourcePackage == null ? null : sourcePackage.getImplementationTitle());
	}

}
