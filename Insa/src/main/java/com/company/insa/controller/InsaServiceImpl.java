package com.company.insa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.insa.vo.InsaComVo;
import com.company.insa.vo.InsaVo;

@Service
public class InsaServiceImpl implements InsaService{
	
	@Autowired
	InsaDao insaDao;

	@Override
	public String testfn() {
		// TODO Auto-generated method stub
		return insaDao.testfn();
	}


//	*******************************************************
//	 * DESC : 직원 정보 저장
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	@Override
	public String getAgentNoDeptCode(InsaComVo name) {	// 사번 생성용 - 부서코드 호출
		// TODO Auto-generated method stub
		return insaDao.getAgentNoDeptCode(name);
	}
	@Override
	public String getSeqAgentNo() {						// 사번 생성용 - 시퀀스 호출
		// TODO Auto-generated method stub
		return insaDao.getSeqAgentNo();
	}
	
	@Override
	public int idCheck(String id) {						// id 중복체크
		return insaDao.idCheck(id);
	}
	
	@Override
	public void input(InsaVo vo) {						// 저장
		// TODO Auto-generated method stub
		insaDao.input(vo);
	}

	// *********************************************************
	// * 직원 검색 조회
	// *********************************************************

	@Override
	public List<InsaVo> list(InsaVo vo) {
		return insaDao.list(vo);
	}

	// *********************************************************
	// * 직원 수정
	// *********************************************************
	@Override
	public void insaUpdate(InsaVo vo) {
		insaDao.insaUpdate(vo);
	}

	// *********************************************************
	// * 직원 삭제
	// *********************************************************
	@Override
	public int insaDeleteByAgentNo(String agentNo) {
		return insaDao.insaDeleteByAgentNo(agentNo);
	}

	// *********************************************************
	// * 사번으로 사진파일명 가져오기
	// *********************************************************
	@Override
	public String getProfileFileNameByAgentNo(String sabun) {
		return insaDao.getProfileFileNameByAgentNo(sabun);
	}

	@Override
	public String getCmpFileNameByAgentNo(String sabun) {
		return insaDao.getCmpFileNameByAgentNo(sabun);
	}

	@Override
	public String getCarrierFileNameByAgentNo(String sabun) {
		return insaDao.getCarrierFileNameByAgentNo(sabun);
	}

	// *********************************************************
	// * 페이징 관련 함수
	// *********************************************************

	@Override
	public int getTotalRecord(InsaVo vo) { 
		// TODO Auto-generated method stub
		return insaDao.getTotalRecord(vo);
	}
	@Override
	public InsaVo insaPage(String sabun) {
		return insaDao.insaPage(sabun);
	}

	// *********************************************************
	// * 공통코드
	// *********************************************************
	@Override
	public List<InsaComVo> sexList() {
		return insaDao.sexList();
	}

	@Override
	public List<InsaComVo> emailList() {
		return insaDao.emailList();
	}

	@Override
	public List<InsaComVo> statusList() {
		return insaDao.statusList();
	}

	@Override
	public List<InsaComVo> putYnList() {
		return insaDao.putYnList();
	}

	@Override
	public List<InsaComVo> deptList() {
		return insaDao.deptList();
	}

	@Override
	public List<InsaComVo> positionList() {
		return insaDao.positionList();
	}

	@Override
	public List<InsaComVo> jobTypeList() {
		return insaDao.jobTypeList();
	}

	@Override
	public List<InsaComVo> milYnList() {
		return insaDao.milYnList();
	}

	@Override
	public List<InsaComVo> milTypeList() {
		return insaDao.milTypeList();
	}

	@Override
	public List<InsaComVo> milLevelList() {
		return insaDao.milLevelList();
	}

	@Override
	public List<InsaComVo> kosaYnList() {
		return insaDao.kosaYnList();
	}

	@Override
	public List<InsaComVo> kosaLevelList() {
		return insaDao.kosaLevelList();
	}

	@Override
	public List<InsaComVo> grdLevelList() {
		return insaDao.grdLevelList();
	}

}