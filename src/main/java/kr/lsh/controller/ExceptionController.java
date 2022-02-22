package kr.lsh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.lsh.vo.PageMaker;

@ControllerAdvice
public class ExceptionController {
	private static final Logger log = LoggerFactory.getLogger(ExceptionController.class);
	
	@ExceptionHandler( Exception.class)
	private PageMaker error(Exception e) {
		
		PageMaker pagemaker= new PageMaker();
		return pagemaker; 
	}
	}

