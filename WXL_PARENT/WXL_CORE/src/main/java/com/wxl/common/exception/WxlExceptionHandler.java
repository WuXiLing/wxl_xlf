package com.wxl.common.exception;

import java.io.IOException;

import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.ui.Model;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wxl.common.rest.ResponseFormat;
import com.wxl.common.rest.RestReponseMsg;

/**
 * 异常增强
 * 
 * @author Liang
 *
 */
@ControllerAdvice
public class WxlExceptionHandler {

	@ModelAttribute
	public void addAttributes(Model model) {
		model.addAttribute("author", "wxl");
	}

	// 运行时异常
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public RestReponseMsg runtimeExceptionHandler(RuntimeException ex) {
		return ResponseFormat.retParam(1000, ex.getMessage());
	}

	// 空指针异常
	@ExceptionHandler(NullPointerException.class)
	@ResponseBody
	public RestReponseMsg nullPointerExceptionHandler(NullPointerException ex) {
		return ResponseFormat.retParam(1001, ex.getLocalizedMessage());
	}

	// 类型转换异常
	@ExceptionHandler(ClassCastException.class)
	@ResponseBody
	public RestReponseMsg classCastExceptionHandler(ClassCastException ex) {
		return ResponseFormat.retParam(1002, ex.getMessage());
	}

	// IO异常
	@ExceptionHandler(IOException.class)
	@ResponseBody
	public RestReponseMsg iOExceptionHandler(IOException ex) {
		return ResponseFormat.retParam(1003, ex.getMessage());
	}

	// 未知方法异常
	@ExceptionHandler(NoSuchMethodException.class)
	@ResponseBody
	public RestReponseMsg noSuchMethodExceptionHandler(NoSuchMethodException ex) {
		return ResponseFormat.retParam(1004, ex.getMessage());
	}

	// 数组越界异常
	@ExceptionHandler(IndexOutOfBoundsException.class)
	@ResponseBody
	public RestReponseMsg indexOutOfBoundsExceptionHandler(IndexOutOfBoundsException ex) {
		return ResponseFormat.retParam(1005, ex.getMessage());
	}

	// 400错误
	@ExceptionHandler({HttpMessageNotReadableException.class})
	@ResponseBody
	public RestReponseMsg requestNotReadable(HttpMessageNotReadableException ex) {
		return ResponseFormat.retParam(400, ex.getMessage());
	}

	// 400错误
	@ExceptionHandler({TypeMismatchException.class})
	@ResponseBody
	public RestReponseMsg requestTypeMismatch(TypeMismatchException ex) {
		return ResponseFormat.retParam(400, ex.getMessage());
	}

	// 400错误
	@ExceptionHandler({MissingServletRequestParameterException.class})
	@ResponseBody
	public RestReponseMsg requestMissingServletRequest(MissingServletRequestParameterException ex) {
		return ResponseFormat.retParam(400, ex.getMessage());
	}

	// 405错误
	@ExceptionHandler({HttpRequestMethodNotSupportedException.class})
	@ResponseBody
	public RestReponseMsg request405() {
		return ResponseFormat.retParam(405, null);
	}

	// 406错误
	@ExceptionHandler({HttpMediaTypeNotAcceptableException.class})
	@ResponseBody
	public RestReponseMsg request406() {
		return ResponseFormat.retParam(406, null);
	}

	// 500错误
	@ExceptionHandler({ConversionNotSupportedException.class, HttpMessageNotWritableException.class})
	@ResponseBody
	public RestReponseMsg server500(RuntimeException ex) {
		return ResponseFormat.retParam(406, ex.getMessage());
	}
}
