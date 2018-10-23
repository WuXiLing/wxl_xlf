package com.wxl.common.aop;

<<<<<<< HEAD
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

<<<<<<< HEAD
/**
 * 统计方法执行时间
 * 
 * @author Liang
 *
 */
=======
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
@Aspect
@Component
public class OperLogInterceptor {
	
<<<<<<< HEAD
	protected static final Log logger = LogFactory.getLog(OperLogInterceptor.class);

//	@Around("within(com.wxl.modules..*) && @annotation(operLog)")
	@Around("within(com.wxl.modules..*)")
	public Object doAroundMethod(ProceedingJoinPoint pjd) throws Throwable {
		long startTime = System.nanoTime();// 开始时间

//		Object[] params = pjd.getArgs();// 获取请求参数
//		System.out.println("监听到传入参数为:");
//		if(params != null && params.length > 0) {
//			for (Object param : params) {
//				System.out.println(param);
//			}
//		}
		
=======
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
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502

		// ###################上面代码为方法执行前#####################
		Object result = pjd.proceed();// 执行方法，获取返回参数
		// ###################下面代码为方法执行后#####################
<<<<<<< HEAD
//		System.out.println("返回参数为:" + result);

//		String operType = operLog.operType();// 操作类型
		long endTime = System.nanoTime();// 结束时间
		long excTime = endTime - startTime;
		logger.debug(pjd.getClass().getName() + "." + pjd.getSignature().getName() + ":" + excTime + " ns");
=======
		System.out.println("返回参数为:" + result);

//		String operType = operLog.operType();// 操作类型

		long endTime = System.currentTimeMillis();// 结束时间
		float excTime = (float) (endTime - startTime) / 1000;
		System.out.println("执行时间:" + excTime + "s");
		System.out.println("#######################分隔符##########################");
>>>>>>> 9188de5855b76d90d98766e10b924bfccbd8f502
		return result;

	}
}
