package com.wxl.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class OperLogInterceptor {
	
//	@Around("within(com.wxl.modules..*) && @annotation(operLog)")
	@Around("within(com.wxl.modules..*)")
	public Object doAroundMethod(ProceedingJoinPoint pjd) throws Throwable {
		long startTime = System.currentTimeMillis();// 开始时间

		Object[] params = pjd.getArgs();// 获取请求参数
		System.out.println("监听到传入参数为:");
		if(params != null && params.length > 0) {
			for (Object param : params) {
				System.out.println(param);
			}
		}

		// ###################上面代码为方法执行前#####################
		Object result = pjd.proceed();// 执行方法，获取返回参数
		// ###################下面代码为方法执行后#####################
		System.out.println("返回参数为:" + result);

//		String operType = operLog.operType();// 操作类型

		long endTime = System.currentTimeMillis();// 结束时间
		float excTime = (float) (endTime - startTime) / 1000;
		System.out.println("执行时间:" + excTime + "s");
		System.out.println("#######################分隔符##########################");
		return result;

	}
}
