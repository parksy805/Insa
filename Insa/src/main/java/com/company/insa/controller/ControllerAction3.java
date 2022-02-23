package com.company.insa.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

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
