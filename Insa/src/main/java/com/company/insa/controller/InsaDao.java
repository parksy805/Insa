package com.company.insa.controller;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

@Mapper
public interface InsaDao {
	
	public String testfn();
	
	
//	*******************************************************
//	 * DESC : 직원 정보 저장
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	public String getAgentNoDeptCode(InsaComVo name);	// 사번 생성용 - 부서코드 호출
	public String getSeqAgentNo();						// 사번 생성용 - 시퀀스 호출
	public void agentInsert(InsaVo vo);					// 저장
	


	
//	*******************************************************
//	 * DESC : 직원 정보 공통코드
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	public List<InsaComVo> status();		// 공통코드:입사여부
	public List<InsaComVo> sex();			// 공통코드:성별
	public List<InsaComVo> email();			// 공통코드:이메일
	public List<InsaComVo> dept();			// 공통코드:부서
	public List<InsaComVo> position();		// 공통코드:직위
	public List<InsaComVo> jobType();		// 공통코드:직종
	public List<InsaComVo> milYn();			// 공통코드:입대여부
	public List<InsaComVo> milType();		// 공통코드:군별
	public List<InsaComVo> grdLevel();		// 공통코드:최종학력
	public List<InsaComVo> kosaYn();		// 공통코드:kosa여부
	public List<InsaComVo> kosClass();		// 공통코드:kosa등급
 
}
