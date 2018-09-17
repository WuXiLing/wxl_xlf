package com.wxl.common.filter;

import java.lang.reflect.Method;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wxl.modules.sys.user.presistence.entity.User;
import com.wxl.modules.sys.utils.UserUtils;

/**
 * 防止重复提交拦截器
 * 
 * @author Liang
 *
 */
public class AvoidDuplicateSubmissionInterceptor extends HandlerInterceptorAdapter {

	public static Logger logger = Logger.getLogger(AvoidDuplicateSubmissionInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		User user = UserUtils.getUser();
		if (user != null) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Method method = handlerMethod.getMethod();
			Token annotation = method.getAnnotation(Token.class);
			if (annotation != null) {
				boolean needSaveSession = annotation.save();
				if (needSaveSession) {
					request.getSession(true).setAttribute("token", UUID.randomUUID().toString());
				}
				boolean needRemoveSession = annotation.remove();
				if (needRemoveSession) {
					if (isRepeatSubmit(request)) {
						logger.warn("please don't repeat submit,[user:" + user.getLoginName() + ",url:"
								+ request.getServletPath() + "]");
						return false;
					}
					request.getSession(false).removeAttribute("token");
				}
			}
		}
		return true;
	}

	public boolean isRepeatSubmit(HttpServletRequest request) {
		String serverToken = (String) request.getSession(true).getAttribute("token");

		if (serverToken == null) {
			return true;
		}
		String clientToken = request.getParameter("token");
		;
		if (clientToken == null) {
			return true;
		}
		if (!serverToken.equals(clientToken)) {
			return true;
		}
		return false;
	}
}
