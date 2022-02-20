package com.company.insa.vo;

public class InsaComVo {
	
//	*******************************************************
//	 * DESC : 직원 정보 공통함수 전역 변수
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	
	private String gubun;
	private String code;
	private String name;
	private String note;
	
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "InsaComVo [gubun=" + gubun + ", code=" + code + ", name=" + name + ", note=" + note + ", getGubun()="
				+ getGubun() + ", getCode()=" + getCode() + ", getName()=" + getName() + ", getNote()=" + getNote()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
