package com.wxl.common.filter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 重写文件拦截器
 * <pre>ueditor和spring本身的文件拦截器冲突，重写若是ueditor则不处理</pre>
 * 
 * @author Liang
 *
 */
public class UEditorMultipartResolver extends CommonsMultipartResolver {

	@Override
    public boolean isMultipart(HttpServletRequest request) {
        String url = request.getRequestURI();
        if (url!=null && url.contains("/sys/ueditor/")) {
            return false;
        } else {
            return super.isMultipart(request);
        }
    }
}
