package com.wxl.common.provider.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class HandlerExceptionController {

	@ExceptionHandler({Exception.class})
    public ModelAndView TestExceptionHandlerExceptionResolver(Exception ex){
        System.out.println("03----ControllerAdvice出异常了："+ex);
        ModelAndView model = new ModelAndView("error");
        model.addObject("exception", ex);
        return model;
    }
}
