<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS,JS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- jquery core(이걸 먼저 선언해야 custom js/*.js 파일들이 동작한다) 
    	그리고 해당화면에서만 쓰일 jQuery라면 따로 js파일로 빼지 않는게 낫다-->
<script src="js/jquery-3.6.0.min.js"></script>


    <!-- Custom styles for this template -->
<link href="css/input.css" rel="stylesheet">
<link href="css/list.css" rel="stylesheet">
<script src="js/list.js"></script>

<script>
function insaPageHref(i) {
	//alert("1");
	//alert( i );
	$("#agentNo").val( i );
	//alert( $("#agentNo").val() );
	
	$("form").attr("action", "insaPage.do");
	$("form").submit();
}
</script>

</head>

<body class="d-flex h-100 bg-light">

	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<jsp:include page="/WEB-INF/view/include/header.jsp" />
		<main>
<!-- 
*******************************************************
 * DESC : 직원 조회 검색
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
********************************************************
-->
			<form action="list.do">
					<input type="hidden" id="agentNo" name="agentNo" value="" >
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="searchAgentNo" class="col-1 col-form-label">사번</label>
						<div class="col-2">
							<input type="text" class="form-control" id="searchAgentNo" name="searchAgentNo" value="${searchVo.searchAgentNo}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='10'>
						</div>
						
						<label for="searchName" class="col-1 col-form-label">이름</label>
						<div class="col-2">
							<input type="text" class="form-control" id="searchName" name="searchName" value="${searchVo.searchName}" onKeypress="hangul()" maxlength="5" >
						</div>
						
						
						
						<label for="searchStatus" class="col-1 col-form-label">입사구분</label>
						<div class="col-2">
						
							<select class="form-select"  name="searchStatus" id="searchStatus">
							   <option value="">선택</option>
							   <c:forEach var="a" items="${statusList}">
							      <c:if test="${a.name eq searchVo.searchStatus}">
							         <option value="${a.name}" selected="selected">${a.name}</option>
							      </c:if>
							      <c:if test="${a.name != searchVo.searchStatus}">
							         <option value="${a.name}">${a.name}</option>
							      </c:if>
							   </c:forEach>
							</select>
							
						</div>
						
						
						<label for="searchPutYn" class="col-1 col-form-label">투입여부</label>
						<div class="col-2">
							<select class="form-select" id="searchPutYn" name="searchPutYn">
								<option value="">선택</option>
		
							   <c:forEach var="a" items="${statusList}">
							      <c:if test="${a.name eq searchVo.searchPutYn}">
							         <option value="${a.name}" selected="selected">${a.name}</option>
							      </c:if>
							      
							      <c:if test="${a.name != searchVo.searchPutYn}">
							         <option value="${a.name}">${a.name}</option>
							      </c:if>
							   </c:forEach>
								
							</select>
						</div>
						
					</div>
						
					<div class="row mb-3"><!-- 4개씩 1줄로 잡아주는 div -->
						<label for="searchPosition" class="col-1 col-form-label">직위</label>
						<div class="col-2">
							<select class="form-select" id="searchPosition" name="searchPosition">
								<option value="">선택</option>
								
							   	<c:forEach var="a" items="${positionList}">
									<c:if test="${a.name eq searchVo.searchPosition }">
										<option value="${a.name}" selected="selected">${a.name}</option>
									</c:if>
								    <c:if test="${a.name != searchVo.searchPosition}">
								       <option value="${a.name}">${a.name}</option>
								    </c:if>
							   </c:forEach>
								
							</select>
						</div>
						
						<label for="searchJobType" class="col-1 col-form-label" >직종</label>
						<div class="col-2">
							<select class="form-select" id="searchJobType" name="searchJobType">
								<option value="">선택</option>
								<c:forEach var="a" items="${jobTypeList}">
									<option value="${a.name}">${a.name}</option>
								</c:forEach>
							</select>
						</div>
						
						<label for="searchJoinDate" class="col-1 col-form-label">입사일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="searchJoinDate" name="searchJoinDate" value="${searchVo.searchJoinDate}">
						</div>
						
						<label for="searchRetireDate" class="col-1 col-form-label">퇴사일</label>
						<div class="col-2">
						  <input type="date" class="form-control" id="searchRetireDate" name="searchRetireDate" value="${searchVo.searchRetireDate}">
						</div>
					</div>
					
				<div align="right" class="pb-2">
					<button type="submit" class="btn btn-dark">검색</button>
					<button type="button" class="btn btn-dark" id="deleteBtn_list" >삭제</button>
					<button type="button" class="btn btn-dark" onclick="location.href='listForm.do'" >초기화</button>
					<!-- 	type="reset" 쓰지말고  -->
					<button type="button" class="btn btn-dark" onClick="location.href='index'">이전</button>
				</div>
<!-- 
*******************************************************
 * DESC : 직원 조회 리스트 출력
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
********************************************************
-->				<!-- start list result-->
				<table class="table table-hover text-center table-bordered">
				
					<thead align="center">
						<tr>
							<td id="checkbox_width"></td>
							<th id="agentNo_width">사번</th>
							<th id="name_width">성명</th>
							<th id="reg_width">주민번호</th>
							<th id="hp_width">휴대폰</th>
							<th id="job_width">직위</th>
							<th id="join_width">입사일</th>
							<th id="retire_width">퇴사일</th>
							<th id="put_width">투입여부</th>
							<th id="sal_width">연봉</th>
						</tr>
					</thead>
					
					
					<tbody>
						<c:forEach var="insaList" items="${insaList}">
							<tr>
								<td><input type="checkbox" class="checkedAgentNo" value="${insaList.agentNo}" ></td>
								<td><a href="#" id="insaPageHref" onclick="insaPageHref(${insaList.agentNo})"  value1="">${insaList.agentNo}</a></td>
								<%--<a href="insaPage.do?agentNo=${insaList.agentNo}" >${insaList.agentNo}</a> --%>
								<td>${insaList.name}</td>
								<td>${fn:substring (insaList.regNo, 0,fn:length(insaList.regNo)-6)}******</td>
								<td>${fn:substring (insaList.phone, 0,fn:length(insaList.phone)-4)}****</td>
								<td>${insaList.position}</td>
								<td>
									<fmt:parseDate value="${insaList.joinDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
									<fmt:formatDate type="both" value="${date}" pattern="yyyy-MM-dd"  />
								</td>
								<td>
									<fmt:parseDate value="${insaList.retireDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
									<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"  />
								<td>${insaList.putYn}</td>
								<td><fmt:parseNumber value="${insaList.salary}" var="salary" />
									<fmt:formatNumber value="${salary }" pattern="#,###" />
								</td>
								
							</tr>
						</c:forEach>
						
						<c:if test="${empty insaList}">
						<tr>
							<td colspan="10" align="center">
								검색 결과가 없습니다.
							</td>
						</tr>
						</c:if>
					</tbody>
					
					
				</table>
				<!-- end list result-->
				<!-- start Paging -->
				<div align="center">
					<br>
					
					<!-- 이전 10페이지 -->
					<c:if test="${paging.nowPage<= paging.listSize}">
						<button type="submit" name="nowRecord" disabled="disabled">이전</button>
					</c:if>
					
					<c:if test="${paging.nowRecord > (paging.pageSize * paging.listSize)}">
						<button type="submit" name="nowRecord" value="${(paging.startPage - paging.listSize) * paging.pageSize - paging.pageSize +1}">이전</button>
					</c:if>
					
					
					<!-- 페이지 수 블록 -->
					<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
						<c:if test="${i <= paging.totalPage}">
							<button type="submit" name="nowRecord" value="${(i -1 ) * 10+1}">${i}</button>
						</c:if>
					</c:forEach>
					
					
					<!-- 다음 10페이지 -->
					<c:if test="${paging.endPage < paging.totalPage}">
						<button type="submit" name="nowRecord" value="${paging.pageSize * paging.endPage +1}">다음</button>
					</c:if>
					<c:if test="${paging.endPage >= paging.totalPage}">
						<button type="submit" name="nowRecord" disabled="disabled">다음</button>
					</c:if>
					
				</div>
				
				
			
			
			</form>
			
		</main>
	</div><!-- cover-container -->

</body>
</html>