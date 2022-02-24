package com.company.insa.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

@ControllerAdvice
@Controller
public class ControllerAction1_input {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 저장
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@ResponseBody
    @RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
    public int idCheck(String id){
        int result = insaServiceImpl.idCheck(id);
        return result;
    }
	
	@RequestMapping(value = "/input.do", method = RequestMethod.POST)
	public String input(InsaVo vo, HttpServletRequest request, RedirectAttributes re) throws Exception {
		// InsaVo vo : [가져온 value] INSA1 <form> name=""으로 넘어온 value들
		// RedirectAttributes re: [보낼 value] Model m은 1번 데이터전송하면 사라짐. 이걸 쓰면 사라지지 않음
		// HttpServletRequest request : MultipartFile 업로드파일 저장용

		// *********************************************************
		// * 사번 설정 (입사년월4자리 + 부서코드2자리 + 시퀀스3자리)
		// *********************************************************
		// ● 사번 생성용 - 입사년월
		String agentNoYear = vo.getJoinDate().substring(2, 4);			//입사년도. substring(인덱스0부터시작,끝낼 자릿수)
		String agentNoMonth = vo.getJoinDate().substring(5, 7);			//입사월. 하이픈까지생각해서자르기
		
		// ● 사번 생성용 - 부서코드
		String agentNoDeptCode = null;
		if (vo.getDept().equals("")) {					// 부서 선택안함. <option value="">라면, (주소말고 value값 자체 비교<- 꼭 기억)
			agentNoDeptCode = "00";					 	// code="00"으로 설정
		} else {										// 부서 선택함.
			InsaComVo comvo = new InsaComVo();			//새로운 InsaComVO 생성
			comvo.setName(vo.getDept());				// 그 객체에 '선택한 부서(name)'을 저장
			agentNoDeptCode = insaServiceImpl.getAgentNoDeptCode(comvo).substring(1, 3);	
		}												//insaComVo의 name으로 insaComVo의 code 호출
		
		// ● 사번 생성용 - 시퀀스
		String agentNoSeq = insaServiceImpl.getSeqAgentNo().substring(1, 4);
		
		// ● 사번 = 입사년월+부서코드+시퀀스
		vo.setAgentNo(agentNoYear + agentNoMonth + agentNoDeptCode + agentNoSeq);
		
		// *********************************************************
		// * 데이터 setter
		// * 주민번호:hidden으로 받아와야하는데 js 아직이라 임시
		// * 이메일: email1 + @ + email2 로 Database email에 하나로 저장
		// * 군필,KOSA : "N"으로 "disalbed"처리 됐을때 추가로 null 설정
		// *********************************************************
		// ● 주민번호 임시 설정
		//vo.setRegNo("1234561234567");
		
		// ● email = email1 + email2
		vo.setEmail(vo.getEmail1() + "@" + vo.getEmail2());
		
		// ● 군필,KOSA : 공백이거나, "N"이면
		if (vo.getMilYn().equals("") || vo.getMilYn().equals("N") ) {
			vo.setMilType("");
			vo.setMilLevel("");
			vo.setMilStartDate("");
			vo.setMilEndDate("");
		}
		if (vo.getKosaYn().equals("") || vo.getKosaYn().equals("N") ) {
			vo.setKosaLevel("");
		}
		
		
		// *********************************************************
		// * 임시 사진 파일명 setter (일단 null값) // profileImgName은 따로 설정해야함
		// *********************************************************
		// vo.setBiaRegImgName("");
		// vo.setCarrierImgName("");
		// vo.setProfileImgName("");
		// *********************************************************
		// * 프로필(증명사진) 업로드파일 setter
		// *********************************************************
		MultipartFile profileFile = vo.getProfileFile(); 												// 업로드파일 호출
		String path = request.getSession().getServletContext().getRealPath("/uploadImages/profile/");	// 저장경로

		// ● 1. 파일 업로드가 있을 경우
		if( !profileFile.isEmpty() ) {
			String fileName = profileFile.getOriginalFilename();										// 업로드파일 "파일명.확장자" 호출
			File file = new File(path + fileName);														// File객체 생성해서 새로 저장

			// 1.1 파일 업로드가 있는데, 같은 이름이 있을 경우->날짜시간 추가한 fileName 다시 초기화.
			if (file.exists()) {
				String onlyFileName = fileName.substring(0, fileName.indexOf("."));
				// .indexOf( "처음~해당부분까지" ) : 처음부터 ~ "."이 뜨는 곳까지 자름. 이 경우, 확장자 전까지
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH");							// 받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName.substring(fileName.indexOf("."));							// .jpg, .png 부분
				fileName = onlyFileName + "_" + date + extension; 										// [파일명_오늘날짜.확장자] 최종파일명
			}

			// fileName setting됐으면 File 전송하기
			vo.setProfileFileName(fileName);															// Database에 저장할 fileName
			profileFile.transferTo(new File(path + fileName));

		} // ● 2. 파일 업로드가 없을 경우
		else {
			vo.setProfileFileName("default_profile.jpg");												// Database에 저장할 fileName
		}
		// *********************************************************
		// * 사업자등록증 업로드파일 setter
		// *********************************************************
		MultipartFile cmp_reg_img_file = vo.getCmpFile();												// 업로드된 파일 호출
		String path2 = request.getSession().getServletContext().getRealPath("/uploadImages/cmp/");		// 저장경로

		// ● 1. 파일 업로드가 있을 경우
		if( !cmp_reg_img_file.isEmpty() ) {
			String fileName = cmp_reg_img_file.getOriginalFilename();									// 업로드파일 "파일명.확장자" 호출
			File file = new File(path2 + fileName);														// File객체 생성해서 새로 저장

			// 1.1 파일 업로드가 있는데, 같은 이름이 있을 경우->날짜시간 추가한 fileName 다시 초기화.
			if (file.exists()) {
				String onlyFileName = fileName.substring(0, fileName.indexOf("."));
				// .indexOf( "처음~해당부분까지" ) : 처음부터 ~ "."이 뜨는 곳까지 자름. 이 경우, 확장자 전까지
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); 							// 받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName.substring(fileName.indexOf("."));							// .jpg, .png 부분
				fileName = onlyFileName + "_" + date + extension; 										// [파일명_오늘날짜.확장자] 최종파일명
			}

			// fileName setting됐으면 File 전송하기
			vo.setCmpFileName(fileName); 																// Database에 저장할 fileName
			cmp_reg_img_file.transferTo(new File(path2 + fileName));

		} // ● 2. 파일 업로드가 없을 경우
		else {
			vo.setCmpFileName("default_cmp.jpg"); 														// Database에 저장할 fileName
		}
		// *********************************************************
		// * 이력서 업로드파일 setter
		// *********************************************************
		MultipartFile carrier_file = vo.getCarrierFile();												// 업로드된 파일 호출
		String path3 = request.getSession().getServletContext().getRealPath("/uploadImages/carrier/");	// 저장경로

		// ● 1. 파일 업로드가 있을 경우
		if( !carrier_file.isEmpty() ) {
			String fileName = carrier_file.getOriginalFilename();										// "파일명.확장자" 호출
			File file = new File(path3 + fileName);														// File객체 생성해서 새로 저장

			// 1.1 파일 업로드가 있는데, 같은 이름이 있을 경우->날짜시간 추가한 fileName 다시 초기화.
			if (file.exists()) {
				String onlyFileName = fileName.substring(0, fileName.indexOf("."));
				// .indexOf( "처음~해당부분까지" ) : 처음부터 ~ "."이 뜨는 곳까지 자름. 이 경우, 확장자 전까지
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); 							// 받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName.substring(fileName.indexOf("."));							// .jpg, .png 부분
				fileName = onlyFileName + "_" + date + extension; 										// [파일명_오늘날짜.확장자] 최종파일명
			}

			// fileName setting됐으면 File 전송하기
			vo.setCarrierFileName(fileName);															// Database에 저장할 fileName
			carrier_file.transferTo(new File(path3 + fileName));

		} // ● 2. 파일 업로드가 없을 경우
		else {
			vo.setCarrierFileName("default_carrier.jpg");												// Database에 저장할 fileName
		}
		
		// *********************************************************
		// * 직원 정보 저장
		// *********************************************************
		insaServiceImpl.input(vo); 															// InputForm의 데이터를 name=""으로 매핑해서 insert함
		re.addFlashAttribute("agentNo", vo.getAgentNo());
		re.addFlashAttribute("inputVo", vo);
		re.addFlashAttribute("success", "저장에 성공하였습니다.");

		return "redirect:/inputForm.do"; 														// "redirect:/이동할 주소" // 직원 정보 등록 화면이동
	}

}
