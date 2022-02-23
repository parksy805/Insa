package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;

@ControllerAdvice
@Controller
public class ControllerAction2 {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 조회
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@GetMapping("/SELECT.do")
	public String SELECT() {

		return "redirect:/INSA2.do"; 
	}

}
