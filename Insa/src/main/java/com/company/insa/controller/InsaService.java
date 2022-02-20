package com.company.insa.controller;

import java.util.List;

import com.company.insa.vo.InsaComVo;

public interface InsaService {
	
	public String testfn();
	
	
	
//	*******************************************************
//	 * DESC : 직원 정보 공통코드
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	public List<InsaComVo> status();
	public List<InsaComVo> sex();
	public List<InsaComVo> email();
	public List<InsaComVo> dept();
	public List<InsaComVo> position();
	public List<InsaComVo> jobType();
	public List<InsaComVo> milYn();
	public List<InsaComVo> milType();
	public List<InsaComVo> grdLevel();
	public List<InsaComVo> kosaYn();
	public List<InsaComVo> kosClass();

}
