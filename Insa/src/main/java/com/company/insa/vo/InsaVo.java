package com.company.insa.vo;

import org.springframework.web.multipart.MultipartFile;

public class InsaVo {

//	*******************************************************
//	 * DESC : 직원 정보 전역 변수
//	 * AUTH : 박소영 (개발팀)
//	 * HIST : 20220220
//	********************************************************
	private String agentNo;					// 사번
	private String name;					// 이름
	private String engName;					// 영문이름

	private String id;						// 아이디
	private String pwd;						// 비밀번호
	
	private String regNo;					// 주민번호
	private String phone;					// 휴대폰
	private String call;					// 전화번호
	
	private String age;						// 나이
	private String sex;						// 성별
	private String email1;					// 이메일1
	private String email2;					// 이메일2
	private String email;					// 이메일
	
	private String zip;						// 우편번호
	private String addr1;					// 주소1
	private String addr2;					// 주소2

	private String status;					// 입사여부 asis: join_gbn_code
	private String putYn;					// 투입여부
	private String dept;					// 부서
	private String position;				// 직위

	private String jobType;					// 직종
	private String salary;					// 연봉
	private String joinDate;				// 입사일
	private String retireDate;				// 퇴사일

	private String milYn;					// 군필여부
	private String milType;					// 군별
	private String milLevel;				// 계급
	private String milStartDate;			// 입영일
	private String milEndDate;				// 전역일

	private String kosaYn;					// KOSA등록
	private String kosaLevel;				// KOSA등급
	private String grdLevel;				// 등급(최종학력)

	private String cmpRegNo;				// 사업자번호
	private String cmp;						// 사업자명
	private String cmpFileName; 			// 사업자등록증 파일명
	private MultipartFile cmpFile;			// 사업자등록증 이미지 파일 server(프로젝트)에 저장
	
	
	private String selfIntro;				// 자기소개
	private String carrierFileName; 		// 이력서 파일명
	private MultipartFile carrierFile; 		// 이력서 이미지 파일 server(프로젝트)에 저장
	
	private String profileFileName; 		// 프로필 파일명
	private MultipartFile profileFile;		// 프로필 파일 server(프로젝트)에 저장
	
	
	//검색용 변수
	private String search_sabun;
	private String search_name;
	private String search_join_gbn_code;
	private String search_put_yn;
	private String search_pos_gbn_code;
	private String search_join_day;
	private String search_retire_day;
	private String search_job_type;
	
	//페이징용 변수 8개
	private int pageSize;    // 출력될 페이지 수. [1 2 3 4 5 6 7 8 9 10] 10개씩 또는 [ 1 2 3 4 5 ] 5개씩 보여주겠음
	private int listSize;    // 한 페이지에 보여줄 DB의 레코드 수.
	private int totalRecord; // DB rownum된 [index=1 ~ index=마지막까지]의 총 "갯수". 데이터List가 아님 그냥 갯수임
	private int totalPage;	// totalRecord를 바탕으로 [1 2 3 4 5 6 7 8 9 10 11 12 13]까지 나올지 아닐지 결정
	private int nowRecord;   // DB rownum됐을때 index=1,11,21... 어디쯤 레코드인지
	private int nowPage;	// 현재 페이지. [ 1 "2" 3 4 5 6 7 8 9 10 ] <= 현재 페이지:2
	private int startPage;	// 
	private int endPage;
	
	
	
	public String getProfileFileName() {
		return profileFileName;
	}
	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}
	public MultipartFile getProfileFile() {
		return profileFile;
	}
	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getPutYn() {
		return putYn;
	}
	public void setPutYn(String putYn) {
		this.putYn = putYn;
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
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
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
	public String getMilLevel() {
		return milLevel;
	}
	public void setMilLevel(String milLevel) {
		this.milLevel = milLevel;
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
	public String getKosaLevel() {
		return kosaLevel;
	}
	public void setKosaLevel(String kosaLevel) {
		this.kosaLevel = kosaLevel;
	}
	public String getGrdLevel() {
		return grdLevel;
	}
	public void setGrdLevel(String grdLevel) {
		this.grdLevel = grdLevel;
	}
	public String getCmpRegNo() {
		return cmpRegNo;
	}
	public void setCmpRegNo(String cmpRegNo) {
		this.cmpRegNo = cmpRegNo;
	}
	public String getCmp() {
		return cmp;
	}
	public void setCmp(String cmp) {
		this.cmp = cmp;
	}
	public String getCmpFileName() {
		return cmpFileName;
	}
	public void setCmpFileName(String cmpFileName) {
		this.cmpFileName = cmpFileName;
	}
	public MultipartFile getCmpFile() {
		return cmpFile;
	}
	public void setCmpFile(MultipartFile cmpFile) {
		this.cmpFile = cmpFile;
	}
	public String getSelfIntro() {
		return selfIntro;
	}
	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}
	public String getCarrierFileName() {
		return carrierFileName;
	}
	public void setCarrierFileName(String carrierFileName) {
		this.carrierFileName = carrierFileName;
	}
	public MultipartFile getCarrierFile() {
		return carrierFile;
	}
	public void setCarrierFile(MultipartFile carrierFile) {
		this.carrierFile = carrierFile;
	}
	
	
	@Override
	public String toString() {
		return "InsaVo [profileFileName=" + profileFileName + ", profileFile=" + profileFile + ", agentNo=" + agentNo
				+ ", name=" + name + ", engName=" + engName + ", id=" + id + ", pwd=" + pwd + ", regNo=" + regNo
				+ ", phone=" + phone + ", call=" + call + ", age=" + age + ", sex=" + sex + ", email1=" + email1
				+ ", email2=" + email2 + ", email=" + email + ", zip=" + zip + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", status=" + status + ", putYn=" + putYn + ", dept=" + dept + ", position=" + position + ", jobType="
				+ jobType + ", salary=" + salary + ", joinDate=" + joinDate + ", retireDate=" + retireDate + ", milYn="
				+ milYn + ", milType=" + milType + ", milLevel=" + milLevel + ", milStartDate=" + milStartDate
				+ ", milEndDate=" + milEndDate + ", kosaYn=" + kosaYn + ", kosaLevel=" + kosaLevel + ", grdLevel="
				+ grdLevel + ", cmpRegNo=" + cmpRegNo + ", cmp=" + cmp + ", cmpFileName=" + cmpFileName + ", cmpFile="
				+ cmpFile + ", selfIntro=" + selfIntro + ", carrierFileName=" + carrierFileName + ", carrierFile="
				+ carrierFile + "]";
	}
	
	//검색용 변수
	public String getSearch_sabun() {
		return search_sabun;
	}
	public void setSearch_sabun(String search_sabun) {
		this.search_sabun = search_sabun;
	}
	public String getSearch_name() {
		return search_name;
	}
	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}
	public String getSearch_join_gbn_code() {
		return search_join_gbn_code;
	}
	public void setSearch_join_gbn_code(String search_join_gbn_code) {
		this.search_join_gbn_code = search_join_gbn_code;
	}
	public String getSearch_put_yn() {
		return search_put_yn;
	}
	public void setSearch_put_yn(String search_put_yn) {
		this.search_put_yn = search_put_yn;
	}
	public String getSearch_pos_gbn_code() {
		return search_pos_gbn_code;
	}
	public void setSearch_pos_gbn_code(String search_pos_gbn_code) {
		this.search_pos_gbn_code = search_pos_gbn_code;
	}
	public String getSearch_join_day() {
		return search_join_day;
	}
	public void setSearch_join_day(String search_join_day) {
		this.search_join_day = search_join_day;
	}
	public String getSearch_retire_day() {
		return search_retire_day;
	}
	public void setSearch_retire_day(String search_retire_day) {
		this.search_retire_day = search_retire_day;
	}
	public String getSearch_job_type() {
		return search_job_type;
	}
	public void setSearch_job_type(String search_job_type) {
		this.search_job_type = search_job_type;
	}
	public String toStringSearch() {
		return "InsaSearchPagingVo [search_sabun=" + search_sabun + ", search_name=" + search_name
				+ ", search_join_gbn_code=" + search_join_gbn_code + ", search_put_yn=" + search_put_yn
				+ ", search_pos_gbn_code=" + search_pos_gbn_code + ", search_join_day=" + search_join_day
				+ ", search_retire_day=" + search_retire_day + ", search_job_type=" + search_job_type + "]";
	}
	
	
	//페이징용 변수 8개
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNowRecord() {
		return nowRecord;
	}
	public void setNowRecord(int nowRecord) {
		this.nowRecord = nowRecord;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public String toStringPaging() {
		return "InsaSearchPagingVo [pageSize=" + pageSize + ", listSize=" + listSize + ", totalRecord=" + totalRecord
				+ ", totalPage=" + totalPage + ", nowRecord=" + nowRecord + ", nowPage=" + nowPage + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}
		
		

}
