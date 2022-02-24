<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="css/insaList.css" rel="stylesheet">
<script src="js/insaList.js" ></script>
  
<style>
#checkbox_width {
	width: 3%;
}
#sabun_width {
	width: 7%;
}
#name_width {
	width: 7%;
}
#reg_width {
	width: 12%;
}
#hp_width {
	width: 10%;
}
#job_width {
	width: 5%;
}
#join_width {
	width: 12%;
}
#retire_width {
	width: 12%;
}
#put_width {
	width: 7%;
}
#sal_width {
	width: 5%;
}

</style>
<script>
function insaPageHref(i) {
	//alert("1");
	//alert( i );
	$("#sabun").val( i );
	//alert( $("#sabun").val() );
	
	$("form").attr("action", "insaPage.do");
	$("form").submit();
	
}

</script>
</head>
  
  
<body class="bg-light">
	
<form action="insaList.do" method="get">
	<input type="hidden" id="sabun" name="sabun" value="" >
	<table>
		<thead id="thead1">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				
				<td class="form-label">사번</td>
				<td><input type="text" id="search_sabun" name="search_sabun" class="form-control d-line" value="${searchVo.search_sabun }"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='10' >
					</td>
				<td class="form-label">한글성명</td>
				<td><input type="text" id="search_name" name="search_name" class="form-control d-line"  value="${searchVo.search_name }" onKeypress="hangul()" maxlength="5" ></td>
				
				
				
				<td class="form-label">입사구분</td>
				<td>
					
					
					<select class="form-select"  name="search_join_gbn_code" id="search_join_gbn_code">
					
					   <option value="">선택</option>
					   
					   <c:forEach var="join_gbn_codeList1" items="${join_gbn_codeList}">
					      <c:if test="${join_gbn_codeList1.name eq searchVo.search_join_gbn_code }">
					         <option value="${join_gbn_codeList1.name}" selected="selected">${join_gbn_codeList1.name}</option>
					      </c:if>
					      
					      <c:if test="${join_gbn_codeList1.name != searchVo.search_join_gbn_code}">
					         <option value="${join_gbn_codeList1.name}">${join_gbn_codeList1.name}</option>
					      </c:if>
					   </c:forEach>
					   
					</select>
					
					
					
					
					
				</td>
				
				<td class="form-label">투입여부</td>
				<td>
					<select class="form-select" id="search_put_yn" name="search_put_yn">
						<option value="">선택</option>

					   <c:forEach var="put_ynList1" items="${join_gbn_codeList}">
					      <c:if test="${put_ynList1.name eq searchVo.search_put_yn }">
					         <option value="${put_ynList1.name}" selected="selected">${put_ynList1.name}</option>
					      </c:if>
					      
					      <c:if test="${put_ynList1.name != searchVo.search_put_yn}">
					         <option value="${put_ynList1.name}">${put_ynList1.name}</option>
					      </c:if>
					   </c:forEach>
					   
					   
						
					</select>
				</td>
				
			</tr>
			
			<tr>
				<td class="form-label">직위</td>
				<td>
					<select class="form-select" id="search_pos_gbn_code" name="search_pos_gbn_code">
						<option value="">선택</option>
						
					   	<c:forEach var="pos_gbn_codeList1" items="${pos_gbn_codeList}">
							<c:if test="${pos_gbn_codeList1.name eq searchVo.search_pos_gbn_code }">
								<option value="${pos_gbn_codeList1.name}" selected="selected">${pos_gbn_codeList1.name}</option>
							</c:if>
						    <c:if test="${pos_gbn_codeList1.name != searchVo.search_pos_gbn_code}">
						       <option value="${pos_gbn_codeList1.name}">${pos_gbn_codeList1.name}</option>
						    </c:if>
					   </c:forEach>
						
					</select>
				</td>
				
				<td class="form-label">입사일자</td>
				<td>
					<input type="date" class="form-control d-line" id="search_join_day" name="search_join_day" value="${searchVo.search_join_day }">
				</td>
				
				<td class="form-label">퇴사일자</td>
				<td><input type="date" class="form-control d-line datepicker" id="search_retire_day" name="search_retire_day" value="${searchVo.search_retire_day }"></td>
				
				<td class="form-label">직종</td>
				<td>
					<select class="form-select" id="search_job_type" name="search_job_type">
						<option value="">선택</option>
						
					   	<c:forEach var="job_typeList1" items="${job_typeList}">
							<c:if test="${job_typeList1.name eq searchVo.search_job_type }">
								<option value="${job_typeList1.name}" selected="selected">${job_typeList1.name}</option>
							</c:if>
						    <c:if test="${job_typeList1.name != searchVo.search_job_type}">
						       <option value="${job_typeList1.name}">${job_typeList1.name}</option>
						    </c:if>
					   </c:forEach>
						
					</select>
				</td>
			</tr>
		</tbody>
		
	</table>

	<div align="right">
			<button type="submit" class="btn btn-dark">검색</button>
			<button type="button" class="btn btn-dark" id="deleteBtn_list" >삭제</button>
			<button type="button" class="btn btn-dark" onclick="location.href='insaListForm.do'" >초기화</button>
			<!-- 	type="reset" 쓰지말고  -->
			<button type="button" class="btn btn-dark" onClick="location.href='index'">이전</button>
	</div>



<table class="table table-bordered text-center">
	<thead>
		<tr>
			<td id="checkbox_width"></td>
			<th id="sabun_width">사번</th>
			<th id="name_width">성명</th>
			<th id="reg_width">주민번호</th>
			<th id="hp_width">핸드폰 번호</th>
			<th id="job_width">직위</th>
			<th id="join_width">입사일자</th>
			<th id="retire_width">퇴사일자</th>
			<th id="put_width">투입여부</th>
			<th id="sal_width">연봉</th>
		</tr>
	</thead>
	
	<tbody>
	
		<c:forEach var="insaList" items="${insaList}">
			<tr>
				<td><input type="checkbox" class="checkedSabun" value="${insaList.sabun}" ></td>
				<td><a href="#" id="insaPageHref" onclick="insaPageHref(${insaList.sabun})"  value1="">${insaList.sabun}</a></td>
				<%--<a href="insaPage.do?sabun=${insaList.sabun}" >${insaList.sabun}</a> --%>
				<td>${insaList.name}</td>
				<td>${fn:substring (insaList.reg_no, 0,fn:length(insaList.reg_no)-6)}******</td>
				<td>${fn:substring (insaList.hp, 0,fn:length(insaList.hp)-4)}****</td>
				<td>${insaList.pos_gbn_code}</td>
				<td>
					<fmt:parseDate value="${insaList.join_day}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate type="both" value="${date}" pattern="yyyy-MM-dd"  />
				</td>
				<td>
					<fmt:parseDate value="${insaList.retire_day}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"  />
				<td>${insaList.put_yn}</td>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
