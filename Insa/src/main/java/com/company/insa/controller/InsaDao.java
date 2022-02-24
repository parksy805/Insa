package com.company.insa.controller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

@Mapper
public interface InsaDao {
	
//	*******************************************************
//	 * DESC : 직원 정보 저장
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	public String getAgentNoDeptCode(InsaComVo name);	// 사번 생성용 - 부서코드 호출
	public String getSeqAgentNo();						// 사번 생성용 - 시퀀스 호출
	public int idCheck(String id);						//id중복체크
	
	public void input(InsaVo vo);						// 저장
	
	//*********************************************************
	// * 직원 검색 조회
	//*********************************************************
	public List<InsaVo> list(InsaVo vo);					//검색

	
	//*********************************************************
	// * 직원 수정
	//*********************************************************
	public void insaUpdate(InsaVo vo);							//수정
	
	//*********************************************************
	// * 직원 삭제
	//*********************************************************
	public int insaDeleteByAgentNo(String agentNo);				//삭제

	//*********************************************************
	// * 사번으로 사진파일명 가져오기
	//*********************************************************
	public String getProfileFileNameByAgentNo(String agentNo);	//사번으로 프로필 파일명 조회
	public String getCmpFileNameByAgentNo(String agentNo);		//사번으로 사업자 파일명 조회
	public String getCarrierFileNameByAgentNo(String agentNo);	//사번으로 이력서 파일명 조회
	
	//*********************************************************
	// * 페이징 관련 함수
	//*********************************************************
	public int getTotalRecord(InsaVo vo);						//페이징
	public InsaVo insaPage(String agentNo);						//조회
	
	//*********************************************************
	// * 공통코드
	//*********************************************************
	List<InsaComVo> sexList();						// 공통코드 성별
	List<InsaComVo> emailList();					// 공통코드 이메일
	List<InsaComVo> statusList();					// 공통코드 입사여부
	List<InsaComVo> putYnList();					// 공통코드 투입여부
	List<InsaComVo> deptList();						// 공통코드 부서
	List<InsaComVo> positionList();					// 공통코드 직위
	List<InsaComVo> jobTypeList();					// 공통코드 직종
	List<InsaComVo> milYnList();					// 공통코드 입대여부
	List<InsaComVo> milTypeList();					// 공통코드 군별
	List<InsaComVo> milLevelList();					// 공통코드 계급
	List<InsaComVo> kosaYnList();					// 공통코드 kosa여부
	List<InsaComVo> kosaLevelList();				// 공통코드 kosa등급
	List<InsaComVo> grdLevelList();					// 공통코드 최종학력

	
	public String testfn();
}
