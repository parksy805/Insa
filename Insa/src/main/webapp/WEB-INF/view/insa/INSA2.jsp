<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
<link href="INSA.css" rel="stylesheet">
<!--
*******************************************************
 * DESC : 직원 정보 조회 화면
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
********************************************************
-->
</head>
<body class="d-flex h-100 bg-light">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<main>
			<form action="/INSERT002.do">
					
				
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="status" class="col-1 col-form-label">입사구분</label>
						<div class="col-2">
							<select class="form-select" id="status" name="status">
								<option value="">선택</option>
							<%--<c:forEach var="" items="${}">
									<option value="${}">${}</option>
								</c:forEach> --%>
							</select>
						</div>
						
						<label for="dept" class="col-1 col-form-label">부서</label>
						<div class="col-2">
							<select class="form-select" id="dept" name="dept">
								<option value="">선택</option>
							<%--<c:forEach var="" items="${}">
									<option value="${}">${}</option>
								</c:forEach> --%>
							</select>
						</div>
						
						<label for="position" class="col-1 col-form-label">직위</label>
						<div class="col-2">
							<select class="form-select" id="position" name="position">
								<option value="">선택</option>
							<%--<c:forEach var="" items="${}">
									<option value="${}">${}</option>
								</c:forEach> --%>
							</select>
						</div>
						<label for="jotType" class="col-1 col-form-label">직종</label>
						<div class="col-2">
							<select class="form-select" id="jotType" name="jotType">
								<option value="">선택</option>
							<%--<c:forEach var="" items="${}">
									<option value="${}">${}</option>
								</c:forEach> --%>
							</select>
						</div>
						
					</div>
						
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="grdLevel" class="col-1 col-form-label">최종학력</label>
						<div class="col-2">
							<select class="form-select" id="grdLevel" name="grdLevel">
								<option value="">선택</option>
							<%--<c:forEach var="" items="${}">
									<option value="${}">${}</option>
								</c:forEach> --%>
							</select>
						</div>
						
						<label for="salary" class="col-1 col-form-label" >연봉</label>
						<div class="col-2">
						  <input type="text" class="form-control" id="salary" style="text-align: right" placeholder="(만원)">
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
					
			</form>
			
			
			
			<table class="table table-hover table-bordered">
				<thead align="center">
					<tr>
						<th scope="col">#</th>
						<th scope="col">사번</th>
						<th scope="col">이름</th>
						<th scope="col">주민번호</th>
						<th scope="col">휴대폰</th>
						<th scope="col">직위</th>
						<th scope="col">입사일</th>
						<th scope="col">퇴사일</th>
						<th scope="col">투입여부</th>
						<th scope="col">연봉</th>
					</tr>
				</thead>
				<tbody align="center">
					<tr>
						<th scope="row">1</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			
			
			
			
		</main>
	</div><!-- cover-container -->

</body>
</html>