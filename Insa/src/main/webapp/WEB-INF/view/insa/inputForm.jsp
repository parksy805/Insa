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
    <!-- jquery core(이걸 먼저 선언해야 custom js/*.js 파일들이 동작한다) 
    	그리고 해당화면에서만 쓰일 jQuery라면 따로 js파일로 빼지 않는게 낫다-->
<script src="js/jquery-3.6.0.min.js"></script>



    <!-- Custom styles for this template -->
<link href="css/INSA.css" rel="stylesheet">
    <!-- DAUM ZIP API for this template -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/zip.js"></script>
<script src="js/input.js"></script>

<!--
*******************************************************
 * DESC : 직원 정보 등록 화면
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
			<form action="/inputForm.do" method="post" enctype="multipart/form-data">
<!-- enctype="multipart/form-data" : 파일업로드 포함해서 form 넘길때 꼭 써줘야하는 설정("html form 자료실"검색?해보기) -->
			
					<div align="right" class="pb-3"><!-- padding bottom 3 -->
							<input type="submit" id="btn" class="btn-dark" value="등록">
							<input type="reset" class="btn-dark" value="초기화">
					</div>
					
					<div class="row"><!-- 프로필사진 + 옆 3줄 라인 = 잡아주는 row div -->
					
						<div class="col-3" align="center">
							<div class="p-2"><!-- 증명사진 padding-->
								<img src="/defaultImg/default_profile.jpg" class="file img-thumbnail" id="profile_thumbnail" width="130"><!--사진크기는 width로만 잡아줘도 됨-->
						  	</div>
							<div>
								<input type="button" id="profile_btn" class="btn btn-outline-dark" value="증명사진 업로드" onclick=document.all.profileImg.click();><!--profileImg File trigger 버튼-->
								<input type="file" id="profileImg" name="profileImg" onchange="setProfileImg(event);" style="display: none;"/><!-- 업로드파일명 안보이게 -->
							</div>
						</div>
						
						<div class="col-9"><!-- 프로필 사진 옆으로 col-9 차지하게 해주는 div -->
						
						
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="agentNo" class="col-4 col-form-label">사번</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="agentNo" name="agentNo" style="text-align: right" placeholder="자동생성" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="name" class="col-4 col-form-label">이름*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="name" name="name" onKeypress="hangul()" maxlength="5">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="engName" class="col-4 col-form-label">영어이름</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="engName" name="engName" onKeyup="this.value=this.value.replace(/[^A-Za-z_]/g,'');">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="id" class="col-4 col-form-label">아이디*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="id" name="id" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" maxlength='12'>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd" class="col-4 col-form-label">비밀번호*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd" name="pwd">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd2" class="col-4 col-form-label">비밀번호 확인*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd2">
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
										  <input type="text" class="form-control" id="regNoMasking" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='14'>
										  <input type="hidden" class="form-control" id="regNo" name="regNo" maxlength='14'>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="phone" class="col-4 col-form-label">휴대폰*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="phone" name="phone" maxlength="13">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="call" class="col-4 col-form-label">전화번호</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="call" name="call"  maxlength="13">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 프로필 오른쪽 공간 [4|6|2] 맨왼쪽 차지 -->
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="age" class="col-2 col-form-label">연령</label>
										<div class="col-4">
										  <input type="text" class="form-control" id="age" name="age">
										</div>
										<label for="sex" class="col-2 col-form-label">성별</label>
										<div class="col-4">
											<select class="form-select" id="sex" name="sex">
												<option value="">선택</option>
												<c:forEach var="a" items="${sexList}">
													<option value="${a.name}">${a.name}</option>
													<!-- 그냥 a로 하면 InsaComVo객체 전부 호출됨 -->
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
												<input type="text" id="email1" name="email1" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" >
												&nbsp;@&nbsp;
												<input type="text" id="email2" name="email2" class="form-control" readonly >
												<select id="emailList" name="emailList" class="form-select d-line"  onChange="selectEmail(this)" >
													<option value="">선택</option>
													<c:forEach var="emailList" items="${emailList}">
														<option value="${emailList.name}">${emailList.name}</option>
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
										  <select class="form-select" id="jobType" name="jobType">
												<option value="">선택</option>
												<c:forEach var="a" items="${jobTypeList}">
													<option value="${a.name}">${a.name}</option>
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
											<input type="text" class="form-control col-8" id="sample6_postcode" placeholder="우편번호" name="zip" readonly>
										</div>
										<div class="col-4">
											<button type="button" class="btn btn-outline-dark" onclick="sample6_execDaumPostcode()">주소찾기</button>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_address" name="addr1" placeholder="도로명 주소" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_detailAddress" name="addr2" placeholder="상세 주소">
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
												<option value="" value2="00">선택</option>
												<c:forEach var="a" items="${deptList}">
													<option value="${a.name}" value2="${a.code}">${a.name}</option>
													<!-- a.code를 가져오기 위해서 ComMapper.xml id="deptList"에서 SELECT code 추가-->
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
													<option value="${a.name}">${a.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								
								
								<div class="col-4">
									<div class="row mb-2"><!-- label+input=inline 잡아주는 div -->
										<label for="jotType" class="col-4 col-form-label">연봉</label>
										<div class="col-8">
											<input type="text" id="salary_comma" name="salary_comma" placeholder="(만원)" style="text-align: right;" class="form-control d-line">
											<input type="hidden" id="salary" name="salary">
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
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="grdLevel" class="col-1 col-form-label">최종학력</label>
						<div class="col-2">
							<select class="form-select" id="grdLevel" name="grdLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${grdLevelList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="putYn" class="col-1 col-form-label">투입여부</label>
						<div class="col-2">
							<select class="form-select" id="putYn" name="putYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${putYnList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="milYn" class="col-1 col-form-label">입대여부</label>
						<div class="col-2">
							<select class="form-select" id="milYn" name="milYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${milYnList}">
									<option value="${a.name}">${a.name}</option>
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
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="milLevel" class="col-1 col-form-label">계급</label>
						<div class="col-2">
							<select class="form-select" id="milLevel" name="milLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${milLevelList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="milStartDate" class="col-1 col-form-label">입대일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="milStartDate" name="milStartDate">
						</div>
						
						<label for="milEndDate" class="col-1 col-form-label">제대일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="milEndDate" name="milEndDate">
						</div>
					</div>
						
		
					
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="kosaYn" class="col-1 col-form-label">kosa여부</label>
						<div class="col-2">
							<select class="form-select" id="kosaYn" name="kosaYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosaYnList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="kosaLevel" class="col-1 col-form-label">kosa등급</label>
						<div class="col-2">
							<select class="form-select" id="kosaLevel" name="kosaLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosClassList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						
						<label for="joinDate" class="col-1 col-form-label">입사일*</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="joinDate" name="joinDate">
						</div>
						
						<label for="retireDate" class="col-1 col-form-label">퇴사일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="retireDate" name="retireDate">
						</div>
						
						
					</div><!-- end 4개씩 1줄로 잡아주는 div -->
					
					
					<div class="row mb-2"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="cmpRegNo" class="col-1 col-form-label">사업자번호</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="cmpRegNo" name="cmpRegNo" maxlength="10">
						</div>
						
						<label for="cmp" class="col-1 col-form-label">사업자업체명</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="cmp" name="cmp">
						</div>
						
						<label for="cmpFileName" class="col-1 col-form-label">사업자등록증</label>
						<div class="col-2">
						<input type="text" class="form-control" id="cmpFileName" name="cmpFileName" readonly>
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
											<img src="/defaultImg/default_cmp.jpg" class="file img-thumbnail" id="cmp_thumbnail">
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
						<textarea class="form-control d-line" id="selfIntro" name="selfIntro" placeholder="100자 내외로 적으시오" ></textarea>
						</div>
						
						<label for="carrierFileName" class="col-1 col-form-label">이력서</label>
						<div class="col-2">
						<input type="text" class="form-control" id="carrierFileName" name="carrierFileName" readonly>
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
											<img src="/defaultImg/default_carrier.jpg" class="file img-thumbnail" id="carrier_thumbnail">
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