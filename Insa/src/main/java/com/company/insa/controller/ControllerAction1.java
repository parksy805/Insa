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
public class ControllerAction1 {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 저장
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@PostMapping("/INSERT.do")
	public String INSERT(InsaVo vo, HttpServletRequest request, RedirectAttributes re) throws Exception {
		// InsaVo vo : [가져온 value] INSA1 <form> name=""으로 넘어온 value들
		// RedirectAttributes re: [보낼 value] Model m은 1번 데이터전송하면 사라짐. 이걸 쓰면 사라지지 않음
		// HttpServletRequest request : MultipartFile 업로드파일 저장용

		// *********************************************************
		// * 사번 설정 (입사년월4자리 + 부서코드2자리 + 시퀀스3자리)
		// *********************************************************
		// 사번 생성용 - 입사년월
		String agentNoYear = vo.getJoinDate().substring(2, 4);
		String agentNoMonth = vo.getJoinDate().substring(5, 7);
		// 사번 생성용 - 부서코드
		String agentNoDeptCode = null;
		if (vo.getDept().equals("")) {
			agentNoDeptCode = "00";
		} else {
			InsaComVo comvo = new InsaComVo();
			comvo.setName(vo.getDept());
			agentNoDeptCode = insaServiceImpl.getAgentNoDeptCode(comvo).substring(1, 3);
		}
		// 사번 생성용 - 시퀀스
		String agentNoSeq = insaServiceImpl.getSeqAgentNo().substring(1, 4);
		// 입사년월+부서코드+시퀀스
		vo.setAgentNo(agentNoYear + agentNoMonth + agentNoDeptCode + agentNoSeq);

		// *********************************************************
		// * 데이터 setter
		// * 주민번호:hidden으로 받아와야하는데 js 아직이라 임시
		// * 이메일: email1 + @ + email2 로 Database email에 하나로 저장
		// *********************************************************
		vo.setRegNo("1234561234567");
		vo.setEmail(vo.getEmail1() + "@" + vo.getEmail2());
		// *********************************************************
		// * 임시 사진 파일명 setter (일단 null값) // profileImgName은 따로 설정해야함
		// *********************************************************
		// vo.setBiaRegImgName("");
		// vo.setCarrierImgName("");
		// vo.setProfileImgName("");

		// *********************************************************
		// * 업로드파일 setter
		// *********************************************************
		MultipartFile profileImg = vo.getProfileImg();// 업로드된 파일 호출
		String path = request.getSession().getServletContext().getRealPath("/img/profile/");// 저장경로

		// ********** 1. 파일 업로드가 있을 경우
		if (!profileImg.isEmpty()) {
			String fileName = profileImg.getOriginalFilename();// "파일명.확장자" 호출
			File file = new File(path + fileName);// File객체 생성해서 새로 저장

			// 1.1 파일 업로드가 있는데, 같은 이름이 있을 경우->날짜시간 추가한 fileName 다시 초기화.
			if (file.exists()) {
				String onlyFileName = fileName.substring(0, fileName.indexOf("."));
				// .indexOf( "처음~해당부분까지" ) : 처음부터 ~ "."이 뜨는 곳까지 자름. 이 경우, 확장자 전까지
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); // 받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName.substring(fileName.indexOf("."));// .jpg, .png 부분
				fileName = onlyFileName + "_" + date + extension; // [파일명_오늘날짜.확장자] 최종파일명
			}

			// fileName setting됐으면 File 전송하기
			vo.setProfileImgName(fileName); // Database에 저장할 fileName
			profileImg.transferTo(new File(path + fileName));

		} // ********** 2. 파일 업로드가 없을 경우
		else {
			vo.setProfileImgName("default_profile.jpg"); // Database에 저장할 fileName
		}

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
