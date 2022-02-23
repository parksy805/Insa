package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PostMapping;

@ControllerAdvice
@Controller
public class ControllerAction3 {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 수정
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@PostMapping("/UPDATE.do")
	public String UPDATE() {

		return "redirect:/INSA3.do"; 
	}

}
