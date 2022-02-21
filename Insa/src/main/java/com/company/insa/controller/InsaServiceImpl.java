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
	public void agentInsert(InsaVo vo) {				// 저장
		// TODO Auto-generated method stub
		insaDao.agentInsert(vo);
	}



//	*******************************************************
//	 * DESC : 직원 정보 공통코드
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	@Override
	public List<InsaComVo> status() {
		// TODO Auto-generated method stub
		return insaDao.status();
	}

	@Override
	public List<InsaComVo> sex() {
		// TODO Auto-generated method stub
		return insaDao.sex();
	}

	@Override
	public List<InsaComVo> email() {
		// TODO Auto-generated method stub
		return insaDao.email();
	}

	@Override
	public List<InsaComVo> dept() {
		// TODO Auto-generated method stub
		return insaDao.dept();
	}
	
	@Override
	public List<InsaComVo> position() {
		// TODO Auto-generated method stub
		return insaDao.position();
	}
	
	@Override
	public List<InsaComVo> jobType() {
		// TODO Auto-generated method stub
		return insaDao.jobType();
	}

	@Override
	public List<InsaComVo> milYn() {
		// TODO Auto-generated method stub
		return insaDao.milYn();
	}

	@Override
	public List<InsaComVo> milType() {
		// TODO Auto-generated method stub
		return insaDao.milType();
	}

	@Override
	public List<InsaComVo> grdLevel() {
		// TODO Auto-generated method stub
		return insaDao.grdLevel();
	}

	@Override
	public List<InsaComVo> kosaYn() {
		// TODO Auto-generated method stub
		return insaDao.kosaYn();
	}

	@Override
	public List<InsaComVo> kosClass() {
		// TODO Auto-generated method stub
		return insaDao.kosClass();
	}


}
