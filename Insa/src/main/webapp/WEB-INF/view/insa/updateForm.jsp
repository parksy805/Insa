<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/cover/">

    <!-- Bootstrap core CSS,JS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- jquery core(이걸 먼저 선언해야 custom js/*.js 파일들이 동작한다) 
    	그리고 해당화면에서만 쓰일 jQuery라면 따로 js파일로 빼지 않는게 낫다-->
<script src="js/jquery-3.6.0.min.js"></script>



    <!-- Custom styles for this template -->
<link href="css/input.css" rel="stylesheet">
    <!-- DAUM ZIP API for this template -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/zip.js"></script>
<script src="js/input.js"></script>

<!--
*******************************************************
 * DESC : 직원 정보 수정 화면
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
********************************************************
-->

<script>



</script>
</head>
<body class="d-flex h-100 bg-light">

	<div class="cover-container d-flex w-100 p-3 mx-auto flex-column">
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		
		<main>
			<form action="update.do" method="post" enctype="multipart/form-data">
<!-- enctype="multipart/form-data" : 파일업로드 포함해서 form 넘길때 꼭 써줘야하는 설정("html form 자료실"검색?해보기) -->
					
					
					<!-- 직원 검색 후, 검색정보 가져오기 -->
					<input type="hidden" id="search_sabun" name="search_sabun" value="${searchVo.search_sabun}">
					<input type="hidden" id="search_name" name="search_name" value="${searchVo.search_name}">
					<input type="hidden" id="search_join_gbn_code" name="search_join_gbn_code" value="${searchVo.search_join_gbn_code}">
					<input type="hidden" id="search_put_yn" name="search_put_yn" value="${searchVo.search_put_yn}">
					<input type="hidden" id="search_pos_gbn_code" name="search_pos_gbn_code" value="${searchVo.search_pos_gbn_code}">
					<input type="hidden" id="search_join_day" name="search_join_day" value="${searchVo.search_join_day}">
					<input type="hidden" id="search_retire_day" name="search_retire_day" value="${searchVo.search_retire_day}">
					<input type="hidden" id="search_job_type" name="search_job_type" value="${searchVo.search_job_type}">
			
			
					<div align="right" class="pb-3"><!-- padding bottom 3 -->
							<button type="submit" class="btn-dark d-line" >수정</button>
							<button type="button" class="btn-dark d-line" id="deleteBtn_page"  >삭제</button>
							<button type="button" class="btn-dark d-line" onClick="location.href='index'">이전</button>
					</div>
					
					<div class="row"><!-- 프로필사진 + 옆 3줄 라인 = 잡아주는 row div -->
					
						<div class="col-3" align="center">
							<div class="p-2"><!-- 증명사진 padding-->
								<c:if test="${insaPage.profileFileName eq 'default_profile.jpg' }">
									<img src="/defaultImg/default_profile.jpg" class="file img-thumbnail" id="profile_thumbnail" width="150">
								</c:if>
								<c:if test="${insaPage.profileFileName !=  'default_profile.jpg' }">
					        		<img src="/uploadImages/profile/${insaPage.profileFileName}" class="file img-thumbnail" id="profile_thumbnail" width="150">
					   			</c:if>
						  	</div>
							<div>
								<input type="button" id="profile_btn" class="btn btn-outline-dark" value="증명사진 업로드" onclick=document.all.profileFile.click();><!--profileImg File trigger 버튼-->
								<input type="file" id="profileFile" name="profileFile" onchange="setProfileImg(event);" style="display: none;"/><!-- 업로드파일명 안보이게 -->
							</div>
						</div>
						
						<div class="col-9"><!-- 프로필 사진 옆으로 col-9 차지하게 해주는 div -->
						
						
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="agentNo" class="col-4 col-form-label">사번</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="agentNo" name="agentNo" style="text-align: right" value="${insaPage.agentNo}" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="name" class="col-4 col-form-label">이름*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="name" name="name" value="${insaPage.name}" onKeypress="hangul()" maxlength="5">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="engName" class="col-4 col-form-label">영어이름</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="engName" name="engName" value="${insaPage.engName}" onKeyup="this.value=this.value.replace(/[^A-Za-z_]/g,'');">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="id" class="col-4 col-form-label">아이디*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="id" name="id" value="${insaPage.id}" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" maxlength='12'>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd" class="col-4 col-form-label">비밀번호*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd" name="pwd" value="${insaPage.pwd}" maxlength='12'>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd2" class="col-4 col-form-label">비밀번호 확인*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd2" maxlength='12'>
										  <span id="pwd_result"></span>
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="regNoMasking" class="col-4 col-form-label">주민번호*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="regNoMasking" value="${insaPage.regNo}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='14'>
										  <input type="hidden" class="form-control" id="regNo" name="regNo" maxlength='14'>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="phone" class="col-4 col-form-label">휴대폰*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="phone" name="phone" value="${insaPage.phone}" maxlength="13">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="call" class="col-4 col-form-label">전화번호</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="call" name="call" value="${insaPage.call}" maxlength="13">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 프로필 오른쪽 공간 [4|6|2] 맨왼쪽 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="age" class="col-2 col-form-label">연령</label>
										<div class="col-4">
										  <input type="text" class="form-control" id="age" name="age" value="${insaPage.age}">
										</div>
										<label for="sex" class="col-2 col-form-label">성별</label>
										<div class="col-4">
											<select class="form-select" id="sex" name="sex">
												<option value="">선택</option>
												
												
												<c:forEach var="sexList" items="${sexList}">
													<c:if test="${a.name eq insaPage.sex}">
														<option value="${a.name}" selected="selected">${a.name}</option>
													</c:if>
													<c:if test="${a.name != insaPage.sex}">
										        		<option value="${a.name}">${a.name}</option>
										   			</c:if>
												</c:forEach>		
												
												
											</select>
										</div>
									</div>
								</div>
								
								
								
								
								<div class="col-5 d-line"><!-- 프로필 오른쪽 공간 [4|6|2] 가운데 차지 -->
									<div class="row mb-2 d-line"><!-- label+input=inline 잡아주는 div -->
										<label for="email1" class="col-3 col-form-label d-line">이메일*</label>
										<!-- 
										<label for="colFormLabel" class="col-4 col-form-label">이메일*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="colFormLabel" name="email1">
										</div> -->
										
										
										<div class="col-9">
											<div class="input-group">
												<input type="text" id="email1" name="email1" class="form-control d-line" value="${insaPage.email1}" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" >
												&nbsp;@&nbsp;
												<input type="text" id="email2" name="email2" class="form-control" value="${insaPage.email2}" readonly >
												<select id="emailList" name="emailList" class="form-select d-line" onChange="selectEmail(this)" >
													<option value="">선택</option>
													
													<c:forEach var="emailList" items="${emailList}">
														<c:if test="${emailList.name eq insaPage.email2 }">
															<option value="${emailList.name}" selected="selected">${emailList.name}</option>
														</c:if>
														<c:if test="${emailList.name != insaPage.email2}">
											        		<option value="${emailList.name}">${emailList.name}</option>
											   			</c:if>
													</c:forEach>	
													
													<option value="1">직접입력</option>
												</select>
											</div>
										</div>
										
										
									</div>
								</div>
								
								
								<div class="col-3"><!-- 프로필 오른쪽 공간 [4|6|2] 맨 왼쪽 차지 -->
								
								
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="jobType" class="col-4 col-form-label">직종</label>
										<div class="col-8">
										  <select class="form-select" id="jobType" name="jobType" value="${insaPage.jobType}">
												<option value="">선택</option>
												
												
												<c:forEach var="a" items="${jobTypeList}">
													<c:if test="${a.name eq insaPage.jobType}">
														<option value="${a.name}" selected="selected">${a.name}</option>
													</c:if>
													<c:if test="${a.name != insaPage.jobType}">
										        		<option value="${a.name}">${a.name}</option>
										   			</c:if>
												</c:forEach>
												
												
											</select>
										</div>
									</div>
								
								</div>
							
							
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
									
										<!--  다음 우편번호 API-->
										<label for="zip" class="col-4 col-form-label">주소</label>
										<div class="col-4">
											<input type="text" class="form-control col-8" id="sample6_postcode" placeholder="우편번호" name="zip" value="${insaPage.zip}" readonly>
										</div>
										<div class="col-4">
											<button type="button" class="btn btn-outline-dark" onclick="sample6_execDaumPostcode()">주소찾기</button>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_address" name="addr1" value="${insaPage.addr1}" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_detailAddress" name="addr2" value="${insaPage.addr2}">
										  <input type="hidden" class="form-control" id="sample6_extraAddress" ><!-- 이거 꼭 넣어야함 -->
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							
							
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
							
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="dept" class="col-4 col-form-label">부서</label>
										<div class="col-8">
										
											<select class="form-select" id="dept" name="dept">
												<option value="" value2="000">선택</option>
												<c:forEach var="deptList" items="${deptList}">
													<c:if test="${a.name eq insaPage.dept}">
														<option value="${a.name}" selected="selected">${a.name}</option>
													</c:if>
													<c:if test="${a.name != insaPage.dept}">
										        		<option value="${a.name}">${a.name}</option>
										   			</c:if>
												</c:forEach>	
											</select>
											
										</div>
									</div>
								</div>
								
								
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="position" class="col-4 col-form-label">직위</label>
										<div class="col-8">
										
											<select class="form-select" id="position" name="position">
												<option value="">선택</option>
												<c:forEach var="a" items="${positionList}">
													<c:if test="${a.name eq insaPage.position}">
														<option value="${a.name}" selected="selected">${a.name}</option>
													</c:if>
													<c:if test="${a.name != insaPage.position}">
										        		<option value="${a.name}">${a.name}</option>
										   			</c:if>
												</c:forEach>		
											</select>
											
										</div>
									</div>
								</div>
								
								
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="jotType" class="col-4 col-form-label">연봉</label>
										<div class="col-8">
											<input type="text" class="form-control d-line" id="salary_comma" name="salary_comma" placeholder="(만원)" style="text-align: right;" value="${insaPage.salary}">
											<input type="hidden" id="salary" name="salary" value="${insaPage.salary}">
										</div>
									</div>
								</div>
								
								
							</div><!-- row -->
							
							
							
							
							
							
							
							
							
							
							
							
							
							
						</div><!-- col -->
						
						
					</div><!-- row 프로필 사진 -->
						
						
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="status" class="col-1 col-form-label">입사여부</label>
						<div class="col-2">
							<select class="form-select" id="status" name="status">
								<option value="">선택</option>
								<c:forEach var="a" items="${statusList}">
									<c:if test="${a.name eq insaPage.status}">
										<option value="${a.name}" selected="selected">${a.name}</option>
									</c:if>
									<c:if test="${a.name != insaPage.status}">
						        		<option value="${a.name}">${a.name}</option>
						   			</c:if>
								</c:forEach>	
							</select>
						</div>
						
						<label for="grdLevel" class="col-1 col-form-label">최종학력</label>
						<div class="col-2">
							<select class="form-select" id="grdLevel" name="grdLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${grdLevelList}">
								<c:if test="${a.name eq insaPage.grdLevel}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.grdLevel}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>	
							</select>
						</div>
						
						<label for="putYn" class="col-1 col-form-label">투입여부</label>
						<div class="col-2">
							<select class="form-select" id="putYn" name="putYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${putYnList}">
								<c:if test="${a.name eq insaPage.putYn}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.putYn}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>	
							</select>
						</div>
						
						<label for="milYn" class="col-1 col-form-label">입대여부</label>
						<div class="col-2">
							<select class="form-select" id="milYn" name="milYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${milYnList}">
								<c:if test="${a.name eq insaPage.milYn}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.milYn}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>
							</select>
						</div>
						
					</div>
						
						
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->

						
						<label for="milType" class="col-1 col-form-label">군별</label>
						<div class="col-2">
							<select class="form-select" id="milType" name="milType">
								<option value="">선택</option>
								<c:forEach var="a" items="${milTypeList}">
								<c:if test="${a.name eq insaPage.milType}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.milType}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>	
							</select>
						</div>
						
						<label for="milLevel" class="col-1 col-form-label">계급</label>
						<div class="col-2">
							<select class="form-select" id="milLevel" name="milLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${milLevelList}">
								<c:if test="${a.name eq insaPage.milLevel}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.milLevel}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>
							</select>
						</div>
						
						<label for="milStartDate" class="col-1 col-form-label">입대일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="milStartDate" name="milStartDate" value="${insaPage.milStartDate}">
						</div>
						
						<label for="milEndDate" class="col-1 col-form-label">제대일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="milEndDate" name="milEndDate" value="${insaPage.milEndDate}">
						</div>
					</div>
						
		
					
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="kosaYn" class="col-1 col-form-label">kosa여부</label>
						<div class="col-2">
							<select class="form-select" id="kosaYn" name="kosaYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosaYnList}">
								<c:if test="${a.name eq insaPage.kosaYn}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.kosaYn}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>
							</select>
						</div>
						
						<label for="kosaLevel" class="col-1 col-form-label">kosa등급</label>
						<div class="col-2">
							<select class="form-select" id="kosaLevel" name="kosaLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosaLevelList}">
								<c:if test="${a.name eq insaPage.kosaLevel}">
									<option value="${a.name}" selected="selected">${a.name}</option>
								</c:if>
								<c:if test="${a.name != insaPage.kosaLevel}">
					        		<option value="${a.name}">${a.name}</option>
					   			</c:if>
								</c:forEach>
							</select>
						</div>
						
						
						<label for="joinDate" class="col-1 col-form-label">입사일*</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="joinDate" name="joinDate" value="${insaPage.joinDate}" readonly/>
						</div>
						
						<label for="retireDate" class="col-1 col-form-label">퇴사일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="retireDate" name="retireDate" value="${insaPage.retireDate}">
						</div>
						
						
					</div><!-- end 4개씩 1줄로 잡아주는 div -->
					
					
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="cmpRegNo" class="col-1 col-form-label">사업자번호</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="cmpRegNo" name="cmpRegNo" maxlength="10" value="${insaPage.cmpRegNo}">
						</div>
						
						<label for="cmp" class="col-1 col-form-label">사업자업체명</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="cmp" name="cmp" value="${insaPage.cmp}">
						</div>
						
						<label for="cmpFileName" class="col-1 col-form-label">사업자등록증</label>
						<div class="col-2">
						<input type="text" class="form-control" id="cmpFileName" name="cmpFileName" value="${insaPage.cmpFileName}" readonly>
						</div>
						
						<div class="col-3" align="center">
						  <!-- <button type="button" class="btn btn-outline-dark">미리보기</button>
						  <button type="button" class="btn btn-outline-dark">업로드</button> -->
						  
						  
							<!-- Button trigger modal 사업자등록증 미리보기 버튼-->
							<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#cmpModal">미리보기</button>
							
							<!-- Modal 사업자등록증 미리보기-->
							<div class="modal fade" id="cmpModal" tabindex="-1" aria-labelledby="cmpModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="cmpModalLabel">사업자등록증 미리보기</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- <img src="/defaultImg/default_cmp.jpg" class="file img-thumbnail" id="cmp_thumbnail"> -->
											
											<!-- 추가 -->
											<c:if test="${insaPage.cmpFileName eq 'default_cmp.jpg'}">
									      		<img src="/defaultImg/default_cmp.jpg" id="cmp_img_preview" width="400">
											</c:if>
											<c:if test="${insaPage.cmpFileName !=  'default_cmp.jpg'}">
								        		<img src="/uploadImages/cmp/${insaPage.cmpFileName}" id="cmp_img_preview" width="400">
								   			</c:if>
											
											
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal 사업자등록증 끝-->
							
							<!-- 사업자등록증 업로드 버튼 -->
							<input type="button" class="btn btn-outline-dark" value="업로드" onclick=document.all.cmpFile.click();>
							<input type="file" id="cmpFile" name="cmpFile" onchange="setCmpPreview(event);"  style="display: none;"/>
							
						</div>
						
					</div><!-- end 4개씩 1줄로 잡아주는 div -->
					
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="selfIntro" class="col-1 col-form-label">자기소개</label>
						<div class="col-5">
						<textarea class="form-control d-line" id="selfIntro" name="selfIntro" placeholder="100자 내외로 적으시오" >${insaPage.selfIntro}</textarea>
						</div>
						
						<label for="carrierFileName" class="col-1 col-form-label">이력서</label>
						<div class="col-2">
						<input type="text" class="form-control" id="carrierFileName" name="carrierFileName"  value="${insaPage.carrierFileName}"  readonly>
						</div>
						
						<div class="col-3" align="center">
						  <!-- <button type="button" class="btn btn-outline-dark">미리보기</button>
						  <button type="button" class="btn btn-outline-dark">업로드</button> -->
						  
						  
						  <!-- Button trigger modal 이력서 미리보기-->
							<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#carrierModal">미리보기</button>
							
							<!-- Modal 이력서 미리보기-->
							<div class="modal fade" id="carrierModal" tabindex="-1" aria-labelledby="carrierModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="carrierModalLabel">이력서 미리보기</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<!-- <img src="/defaultImg/default_carrier.jpg" class="file img-thumbnail" id="carrier_thumbnail"> -->
											
											<!-- 추가 -->
											<c:if test="${insaPage.carrierFileName eq 'default_carrier.jpg'}">
									      		<img src="/defaultImg/default_carrier.jpg" id="cmp_img_preview" width="400">
											</c:if>
											<c:if test="${insaPage.carrierFileName !=  'default_carrier.jpg'}">
								        		<img src="/uploadImages/carrier/${insaPage.carrierFileName}"  id="carrier_preview" width="400" >
								   			</c:if>
											
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal 이력서 끝-->
							
							<!-- 이력서 업로드 버튼 -->
							<input type="button" class="btn btn-outline-dark" value="업로드" onclick=document.all.carrierFile.click();>
							<input type="file" id="carrierFile" name="carrierFile" onchange="setCarrierPreview(event);"  style="display: none;"/>
							
							
						</div>
					</div><!-- end 4개씩 1줄로 잡아주는 div-->
					
					
			</form>
		</main>
	</div><!-- cover-container -->



</body>
</html>