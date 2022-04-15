package com.priyanshu.myexception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyException {

	
	@ExceptionHandler(Exception.class)
	public String allExceptionHandler(Model m,Exception e) {
		m.addAttribute("error", e.getMessage());
		return "myerrorpage";
	}
}
