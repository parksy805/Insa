package com.company.insa.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.insa.vo.InsaVo;

@ControllerAdvice
@Controller
public class ControllerAction4_delete {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 삭제
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@ResponseBody
	@RequestMapping(value = "/checkedDelete.do")
	public int checkedDelete(@RequestParam(value = "checkedAgentNo[]") List<String> checkedAgentNo, InsaVo vo, HttpServletRequest request) {
		// System.out.println(vo.getSearchAgentNo());
		// System.out.println(checkedAgentNo);
		int cnt = 0;

		for (String string : checkedAgentNo) {
			String agentNo = string;
			// System.out.println(agentNo);
			// System.out.println(insaServiceImpl.getProfileFileName(agentNo));

			String path1 = request.getSession().getServletContext().getRealPath("/images/profile/"); // 업로드 파일 저장 경로
			if (!insaServiceImpl.getProfileFileNameByAgentNo(agentNo).equals("default_profile.jpg")) { // 기본이미지가 아니라면
				File delfile = new File(path1 + insaServiceImpl.getProfileFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
				delfile.delete(); // 파일삭제
			}
			String path2 = request.getSession().getServletContext().getRealPath("/images/cmp_reg/"); // 업로드 파일 저장 경로
			if (!insaServiceImpl.getCmpFileNameByAgentNo(agentNo).equals("default_cmp.jpg")) { // 기본이미지가 아니라면
				File delfile = new File(path2 + insaServiceImpl.getCmpFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
				delfile.delete(); // 파일삭제
			}
			String path3 = request.getSession().getServletContext().getRealPath("/images/carrier/"); // 업로드 파일 저장 경로
			if (!insaServiceImpl.getCarrierFileNameByAgentNo(agentNo).equals("default_carrier.jpg")) { // 기본이미지가 아니라면
				File delfile = new File(path3 + insaServiceImpl.getCarrierFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
				delfile.delete(); // 파일삭제
			}

			cnt = +insaServiceImpl.insaDeleteByAgentNo(agentNo);

		}
		return cnt;
	}

	@ResponseBody
	@RequestMapping(value = "/insaPageDelete.do")
	public int insaPageDelete(InsaVo vo, HttpServletRequest request) {
		// System.out.println(vo.getAgentNo());
		String agentNo = vo.getAgentNo();

		String path1 = request.getSession().getServletContext().getRealPath("/images/profile/"); // 업로드 파일 저장 경로
		if (!insaServiceImpl.getProfileFileNameByAgentNo(agentNo).equals("default_profile.jpg")) { // 기본이미지가 아니라면
			File delfile = new File(path1 + insaServiceImpl.getProfileFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
			delfile.delete(); // 파일삭제
		}
		String path2 = request.getSession().getServletContext().getRealPath("/images/cmp_reg/"); // 업로드 파일 저장 경로
		if (!insaServiceImpl.getCmpFileNameByAgentNo(agentNo).equals("default_cmp.jpg")) { // 기본이미지가 아니라면
			File delfile = new File(path2 + insaServiceImpl.getCmpFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
			delfile.delete(); // 파일삭제
		}
		String path3 = request.getSession().getServletContext().getRealPath("/images/carrier/"); // 업로드 파일 저장 경로
		if (!insaServiceImpl.getCarrierFileNameByAgentNo(agentNo).equals("default_carrier.jpg")) { // 기본이미지가 아니라면
			File delfile = new File(path3 + insaServiceImpl.getCarrierFileNameByAgentNo(agentNo)); // 삭제할 파일 지정
			delfile.delete(); // 파일삭제
		}

		int cnt = insaServiceImpl.insaDeleteByAgentNo(vo.getAgentNo());

		return cnt;
	}

}
