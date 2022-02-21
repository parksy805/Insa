package com.company.insa.vo;

import org.springframework.web.multipart.MultipartFile;

public class InsaVo {

//	*******************************************************
//	 * DESC : 직원 정보 전역 변수
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	
	private String agentNo;					//사번*
	private String name;					//이름*
	private String engName;					//영어이름
	private String id;						//아이디*
	private String pwd;						//비밀번호*
	private String regNo;					//주민번호*
	private String phone;					//휴대폰*
	private String call;					//전화번호
	private String age;						//나이
	private String sex;						//성별
	private String email1;					//이메일 앞*
   	private String email2;					//이메일 뒤*
   	private String email;					//이메일
   	private String zip;						//우편번호
	private String addr1;					//도로명주소
	private String addr2;					//상세주소
	private String status;					//입사구분
	private String dept;					//부서
	private String position;				//직위
    private String jotType;					//직종
   	private String grdLevel;				//최종학력
	private String salary;					//연봉
	private String joinDate;				//입사일*
	private String retireDate;				//퇴사일
	private String milYn;					//입대여부
  	private String milType;					//군별
   	private String milStartDate;			//입대일
   	private String milEndDate;				//제대일
	private String kosaYn;					//kosa여부
	private String kosClass;				//kosa등급
	private String bizRegNo;				//사업자등록번호
	private String bizName;					//사업자업체명
	private String biaRegImgName;			//사업자등록증 파일명
	private String selfIntro;				//자기소개
	private String carrierImgName;			//이력서 파일명
	private String profileImgName;			//증명사진 파일명
	private MultipartFile profileImg;
	private MultipartFile careerImg;
	private MultipartFile bizRegImg;
	
	//getter,setter,toString생성
	
	public String getAgentNo() {
		return agentNo;
	}
	public void setAgentNo(String agentNo) {
		this.agentNo = agentNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEngName() {
		return engName;
	}
	public void setEngName(String engName) {
		this.engName = engName;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getJotType() {
		return jotType;
	}
	public void setJotType(String jotType) {
		this.jotType = jotType;
	}
	public String getGrdLevel() {
		return grdLevel;
	}
	public void setGrdLevel(String grdLevel) {
		this.grdLevel = grdLevel;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getRetireDate() {
		return retireDate;
	}
	public void setRetireDate(String retireDate) {
		this.retireDate = retireDate;
	}
	public String getMilYn() {
		return milYn;
	}
	public void setMilYn(String milYn) {
		this.milYn = milYn;
	}
	public String getMilType() {
		return milType;
	}
	public void setMilType(String milType) {
		this.milType = milType;
	}
	public String getMilStartDate() {
		return milStartDate;
	}
	public void setMilStartDate(String milStartDate) {
		this.milStartDate = milStartDate;
	}
	public String getMilEndDate() {
		return milEndDate;
	}
	public void setMilEndDate(String milEndDate) {
		this.milEndDate = milEndDate;
	}
	public String getKosaYn() {
		return kosaYn;
	}
	public void setKosaYn(String kosaYn) {
		this.kosaYn = kosaYn;
	}
	public String getKosClass() {
		return kosClass;
	}
	public void setKosClass(String kosClass) {
		this.kosClass = kosClass;
	}
	public String getBizRegNo() {
		return bizRegNo;
	}
	public void setBizRegNo(String bizRegNo) {
		this.bizRegNo = bizRegNo;
	}
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public String getBiaRegImgName() {
		return biaRegImgName;
	}
	public void setBiaRegImgName(String biaRegImgName) {
		this.biaRegImgName = biaRegImgName;
	}
	public String getSelfIntro() {
		return selfIntro;
	}
	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}
	public String getCarrierImgName() {
		return carrierImgName;
	}
	public void setCarrierImgName(String carrierImgName) {
		this.carrierImgName = carrierImgName;
	}
	public String getProfileImgName() {
		return profileImgName;
	}
	public void setProfileImgName(String profileImgName) {
		this.profileImgName = profileImgName;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	public MultipartFile getCareerImg() {
		return careerImg;
	}
	public void setCareerImg(MultipartFile careerImg) {
		this.careerImg = careerImg;
	}
	public MultipartFile getBizRegImg() {
		return bizRegImg;
	}
	public void setBizRegImg(MultipartFile bizRegImg) {
		this.bizRegImg = bizRegImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "InsaVo [agentNo=" + agentNo + ", name=" + name + ", engName=" + engName + ", id=" + id + ", pwd=" + pwd
				+ ", regNo=" + regNo + ", phone=" + phone + ", call=" + call + ", age=" + age + ", sex=" + sex
				+ ", email1=" + email1 + ", email2=" + email2 + ", email=" + email + ", zip=" + zip + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", status=" + status + ", dept=" + dept + ", position=" + position + ", jotType="
				+ jotType + ", grdLevel=" + grdLevel + ", salary=" + salary + ", joinDate=" + joinDate + ", retireDate="
				+ retireDate + ", milYn=" + milYn + ", milType=" + milType + ", milStartDate=" + milStartDate
				+ ", milEndDate=" + milEndDate + ", kosaYn=" + kosaYn + ", kosClass=" + kosClass + ", bizRegNo="
				+ bizRegNo + ", bizName=" + bizName + ", biaRegImgName=" + biaRegImgName + ", selfIntro=" + selfIntro
				+ ", carrierImgName=" + carrierImgName + ", profileImgName=" + profileImgName + ", profileImg="
				+ profileImg + ", careerImg=" + careerImg + ", bizRegImg=" + bizRegImg + ", getAgentNo()="
				+ getAgentNo() + ", getName()=" + getName() + ", getEngName()=" + getEngName() + ", getId()=" + getId()
				+ ", getPwd()=" + getPwd() + ", getRegNo()=" + getRegNo() + ", getPhone()=" + getPhone()
				+ ", getCall()=" + getCall() + ", getAge()=" + getAge() + ", getSex()=" + getSex() + ", getEmail1()="
				+ getEmail1() + ", getEmail2()=" + getEmail2() + ", getZip()=" + getZip() + ", getAddr1()=" + getAddr1()
				+ ", getAddr2()=" + getAddr2() + ", getStatus()=" + getStatus() + ", getDept()=" + getDept()
				+ ", getPosition()=" + getPosition() + ", getJotType()=" + getJotType() + ", getGrdLevel()="
				+ getGrdLevel() + ", getSalary()=" + getSalary() + ", getJoinDate()=" + getJoinDate()
				+ ", getRetireDate()=" + getRetireDate() + ", getMilYn()=" + getMilYn() + ", getMilType()="
				+ getMilType() + ", getMilStartDate()=" + getMilStartDate() + ", getMilEndDate()=" + getMilEndDate()
				+ ", getKosaYn()=" + getKosaYn() + ", getKosClass()=" + getKosClass() + ", getBizRegNo()="
				+ getBizRegNo() + ", getBizName()=" + getBizName() + ", getBiaRegImgName()=" + getBiaRegImgName()
				+ ", getSelfIntro()=" + getSelfIntro() + ", getCarrierImgName()=" + getCarrierImgName()
				+ ", getProfileImgName()=" + getProfileImgName() + ", getProfileImg()=" + getProfileImg()
				+ ", getCareerImg()=" + getCareerImg() + ", getBizRegImg()=" + getBizRegImg() + ", getEmail()="
				+ getEmail() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
}
