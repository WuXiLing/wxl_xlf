package com.wxl.common.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

//@Component
//@Aspect // 定义切面
public class LogAop {

	/**
	 * 定义切入点
	 * 
	 */
	// @Pointcut("execution(public * *(..))")//任何public方法
	// @Pointcut("execution(* set*(..))")//任何set开头方法
	// @Pointcut("execution(*
	// com.xyz.service.AccountService.*(..))")//AccountService接口声明的任何方法
	// @Pointcut("execution(*
	// com.xyz.service.*.*(..))")//com.xyz.service包中声明的任何方法
	// @Pointcut("execution(*
	// com.xyz.service..*.*(..))")//com.xyz.service包及子包中声明的任何方法
	// @Pointcut("within(com.xyz.service.*)")//com.xyz.service包中的任意类
	 @Pointcut("within(com.wxl.modules..*)")//com.xyz.service包及子包中的任意类
	// @Pointcut("this(com.xyz.service.AccountService)")//实现了com.xyz.service.AccountService接口的代理对象，如果不是接口，则限定这个类
	// @Pointcut("target(com.xyz.service.AccountService)")//实现com.xyz.service.AccountService的接口的目标对象
	// @Pointcut("args(java.io.Serializable)")//参数为java.io.Serializable的连接点
	// @Pointcut("@target(org.springframework.transaction.annotation.Transactional)")//有注解Transactional方法
	// @Pointcut("@within(org.springframework.transaction.annotation.Transactional)")//有注解Transactional方法
	// @Pointcut("@annotation(org.springframework.transaction.annotation.Transactional)")//有注解Transactional方法
	// @Pointcut("@args(com.xyz.security.Classified)")//有注解Classified参数
	// @Pointcut("bean(tradeService)")//任何一个在名为 tradeService 的 Spring bean
	// 之上的连接点 （在 Spring AOP 中只是方法执行）
	// @Pointcut("bean(*Service)")//任何一个在名字匹配通配符表达式*Service的 Spring bean 之上的连接点
	// （在 Spring AOP 中只是方法执行）
//	@Pointcut("execution(public * *(..))")
	public void pointcut() {

	}

	@Before("pointcut()")
	public void before() {

		System.out.println("方法前执行");
	}

	@After("pointcut()")
	public void after() {
		System.out.println("方法后执行");
	}

	@Around("pointcut()")
	public void Around() {

	}
}
