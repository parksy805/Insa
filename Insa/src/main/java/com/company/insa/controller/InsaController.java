package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsaController {
	
	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 화면 이동
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	@GetMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@GetMapping("/INSA1.do") // 직원 정보 등록 화면이동
	public String INSA1(Model m) {
		m.addAttribute("statusList",	insaServiceImpl.status());		// 공통함수:입사여부
		m.addAttribute("sexList",		insaServiceImpl.sex());			// 공통함수:성별
		m.addAttribute("emailList",		insaServiceImpl.email());		// 공통함수:이메일
		m.addAttribute("deptList",		insaServiceImpl.dept());		// 공통함수:부서
		m.addAttribute("positionList",	insaServiceImpl.position());	// 공통함수:직위
		m.addAttribute("jobTypeList",	insaServiceImpl.jobType());		// 공통함수:직종
		m.addAttribute("milYnList",		insaServiceImpl.milYn());		// 공통함수:입대여부
		m.addAttribute("milTypeList",	insaServiceImpl.milType());		// 공통함수:군별
		m.addAttribute("grdLevelList",	insaServiceImpl.grdLevel());	// 공통함수:최종학력
		m.addAttribute("kosaYnList",	insaServiceImpl.kosaYn());		// 공통함수:kosa여부
		m.addAttribute("kosClassList",	insaServiceImpl.kosClass());	// 공통함수:kosa등급
		return "insa/INSA1";
	}
	
	@GetMapping("/INSA2.do") // 직원 정보 조회 화면이동
	public String INSA2() {
		return "insa/INSA2";
	}
	
	@GetMapping("/INSA3.do") // 직원 정보 수정 화면이동
	public String INSA3() {
		return "insa/INSA3";
	}
//	*******************************************************
//	 * DESC : 함수 호출
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	
	
	
	
	
	
	
	
	
	
	
	
//	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
//	public String testfn(Model m) {
//		String str = insaServiceImpl.testfn();
//		System.out.println("testfn() : " + insaServiceImpl.testfn());
//		m.addAttribute("testfn", insaServiceImpl.testfn());
//		return "main";
//	}

}
