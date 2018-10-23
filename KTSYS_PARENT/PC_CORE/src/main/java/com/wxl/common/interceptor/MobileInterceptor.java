package com.wxl.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wxl.common.utils.StringUtils;
import com.wxl.common.utils.UserAgentUtils;

/**
 * 手机端视图拦截器
 * 
 * @author wxl
 *
 */
public class MobileInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(MobileInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (modelAndView != null) {
			// 如果是手机或平板访问的话，则跳转到手机视图页面。
			if (UserAgentUtils.isMobileOrTablet(request) &&
					!StringUtils.startsWithIgnoreCase(modelAndView.getViewName(), "redirect:")) {
				logger.info("移动端访问：" + request.getRequestURI());
				modelAndView.setViewName("mobile/" + modelAndView.getViewName());
			} else {
				logger.info("PC端访问：" + request.getRequestURI());
			}
		} 
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

	}

}
