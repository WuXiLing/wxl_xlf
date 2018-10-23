package com.wxl.common.exception;

import java.io.IOException;

import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

//
@ControllerAdvice
public class RestExceptionHandler {

	// 运行时异常
	@ExceptionHandler(RuntimeException.class)
	@ResponseBody
	public String runtimeExceptionHandler(RuntimeException runtimeException) {
		return ReturnFormat.retParam(1000, null);
	}

	// 空指针异常
	@ExceptionHandler(NullPointerException.class)
	@ResponseBody
	public String nullPointerExceptionHandler(NullPointerException ex) {
		return ReturnFormat.retParam(1001, null);
	}

	// 类型转换异常
	@ExceptionHandler(ClassCastException.class)
	@ResponseBody
	public String classCastExceptionHandler(ClassCastException ex) {
		return ReturnFormat.retParam(1002, null);
	}

	// IO异常
	@ExceptionHandler(IOException.class)
	@ResponseBody
	public String iOExceptionHandler(IOException ex) {
		return ReturnFormat.retParam(1003, null);
	}

	// 未知方法异常
	@ExceptionHandler(NoSuchMethodException.class)
	@ResponseBody
	public String noSuchMethodExceptionHandler(NoSuchMethodException ex) {
		return ReturnFormat.retParam(1004, null);
	}

	// 数组越界异常
	@ExceptionHandler(IndexOutOfBoundsException.class)
	@ResponseBody
	public String indexOutOfBoundsExceptionHandler(IndexOutOfBoundsException ex) {
		return ReturnFormat.retParam(1005, null);
	}

	// 400错误
	@ExceptionHandler({HttpMessageNotReadableException.class})
	@ResponseBody
	public String requestNotReadable(HttpMessageNotReadableException ex) {
		return ReturnFormat.retParam(400, null);
	}

	// 400错误
	@ExceptionHandler({TypeMismatchException.class})
	@ResponseBody
	public String requestTypeMismatch(TypeMismatchException ex) {
		return ReturnFormat.retParam(400, null);
	}

	// 400错误
	@ExceptionHandler({MissingServletRequestParameterException.class})
	@ResponseBody
	public String requestMissingServletRequest(MissingServletRequestParameterException ex) {
		return ReturnFormat.retParam(400, null);
	}

	// 405错误
	@ExceptionHandler({HttpRequestMethodNotSupportedException.class})
	@ResponseBody
	public String request405() {
		return ReturnFormat.retParam(405, null);
	}

	// 406错误
	@ExceptionHandler({HttpMediaTypeNotAcceptableException.class})
	@ResponseBody
	public String request406() {
		return ReturnFormat.retParam(406, null);
	}

	// 500错误
	@ExceptionHandler({ConversionNotSupportedException.class, HttpMessageNotWritableException.class})
	@ResponseBody
	public String server500(RuntimeException runtimeException) {
		return ReturnFormat.retParam(406, null);
	}
}
