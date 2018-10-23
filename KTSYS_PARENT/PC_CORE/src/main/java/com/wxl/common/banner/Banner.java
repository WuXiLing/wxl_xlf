package com.wxl.common.banner;

import java.io.PrintStream;

public interface Banner {

	/**
	 * Print the banner to the specified print stream.
	 * @param environment the spring environment
	 * @param sourceClass the source class for the application
	 * @param out the output print stream
	 */
	void printBanner(Class<?> sourceClass, PrintStream out);

	/**
	 * An enumeration of possible values for configuring the Banner.
	 */
	enum Mode {

		/**
		 * Disable printing of the banner.
		 */
		OFF,

		/**
		 * Print the banner to System.out.
		 */
		CONSOLE,

		/**
		 * Print the banner to the log file.
		 */
		LOG

	}

}
