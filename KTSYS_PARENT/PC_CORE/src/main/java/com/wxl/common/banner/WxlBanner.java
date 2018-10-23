package com.wxl.common.banner;

import java.io.PrintStream;

import com.wxl.common.banner.ansi.AnsiColor;
import com.wxl.common.banner.ansi.AnsiOutput;
import com.wxl.common.banner.ansi.AnsiStyle;
import com.wxl.common.config.WxlVersion;

/**
 * 默认的banner
 * 
 * @author wxl
 *
 */
public class WxlBanner implements Banner {

	private static final String[] BANNER = { "",
			"                                                                ",
			"\r==============================================================",
			"\r                    螃蟹在剥我的壳，笔记本在写我。                                                 ",
			"\r                      漫天的我落在枫叶上，雪花上                                                    ",
			"\r                            而你在想我                                                                   ",
			"\r==============================================================\r",
			"                                                                " };

	private static final String WXL_BOOT = " :: WXL :: ";

	private static final int STRAP_LINE_SIZE = 42;

	@Override
	public void printBanner( Class<?> sourceClass,
			PrintStream printStream) {
		for (String line : BANNER) {
			printStream.println(line);
		}
		String version = WxlVersion.getVersion();
		version = (version == null ? "" : " (v" + version + ")");
		String padding = "";
		while (padding.length() < STRAP_LINE_SIZE
				- (version.length() + WXL_BOOT.length())) {
			padding += " ";
		}

		printStream.println(AnsiOutput.toString(AnsiColor.GREEN, WXL_BOOT,
				AnsiColor.DEFAULT, padding, AnsiStyle.FAINT, version));
		printStream.println();
	}
}
