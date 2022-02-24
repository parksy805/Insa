package com.company.insa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.insa.vo.InsaVo;


@ControllerAdvice
@Controller
public class ControllerAction2_list {

	@Autowired
	InsaServiceImpl insaServiceImpl;

//	*******************************************************
//	 * DESC : 직원 정보 조회
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************

	@GetMapping("/list.do")
	public String list(InsaVo vo, Model m) {
		System.out.println(vo.getSearchAgentNo()); //검색변수 넘어오는지 확인용
		
		InsaVo searchVo = new InsaVo(); // 검색변수값 유지
		if (vo != null) {
			searchVo.setSearchAgentNo(vo.getSearchAgentNo());
			searchVo.setSearchName(vo.getSearchName());
			searchVo.setSearchStatus(vo.getSearchStatus());
			searchVo.setSearchPutYn(vo.getSearchPutYn());
			searchVo.setSearchPosition(vo.getSearchPosition());
			searchVo.setSearchJoinDate(vo.getSearchJoinDate());
			searchVo.setSearchRetireDate(vo.getSearchRetireDate());
			searchVo.setSearchJobType(vo.getSearchJobType());
			//System.out.println(searchVo.toSearchString());
		}
		m.addAttribute("searchVo",searchVo); //검색값 유지
		List<InsaVo> list = insaServiceImpl.list(vo);
		//System.out.println(list.toString());
		m.addAttribute("insaList",list);	 //검색결과 List
		
		/////////////////////////////////////////////////////페이징
		InsaVo paging = new InsaVo();
		paging.setPageSize( 10 ); 		//button : 1-10
		paging.setListSize( 10 );		//rownum : 1-10
		paging.setTotalRecord( insaServiceImpl.getTotalRecord(searchVo) ); // 검색값 결과 총 레코드 갯수 (ex.102개)
		
		if( vo.getTotalRecord()%10==0 ) {								  //총 갯수가 10의 배수면
		paging.setTotalPage( paging.getTotalRecord() / paging.getListSize() );	  //총 레코드 갯수 / 보여줄 레코드 갯수  (X)
		} else {														
		paging.setTotalPage( paging.getTotalRecord() / paging.getListSize() +1 ); // (총 레코드 갯수 / 보여줄 레코드 갯수) + 1 (ex. (102/10) = 10개. +1 해서 TotalPage 총 11)
		}
		
		
		
		if( vo.getNowRecord() == 0 ) {
		paging.setNowRecord(1);											// 0이면 DB nowRecord=1
		} else {
		paging.setNowRecord( paging.getNowRecord() );						// 0이 아니면 jsp name=nowRecord의 value= 1,11,21...
		}
		
		if( vo.getNowRecord() == 0 ) {
		paging.setNowPage(1);											// 0이면 현재페이지도=1
		} else {
		paging.setNowPage( paging.getNowRecord() / paging.getListSize() + 1 );	// (1,11,21... / 10) = 0,1,2...  +1해서 
		}													// nowRecord=1 nowPage=1, nowRecord=11 nowPage=2, nowRecord=21 nowPage=3
		
		
		paging.setStartPage( (paging.getNowPage() - 1) / paging.getPageSize()  *  paging.getPageSize()  +1  ); 
		// nowRecord=1   nowPage=1  pageSize=10 [startpage=1]  ,
		// nowRecord=11  nowPage=2  pageSize=10 [startpage=1]  , ...
		// nowRecord=101 nowPage=11 pageSize=10 [startpage=11] , 
		// nowRecord=111 nowPage=12 pageSize=10 [startpage=11] , 
		
		paging.setEndPage(  paging.getStartPage() + paging.getPageSize() - 1 );
		// startpage=1    + 10   endpage=11
		// startpage=11   + 10   endpage=21
		m.addAttribute("paging",paging);
		
		
		m.addAttribute("statusList", 					insaServiceImpl.statusList());			// 공통코드 입사여부
		m.addAttribute("putYnList", 					insaServiceImpl.putYnList());			// 공통코드 투입여부
		m.addAttribute("positionList", 					insaServiceImpl.positionList());		// 공통코드 직위
		m.addAttribute("jobTypeList", 					insaServiceImpl.jobTypeList());			// 공통코드 직종
		
		return "insa/listForm";
	}

}
