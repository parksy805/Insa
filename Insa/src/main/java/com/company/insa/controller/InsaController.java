package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsaController {
	
	@Autowired
	InsaServiceImpl insaServiceImpl;
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String testfn(Model m) {
		String str = insaServiceImpl.testfn();
		System.out.println("testfn() : " + insaServiceImpl.testfn());
		m.addAttribute("testfn", insaServiceImpl.testfn());
		return "main";
	}

}
