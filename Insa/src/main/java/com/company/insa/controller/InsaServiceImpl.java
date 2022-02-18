package com.company.insa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InsaServiceImpl implements InsaService{
	
	@Autowired
	InsaDao insaDao;

	@Override
	public String testfn() {
		// TODO Auto-generated method stub
		return insaDao.testfn();
	}

}
