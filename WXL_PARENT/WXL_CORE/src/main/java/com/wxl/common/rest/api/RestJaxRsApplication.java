package com.wxl.common.rest.api;

import org.glassfish.jersey.jackson.JacksonFeature;
import org.glassfish.jersey.jackson.internal.jackson.jaxrs.json.JacksonJsonProvider;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.spring.scope.RequestContextFilter;

public class RestJaxRsApplication extends ResourceConfig {

	public RestJaxRsApplication() { 
//		packages("com.wxl.modules.**.rest");
		register(JacksonFeature.class);
		register(JacksonJsonProvider.class);
		register(RequestContextFilter.class);
	}
}
