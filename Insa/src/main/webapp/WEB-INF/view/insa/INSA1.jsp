<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS,JS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
<link href="css/INSA.css" rel="stylesheet">
    <!-- DAUM ZIP API for this template -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/zip.js"></script>
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

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<main>
			<form action="/INSERT.do" method="post" enctype="multipart/form-data">
<!-- enctype="multipart/form-data" : 파일업로드 포함해서 form 넘길때 꼭 써줘야하는 설정("html form 자료실"검색?해보기) -->
			
					<div align="right" class="pb-4">
							<input type="submit" id="btn" class="btn-dark" value="등록">
							<input type="reset" class="btn-dark" value="초기화">
					</div>
					
					<div class="row"><!-- 프로필사진 + 옆 3줄 라인 = 잡아주는 row div -->
					
						<div class="col-3" align="center">
							<div class="p-2"><!-- 증명사진 padding-->
								<img src="/defaultImg/default_profile.jpg" class="file img-thumbnail" id="profile_thumbnail" width="170" height="200">
						  	</div>
							<div>
								<input type="button" id="profile_btn" class="btn btn-outline-dark" value="증명사진 업로드" onclick=document.all.profileImg.click();><!--profileImg활성화 버튼-->
								<input type="file" id="profileImg" name="profileImg" onchange="setProfileImg(event);" style="display: none;"/><!-- 업로드파일명 안보이게 -->
							</div>
						</div>
						
						<div class="col-9"><!-- 프로필 사진 옆으로 col-9 차지하게 해주는 div -->
						
						
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="agentNo" class="col-4 col-form-label">사번</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="agentNo" name="agentNo" style="text-align: right" placeholder="자동생성" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="name" class="col-4 col-form-label">이름*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="name" name="name">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="engName" class="col-4 col-form-label">영어이름</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="engName" name="engName">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="id" class="col-4 col-form-label">아이디*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="id" name="id">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd" class="col-4 col-form-label">비밀번호*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd" name="pwd">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="pwd2" class="col-4 col-form-label">비밀번호 확인*</label>
										<div class="col-8">
										  <input type="password" class="form-control" id="pwd2">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="regNoMasking" class="col-4 col-form-label">주민번호*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="regNoMasking">
										  <input type="hidden" class="form-control" id="regNo" name="regNo">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="phone" class="col-4 col-form-label">휴대폰*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="phone" name="phone">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="call" class="col-4 col-form-label">전화번호</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="call" name="call">
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
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
								
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label for="colFormLabel" class="col-4 col-form-label">이메일*</label>
										<div class="col-8">
										  <input type="text" class="form-control" id="colFormLabel" name="email1">
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<label class="col-1 col-form-label">@</label>
										<div class="col-5">
										  <input type="text" class="form-control" readonly>
										</div>
										<div class="col-6">
											<select class="form-select" id="email2" name="email2">
												<option value="">선택</option>
												<c:forEach var="a" items="${emailList}">
													<option value="${a.name}">${a.name}</option>
												</c:forEach>
												<option value="1">직접입력</option>
											</select>
										</div>
									</div>
								</div>
							</div><!-- row -->
							
							
							<div class="row"><!-- 1줄로 묶어주는 div -->
								<div class="col-4"><!-- 12 중 4 차지 -->
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
									
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
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_address" name="addr1" placeholder="도로명 주소" readonly>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="row mb-3"><!-- label+input=inline 잡아주는 div -->
										<div class="col-12">
										  <input type="text" class="form-control" id="sample6_detailAddress" name="addr2" placeholder="상세 주소">
										  <input type="hidden" class="form-control" id="sample6_extraAddress" ><!-- 이거 꼭 넣어야함 -->
										</div>
									</div>
								</div>
							</div><!-- row -->
							
						</div><!-- col -->
						
						
					</div><!-- row 프로필 사진 -->
						
						
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="status" class="col-1 col-form-label">입사구분</label>
						<div class="col-2">
							<select class="form-select" id="status" name="status">
								<option value="">선택</option>
								<c:forEach var="a" items="${statusList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="dept" class="col-1 col-form-label">부서</label>
						<div class="col-2">
							<select class="form-select" id="dept" name="dept">
								<option value="">선택</option>
								<c:forEach var="a" items="${deptList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="position" class="col-1 col-form-label">직위</label>
						<div class="col-2">
							<select class="form-select" id="position" name="position">
								<option value="">선택</option>
								<c:forEach var="a" items="${positionList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						<label for="jotType" class="col-1 col-form-label">직종</label>
						<div class="col-2">
							<select class="form-select" id="jotType" name="jotType">
								<option value="">선택</option>
								<c:forEach var="a" items="${jobTypeList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
					</div>
						
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="grdLevel" class="col-1 col-form-label">최종학력</label>
						<div class="col-2">
							<select class="form-select" id="grdLevel" name="grdLevel">
								<option value="">선택</option>
								<c:forEach var="a" items="${grdLevelList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="salary" class="col-1 col-form-label" >연봉</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="salary" name="salary" style="text-align: right" placeholder="(만원)">
						</div>
						
						<label for="joinDate" class="col-1 col-form-label">입사일*</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="joinDate" name="joinDate">
						</div>
						
						<label for="retireDate" class="col-1 col-form-label">퇴사일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="retireDate" name="retireDate">
						</div>
					</div>
						
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="milYn" class="col-1 col-form-label">입대여부</label>
						<div class="col-2">
							<select class="form-select" id="milYn" name="milYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${milYnList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="milType" class="col-1 col-form-label">군별</label>
						<div class="col-2">
							<select class="form-select" id="milType" name="milType">
								<option value="">선택</option>
								<c:forEach var="a" items="${milTypeList}">
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
						
		
					
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="kosaYn" class="col-1 col-form-label">kosa여부</label>
						<div class="col-2">
							<select class="form-select" id="kosaYn" name="kosaYn">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosaYnList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="kosClass" class="col-1 col-form-label">kosa등급</label>
						<div class="col-2">
							<select class="form-select" id="kosClass" name="kosClass">
								<option value="">선택</option>
								<c:forEach var="a" items="${kosClassList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						
					</div><!-- end 4개씩 1줄로 잡아주는 div -->
					
					
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="bizRegNo" class="col-1 col-form-label">사업자번호</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="bizRegNo" name="bizRegNo">
						</div>
						
						<label for="bizName" class="col-1 col-form-label">사업자업체명</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="bizName" name="bizName">
						</div>
						
						<label for="biaRegImgName" class="col-1 col-form-label">사업자등록증</label>
						<div class="col-2">
						<input type="text" class="form-control" id="biaRegImgName" name="biaRegImgName" readonly>
						</div>
						
						<div class="col-3" align="center">
						  <!-- <button type="button" class="btn btn-outline-dark">미리보기</button>
						  <button type="button" class="btn btn-outline-dark">업로드</button> -->
						  
						  
							<!-- Button trigger modal 사업자등록증 미리보기 버튼-->
							<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#bizModal">미리보기</button>
							
							<!-- Modal 사업자등록증 미리보기-->
							<div class="modal fade" id="bizModal" tabindex="-1" aria-labelledby="bizModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="bizModalLabel">사업자등록증 미리보기</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<img src="/defaultImg/default_cmp.jpg" class="file img-thumbnail" id="biz_thumbnail">
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal 사업자등록증 끝-->
							
							<!-- 사업자등록증 업로드 버튼 -->
							<input type="button" class="btn btn-outline-dark" value="업로드" onclick=document.all.bizRegImg.click();>
							<input type="file" id="bizRegImg" name="bizRegImg" onchange="setBizPreview(event);"  style="display: none;"/>
							
						</div>
						
					</div><!-- end 4개씩 1줄로 잡아주는 div -->
					
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="selfIntro" class="col-1 col-form-label">자기소개</label>
						<div class="col-5">
						<textarea class="form-control d-line" id="selfIntro" name="selfIntro" placeholder="100자 내외로 적으시오" ></textarea>
						</div>
						
						<label for="carrierImgName" class="col-1 col-form-label">이력서</label>
						<div class="col-2">
						<input type="text" class="form-control" id="carrierImgName" name="carrierImgName" readonly>
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
											<button type=""file"" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal 이력서 끝-->
							
							<!-- 이력서 업로드 버튼 -->
							<input type="button" class="btn btn-outline-dark" value="업로드" onclick=document.all.carrierImg.click();>
							<input type="file" id="carrierImg" name="carrierImg" onchange="setCarrierPreview(event);"  style="display: none;"/>
							
							
						</div>
					</div><!-- end 4개씩 1줄로 잡아주는 div-->
					
					
			</form>
		</main>
	</div><!-- cover-container -->

</body>
</html>