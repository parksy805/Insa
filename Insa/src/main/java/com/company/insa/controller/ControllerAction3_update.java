package com.company.insa.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.insa.vo.InsaVo;


@ControllerAdvice
@Controller
public class ControllerAction3_update {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 수정
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@PostMapping("/update.do")
	public String insaUpdate(InsaVo vo,Model m, RedirectAttributes ra, HttpServletRequest request) throws Exception  {
		System.out.println(vo.getAgentNo());
		
		// *********************************************************
		// * 데이터 setter
		// * 주민번호	: 주민번호 하이픈 뺀거로 저장
		// * 이메일		: email1 + @ + email2 로 Database email에 하나로 저장
		// * 연봉		: DB Salary는 Number라서 , 빼서 저장
		// * 군필,KOSA 	: "N"으로 "disalbed"처리 됐을때 추가로 null 설정
		// *********************************************************
		vo.setRegNo(vo.getRegNo().substring(0, 6) + "-" +vo.getRegNo().substring(7,14));
		vo.setEmail(vo.getEmail1()+"@"+vo.getEmail2());
		vo.setSalary(vo.getSalary().replace(",", "")  );
		
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
		// * 사진 수정
		// *********************************************************
		MultipartFile profile_file = vo.getProfileFile(); // 새로 업로드된 파일 선언(아직 있는지 없는지 모름)
		String path1 = request.getSession().getServletContext().getRealPath("/images/profile/");//저장할 경로 지정.webapp에서 시작
		if( !profile_file.isEmpty() ) { 					//새로 업로드된 파일이 있다면
			String fileName1 = profile_file.getOriginalFilename(); //[업로드파일명.jpg] 까지
			System.out.println("새로 업로드된 파일명 : " + fileName1);
			File file = new File(path1 + fileName1); 		//(경로와, 파일명)의 File 객체생성
			
			if(file.exists()) {								// 만약 업로드 파일과 같은 이름이 있다면
				String onlyFileName = fileName1.substring(0, fileName1.indexOf(".")); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); //받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName1.substring(fileName1.indexOf(".")); // .jpg  .png 등 .부터 뒤까지
				fileName1 = onlyFileName + "_"+ date + extension; //[파일명+오늘 날짜+확장자] 형태의 최종 파일명
			}
			if(!insaServiceImpl.getProfileFileNameByAgentNo(vo.getAgentNo()).equals("default_profile.png")) { // 만약 기존 사진이 디폴트가 아니면
				System.out.println("삭제할 기존 파일명 : " + insaServiceImpl.getProfileFileNameByAgentNo(vo.getAgentNo()));
				File delfile = new File(path1 + insaServiceImpl.getProfileFileNameByAgentNo(vo.getAgentNo()) ); // 삭제할 기존파일명 호출해서 새 객체 선언초기화.
				delfile.delete(); // 파일삭제
			}
			vo.setProfileFileName(fileName1); 						//아무튼 파일명을 DB에 저장
			System.out.println("새로 업로드된 파일명 : " + vo.getProfileFileName());
			profile_file.transferTo(new File(path1 + fileName1)); // (저장할 경로,저장할 파일명)//transferTo:예외처리해줘야함
		}
		else { 											//만약 업로드 파일이 없으면 기본 사진
			System.out.println("업로드 파일이 없음 : " + vo.getProfileFileName());
			vo.setProfileFileName(vo.getProfileFileName()); //기존 파일 그대로 유지
		}
		
		
		
		MultipartFile cmp_reg_img_file = vo.getCmpFile(); // 새로 업로드된 파일 선언(아직 있는지 없는지 모름)
		String path2 = request.getSession().getServletContext().getRealPath("/images/cmp_reg/");//저장할 경로 지정.webapp에서 시작
		if( !cmp_reg_img_file.isEmpty() ) { 					//새로 업로드된 파일이 있다면
			String fileName1 = cmp_reg_img_file.getOriginalFilename(); //[업로드파일명.jpg] 까지
			File file = new File(path2 + fileName1); 		//(경로와, 파일명)의 File 객체생성
			
			if(file.exists()) {								// 만약 업로드 파일과 같은 이름이 있다면
				String onlyFileName = fileName1.substring(0, fileName1.indexOf(".")); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); //받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName1.substring(fileName1.indexOf(".")); // .jpg  .png 등 .부터 뒤까지
				fileName1 = onlyFileName + "_"+ date + extension; //[파일명+오늘 날짜+확장자] 형태의 최종 파일명
			}
			if(!insaServiceImpl.getCmpFileNameByAgentNo(vo.getAgentNo()).equals("default_cmp.png")) { // 만약 기존 사진이 디폴트가 아니면
				File delfile = new File(path2 + insaServiceImpl.getCmpFileNameByAgentNo(vo.getAgentNo()) ); // 삭제할 기존파일명 호출해서 새 객체 선언초기화.
				delfile.delete(); // 파일삭제
			}
			vo.setCmpFileName(fileName1); 						//아무튼 파일명을 DB에 저장
			cmp_reg_img_file.transferTo(new File(path2 + fileName1)); // (저장할 경로,저장할 파일명)//transferTo:예외처리해줘야함
		}
		else { 											//만약 업로드 파일이 없으면 기본 사진
			vo.setCmpFileName(vo.getCmpFileName()); //기존 파일 그대로 유지
		}
		
		
		
		MultipartFile carrier_file = vo.getCarrierFile(); // 새로 업로드된 파일 선언(아직 있는지 없는지 모름)
		String path3 = request.getSession().getServletContext().getRealPath("/images/carrier/");//저장할 경로 지정.webapp에서 시작
		if( !carrier_file.isEmpty() ) { 					//새로 업로드된 파일이 있다면
			String fileName1 = carrier_file.getOriginalFilename(); //[업로드파일명.jpg] 까지
			File file = new File(path3 + fileName1); 		//(경로와, 파일명)의 File 객체생성
			
			if(file.exists()) {								// 만약 업로드 파일과 같은 이름이 있다면
				String onlyFileName = fileName1.substring(0, fileName1.indexOf(".")); 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH"); //받아올 날짜 포맷
				String date = sdf.format(new Date());
				String extension = fileName1.substring(fileName1.indexOf(".")); // .jpg  .png 등 .부터 뒤까지
				fileName1 = onlyFileName + "_"+ date + extension; //[파일명+오늘 날짜+확장자] 형태의 최종 파일명
			}
			if(!insaServiceImpl.getCarrierFileNameByAgentNo(vo.getAgentNo()).equals("default_carrier.png")) { // 만약 기존 사진이 디폴트가 아니면
				File delfile = new File(path3 + insaServiceImpl.getCarrierFileNameByAgentNo(vo.getAgentNo()) ); // 삭제할 기존파일명 호출해서 새 객체 선언초기화.
				delfile.delete(); // 파일삭제
			}
			vo.setCarrierFileName(fileName1); 						//아무튼 파일명을 DB에 저장
			carrier_file.transferTo(new File(path3 + fileName1)); // (저장할 경로,저장할 파일명)//transferTo:예외처리해줘야함
		}
		else { 											//만약 업로드 파일이 없으면 기본 사진
			vo.setCarrierFileName(vo.getCarrierFileName()); //기존 파일 그대로 유지
		}
		
		// *********************************************************
		// * 수정하기
		// *********************************************************
		insaServiceImpl.insaUpdate(vo);
		///////////////////////////////////////////////////////////DB 수정 끝
		
		
		// *********************************************************
		// * 사번으로 수정된 DB 레코드 가져오기 
		// *********************************************************
		//System.out.println(insaPage.toString());
		InsaVo insaPage = insaServiceImpl.insaPage(vo.getAgentNo()); //
		System.out.println(vo.getProfileFileName() + " <-insaPage 에서 확인");
		String email[] = insaPage.getEmail().split("@"); //email 분할
		insaPage.setEmail1(email[0]);
		insaPage.setEmail2(email[1]);
		
		insaPage.setJoinDate(insaPage.getJoinDate().substring(0,10)); //DB Date타입들 시간 제거
		if (insaPage.getRetireDate() != null) {
			insaPage.setRetireDate(insaPage.getRetireDate().substring(0,10));
		}
		if (insaPage.getMilStartDate() != null) {
			insaPage.setMilStartDate(insaPage.getMilStartDate().substring(0,10));
		}
		if (insaPage.getMilEndDate() != null) {
			insaPage.setMilEndDate(insaPage.getMilEndDate().substring(0,10));
		}
		
		if (insaPage.getSalary() != null) { //연봉 콤마 세자리씩
			DecimalFormat df = new DecimalFormat();
			df = new DecimalFormat("#,###"); //System.out.println(df.format(Integer.parseInt(insaPage.getSalary())));
			insaPage.setSalary(df.format(Integer.parseInt(insaPage.getSalary())));
		}
		m.addAttribute("insaPage",insaPage);
		//////////////////////////////////////////////출력용으로 수정된 DB 데이터 다시 jsp에 보내기
		
		// *********************************************************
		// * 공통코드 재출력
		// *********************************************************
		m.addAttribute("statusList", insaServiceImpl.statusList());
		m.addAttribute("sexList", insaServiceImpl.sexList());
		m.addAttribute("putYnList", insaServiceImpl.putYnList());
		m.addAttribute("emailList", insaServiceImpl.emailList());
		m.addAttribute("deptList", insaServiceImpl.deptList());
		m.addAttribute("jobTypeList", insaServiceImpl.jobTypeList());
		m.addAttribute("positionList", insaServiceImpl.positionList());
		m.addAttribute("milYnList", insaServiceImpl.milYnList());
		m.addAttribute("milTypeList", insaServiceImpl.milTypeList());
		m.addAttribute("milLevelList", insaServiceImpl.milLevelList());
		m.addAttribute("grdLevelList", insaServiceImpl.grdLevelList());
		m.addAttribute("kosaYnList", insaServiceImpl.kosaYnList());
		m.addAttribute("kosaLevelList", insaServiceImpl.kosaLevelList());
		
		//return "redirect:insaPage.do"; // 안됨..redirect:/매핑주소 쓰지말고... 
		return "insa/updateForm";		 // 그냥 insaUpdateForm로 돌리기
	}
	
	
	
}
