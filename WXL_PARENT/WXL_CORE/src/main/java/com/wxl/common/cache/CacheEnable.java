package com.wxl.common.cache;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CacheEnable {

	String cacheNames() default "";
<<<<<<< HEAD
	
	//一天((((1000毫秒*60)秒*60)分*60)小时)天
	long expiretime() default 1000*60*60*60*24;
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
}
