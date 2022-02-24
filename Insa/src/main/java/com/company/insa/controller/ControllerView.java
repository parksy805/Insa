package com.company.insa.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.insa.vo.InsaVo;


@ControllerAdvice
@Controller
public class ControllerView {
	
	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : ControllerVIew 화면 호출
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	
	@GetMapping("/index.do")
	public String index() {
		return "index";
	}
	
	//Resolver때문에 jsp이름과 매핑주소가 헷갈릴수 있으니까 모든URL매핑주소에는 ".do"를 추가하기
	
	@RequestMapping("/inputForm.do") // 직원 정보 등록 화면이동
	public String inputForm(Model m) {
		m.addAttribute("sexList",						insaServiceImpl.sexList());				// 공통코드 성별
		m.addAttribute("emailList",						insaServiceImpl.emailList());			// 공통코드 이메일
		m.addAttribute("statusList", 					insaServiceImpl.statusList());			// 공통코드 입사여부
		m.addAttribute("putYnList", 					insaServiceImpl.putYnList());			// 공통코드 투입여부
		m.addAttribute("deptList", 						insaServiceImpl.deptList());			// 공통코드 부서
		m.addAttribute("positionList", 					insaServiceImpl.positionList());		// 공통코드 직위
		m.addAttribute("jobTypeList", 					insaServiceImpl.jobTypeList());			// 공통코드 직종
		m.addAttribute("milYnList", 					insaServiceImpl.milYnList());			// 공통코드 입대여부
		m.addAttribute("milTypeList",					insaServiceImpl.milTypeList());			// 공통코드 군별
		m.addAttribute("milLevelList",					insaServiceImpl.milLevelList());		// 공통코드 계급
		m.addAttribute("kosaYnList",					insaServiceImpl.kosaYnList());			// 공통코드 kosa여부
		m.addAttribute("kosaLevelList",					insaServiceImpl.kosaLevelList());		// 공통코드 kosa등급
		m.addAttribute("grdLevelList",					insaServiceImpl.grdLevelList());		// 공통코드 최종학력
		
		return "insa/inputForm"; // 원래는 return "/WEB-INF/view/insaInputForm.jsp;"
	}
	
	@RequestMapping("/listForm.do") // 직원 조회 화면이동
	public String listFormdo(Model m) {
		m.addAttribute("statusList", 					insaServiceImpl.statusList());			// 공통코드 입사여부
		m.addAttribute("putYnList", 					insaServiceImpl.putYnList());			// 공통코드 투입여부
		m.addAttribute("positionList", 					insaServiceImpl.positionList());		// 공통코드 직위
		m.addAttribute("jobTypeList", 					insaServiceImpl.jobTypeList());			// 공통코드 직종
		return "insa/listForm";
	}
	
	@GetMapping("/insaPage.do") // 직원 정보 수정 화면이동
	public String insaUpdateForm(InsaVo vo, Model m, HttpServletRequest request) throws Exception {
		
		
		
		return "insa/INSA3";
	}

	@GetMapping(value = "/test.do")
	public String test() {
		return "test";
	}
	
//	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
//	public String testfn(Model m) {
//		String str = insaServiceImpl.testfn();
//		System.out.println("testfn() : " + insaServiceImpl.testfn());
//		m.addAttribute("testfn", insaServiceImpl.testfn());
//		return "main";
//	}

}
