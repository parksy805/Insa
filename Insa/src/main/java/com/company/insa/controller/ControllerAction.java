package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

@ControllerAdvice
@Controller
public class ControllerAction {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : Controller Action 기능 호출
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@PostMapping("/INSERT.do")
	public String INSERT(InsaVo vo, RedirectAttributes re) {
		// InsaVo vo : [가져온 value] INSA1 <form> name=""으로 넘어온 value들
		// RedirectAttributes : [보낼 value] Model m은 1번 데이터전송하면 사라짐. 이걸 쓰면 사라지지 않음
		
		// *********************************************************
		// * 사번 설정 (입사년월4자리 + 부서코드2자리 + 시퀀스3자리)
		// *********************************************************
		//사번 생성용 - 입사년월
		String agentNoYear = vo.getJoinDate().substring(2, 4);
		String agentNoMonth = vo.getJoinDate().substring(5,7);
		//사번 생성용 - 부서코드
		String agentNoDeptCode = null;
		if (vo.getDept().equals("")) {
			agentNoDeptCode = "00";
		} else {
			InsaComVo comvo = new InsaComVo();
			comvo.setName(vo.getDept());
			agentNoDeptCode = insaServiceImpl.getAgentNoDeptCode(comvo).substring(1,3);
		}
		//사번 생성용 - 시퀀스
		String agentNoSeq = insaServiceImpl.getSeqAgentNo().substring(1,4);
		// 입사년월+부서코드+시퀀스
		vo.setAgentNo(agentNoYear + agentNoMonth + agentNoDeptCode + agentNoSeq);
		
		// *********************************************************
		// * 데이터 setter
		// * 주민번호:hidden으로 받아와야하는데 js 아직이라 임시
		// * 이메일: email1 + @ + email2 로 Database email에 하나로 저장
		// *********************************************************
		vo.setRegNo("1234561234567");
		vo.setEmail(vo.getEmail1()+"@"+vo.getEmail2());
		// *********************************************************
		// * 사진 파일명 저장 (일단 null값) // profileImgName은 따로 설정해야함
		// *********************************************************
		//vo.setBiaRegImgName("");
		//vo.setCarrierImgName("");
		//vo.setProfileImgName("");
		// *********************************************************
		// * 직원 정보 저장
		// *********************************************************
		insaServiceImpl.agentInsert(vo); // InputForm의 데이터를 name=""으로 매핑해서 insert함
		re.addFlashAttribute("sabun", vo.getAgentNo());
		re.addFlashAttribute("InputVO", vo);
		re.addFlashAttribute("success", "저장에 성공하였습니다.");
		
		return "redirect:/INSA1.do"; // "redirect:/이동할 주소" // 직원 정보 등록 화면이동
	}

}
