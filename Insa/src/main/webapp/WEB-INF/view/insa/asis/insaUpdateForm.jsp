<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.File" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 시스템</title>


<!-- Custom styles for this template -->

<link href="css/insaInput.css" rel="stylesheet">
<script src="js/insaUpdate.js"></script>


<style>
table { /* table이 브라우저에 꽉차게 */
	width: 100%;
}
.form-label {
text-align: center;
}

/* 위에는 따로 css로 옮기면 안됨 */
.btn {
	margin-right: 5px;
	width: 150px; /* 버튼 넓이 */
}
</style>
<script>

</script>


</head>


<body class="bg-light">

	<form action="insaUpdate.do" method="post" onsubmit="return check()" enctype="multipart/form-data">
													<!-- form에서 파일업로드해서 넘길때 꼭 써줘야하는 설정 : "html form 자료실"검색 -->
		<input type="hidden" id="search_sabun" name="search_sabun" value="${searchVo.search_sabun}">
		<input type="hidden" id="search_name" name="search_name" value="${searchVo.search_name}">
		<input type="hidden" id="search_join_gbn_code" name="search_join_gbn_code" value="${searchVo.search_join_gbn_code}">
		<input type="hidden" id="search_put_yn" name="search_put_yn" value="${searchVo.search_put_yn}">
		<input type="hidden" id="search_pos_gbn_code" name="search_pos_gbn_code" value="${searchVo.search_pos_gbn_code}">
		<input type="hidden" id="search_join_day" name="search_join_day" value="${searchVo.search_join_day}">
		<input type="hidden" id="search_retire_day" name="search_retire_day" value="${searchVo.search_retire_day}">
		<input type="hidden" id="search_job_type" name="search_job_type" value="${searchVo.search_job_type}">
		<table >

			<thead >
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						<div align="right">
							<button type="submit" class="btn-dark d-line" >수정</button>
							<button type="button" class="btn-dark d-line" id="deleteBtn_page"  >삭제</button>
							<button type="button" class="btn-dark d-line" onClick="location.href='index'">이전</button>
						</div>
					</td>
				</tr>
			</thead>
			
			
			<tbody>
				<tr>
					<td rowspan="6" colspan="2" align="center">
						<c:if test="${insaPage.profile eq 'default_profile.jpg' }">
							<img src="/images/default_profile.jpg" id="profile_thumbnail" name="profile_file" class="file img-thumbnail" width="150" height="120"><br><br>
						</c:if>
						<c:if test="${insaPage.profile !=  'default_profile.jpg' }">
			        		<img src="/images/profile/${insaPage.profile}" id="profile_thumbnail" name="profile_file" class="file img-thumbnail" width="150" height="120"><br><br>
			   			</c:if>
						<input type="button" id="profile_btn" class="btn-outline-dark" value="사진 올리기" onclick=document.all.file.click();><!-- 첨부파일 링크 -->
						<input type="file" id="file" name='profile_file' onchange="setThumbnail(event);" style="display: none;"/><!-- 첨부파일 안보이게 -->
					</td>
					<td class="form-label">*사번</td>
					<td><input type="text" id="sabun" name="sabun" class="form-control d-line" style="text-align: right;" value="${insaPage.sabun}" readonly></td>
					<td class="form-label">*한글성명</td>
					<td><input type="text" id="name" name="name" class="form-control d-line" onKeypress="hangul()" maxlength="5" value="${insaPage.name}"></td>
					<td class="form-label">영문이름</td>
					<td><input type="text" id="eng_name" name="eng_name" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^A-Za-z_]/g,'');" value="${insaPage.eng_name}"></td>
				</tr>
	
				<tr>
					<td class="form-label">*아이디</td>
					<td><input type="text" id="id" name="id" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" maxlength='12' value="${insaPage.id}"  readonly></td>
					<td class="form-label">*패스워드</td>
					<td><input type="text" id="pwd" name="pwd" class="form-control d-line" maxlength='12' value="${insaPage.pwd}" ></td>
					<td class="form-label">*패스워드 확인</td>
					<td><input type="text" id="pwd2" name="pwd2" class="form-control d-line"  maxlength='12' value="${insaPage.pwd}" >
						<span id="pwd_result"></span>
					</td>
				</tr>
	
				<tr>
					<td class="form-label">전화번호</td>
					<td><input type="text" id="phone" name="phone" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13"  value="${insaPage.phone}" ></td>
					<td class="form-label">*핸드폰 번호</td>
					<td><input type="text" id="hp" name="hp" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="13" value="${insaPage.hp}"  ></td>
					<td class="form-label">*주민번호</td>
					<td>
						<input type="text" id="reg_no_masking" class="form-control d-line" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength='14' value="${insaPage.reg_no}"  >
						<input type="hidden" id="reg_no" name="reg_no" class="form-control d-line" value="${insaPage.reg_no}" maxlength='14'>
					</td>
				</tr>
	
				<tr>
					<td class="form-label d-line">*이메일</td>
					<td colspan="2">
						<div class="input-group">
						<input type="text" id="email1" name="email1" class="form-control " onKeyup="this.value=this.value.replace(/[^A-Za-z0-9_]/g,'');" value="${insaPage.email1}"  >
							&nbsp;@&nbsp;
							<input type="text" id="email2" name="email2" class="form-control" value="${insaPage.email2}" readonly >
							<select id="emailList" name="emailList" class="form-select d-inline"  onChange="selectEmail(this)" >
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
					</td>
					<td>
						<div class="input-group">
						&nbsp;직종&nbsp;
							<select id="job_type" name="job_type"  class="form-select d-line"  value="${insaPage.job_type}">
								<option value="">선택</option>
								
								<c:forEach var="job_typeList1" items="${job_typeList}">
									<c:if test="${job_typeList1.name eq insaPage.job_type }">
										<option value="${job_typeList1.name}" selected="selected">${job_typeList1.name}</option>
									</c:if>
									<c:if test="${job_typeList1.name != insaPage.job_type}">
						        		<option value="${job_typeList1.name}">${job_typeList1.name}</option>
						   			</c:if>
								</c:forEach>
								
							</select> 
						</div>
					</td>
					<td class="form-label d-line" colspan="2" >
						<div class="input-group">
							연령<input type="text" id="years" name="years" class="form-control" value="${insaPage.years}" readonly>
							&nbsp;성별&nbsp;
							<select id="sex" name="sex" class="form-select d-line">
								<option value=""></option>
								
								
								<c:forEach var="sexList" items="${sexList}">
									<c:if test="${sexList.name eq insaPage.sex }">
										<option value="${sexList.name}" selected="selected">${sexList.name}</option>
									</c:if>
									<c:if test="${sexList.name != insaPage.sex}">
						        		<option value="${sexList.name}">${sexList.name}</option>
						   			</c:if>
								</c:forEach>								
								
								
							</select>
						</div>
					</td>
				</tr>
	
				<tr>
					<td class="form-label">주소</td>
					<td>
						<div class="input-group">
						<input type="text" id="sample6_postcode" name="zip" class="form-control d-line" value="${insaPage.zip}" readonly>
						<button type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-dark">주소검색</button>
						</div>
					</td>
					<td colspan="2">
						<input type="text" id="sample6_address" name="addr1" value="${insaPage.addr1}" class="form-control d-line" readonly>
					</td>
					<td colspan="2">
						<input type="text" id="sample6_detailAddress" name="addr2" value="${insaPage.addr2}" class="form-control d-line"> 
						<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
					</td>
				</tr>
	
				<tr>
					<td class="form-label">직위</td>
					<td>
						<select class="form-select" id="pos_gbn_code" name="pos_gbn_code">
							<option value="">선택</option>
							
							<c:forEach var="pos_gbn_codeList" items="${pos_gbn_codeList}">
								<c:if test="${pos_gbn_codeList.name eq insaPage.pos_gbn_code }">
									<option value="${pos_gbn_codeList.name}" selected="selected">${pos_gbn_codeList.name}</option>
								</c:if>
								<c:if test="${pos_gbn_codeList.name != insaPage.pos_gbn_code}">
					        		<option value="${pos_gbn_codeList.name}">${pos_gbn_codeList.name}</option>
					   			</c:if>
							</c:forEach>		
							
							
						</select>
					</td>
					<td class="form-label">부서</td>
					<td>
						<select class="form-select" id="dept_code" name="dept_code">
							<option value="" value2="000">선택</option>
							
							<c:forEach var="dept_codeList" items="${dept_codeList}">
								<c:if test="${dept_codeList.name eq insaPage.dept_code }">
									<option value="${dept_codeList.name}" selected="selected">${dept_codeList.name}</option>
								</c:if>
								<c:if test="${dept_codeList.name != insaPage.dept_code}">
					        		<option value="${dept_codeList.name}">${dept_codeList.name}</option>
					   			</c:if>
							</c:forEach>	
							
						</select>
					</td>
					<td class="form-label">연봉</td>
					<td>
					<input type="text" id="salary_comma" name="salary_comma" placeholder="(만원)" style="text-align: right;" class="form-control d-line" value="${insaPage.salary}">
					<input type="hidden" id="salary" name="salary" value="${insaPage.salary}">
					</td>
				</tr>
	
				<tr>
					<td class="form-label">입사구분</td>
					<td>
						<select class="form-select" id="join_gbn_code" name="join_gbn_code">
							<option value="">선택</option>
							
							
							
							<c:forEach var="join_gbn_codeList" items="${join_gbn_codeList}">
								<c:if test="${join_gbn_codeList.name eq insaPage.join_gbn_code }">
									<option value="${join_gbn_codeList.name}" selected="selected">${join_gbn_codeList.name}</option>
								</c:if>
								<c:if test="${join_gbn_codeList.name != insaPage.join_gbn_code}">
					        		<option value="${join_gbn_codeList.name}">${join_gbn_codeList.name}</option>
					   			</c:if>
							</c:forEach>	
							
						</select>
					</td>
					<td class="form-label">등급</td>
					<td>
						<select class="form-select" id="gart_level" name="gart_level">
							<option value="">선택</option>
							
							
							
							<c:forEach var="gart_levelList" items="${gart_levelList}">
								<c:if test="${gart_levelList.name eq insaPage.gart_level }">
									<option value="${gart_levelList.name}" selected="selected">${gart_levelList.name}</option>
								</c:if>
								<c:if test="${gart_levelList.name != insaPage.gart_level}">
					        		<option value="${gart_levelList.name}">${gart_levelList.name}</option>
					   			</c:if>
							</c:forEach>	
							
							
						</select>
					</td>
					<td class="form-label">투입여부</td>
					<td>
						<select class="form-select" id="put_yn" name="put_yn">
							<option value="">선택</option>
							
							
							
							<c:forEach var="put_ynList" items="${put_ynList}">
								<c:if test="${put_ynList.name eq insaPage.put_yn}">
									<option value="${put_ynList.name}" selected="selected">${put_ynList.name}</option>
								</c:if>
								<c:if test="${put_ynList.name != insaPage.put_yn}">
					        		<option value="${put_ynList.name}">${put_ynList.name}</option>
					   			</c:if>
							</c:forEach>	
							
							
						</select>
					</td>
					<td class="form-label">군필여부</td>
					<td>
						<select class="form-select" id="mil_yn" name="mil_yn">
							<option value="">선택</option>
							
							
							
							<c:forEach var="mil_ynList" items="${mil_ynList}">
								<c:if test="${mil_ynList.name eq insaPage.mil_yn }">
									<option value="${mil_ynList.name}" selected="selected">${mil_ynList.name}</option>
								</c:if>
								<c:if test="${mil_ynList.name != insaPage.mil_yn}">
					        		<option value="${mil_ynList.name}">${mil_ynList.name}</option>
					   			</c:if>
							</c:forEach>	
							
							
						</select>
					</td>
				</tr>
	
				<tr>
					<td class="form-label">군별</td>
					<td>
						<select class="form-select" id="mil_type" name="mil_type" >
							<option value="">선택</option>
							
							
							
							<c:forEach var="mil_typeList" items="${mil_typeList}">
								<c:if test="${mil_typeList.name eq insaPage.mil_type }">
									<option value="${mil_typeList.name}" selected="selected">${mil_typeList.name}</option>
								</c:if>
								<c:if test="${mil_typeList.name != insaPage.mil_type}">
					        		<option value="${mil_typeList.name}">${mil_typeList.name}</option>
					   			</c:if>
							</c:forEach>	
							
							
						</select>
					</td>
					<td class="form-label">계급</td>
					<td>
						<select class="form-select" id="mil_level" name="mil_level">
							<option value="">선택</option>
							
							<c:forEach var="mil_levelList" items="${mil_levelList}">
								<c:if test="${mil_levelList.name eq insaPage.mil_level }">
									<option value="${mil_levelList.name}" selected="selected">${mil_levelList.name}</option>
								</c:if>
								<c:if test="${mil_levelList.name != insaPage.mil_level}">
					        		<option value="${mil_levelList.name}">${mil_levelList.name}</option>
					   			</c:if>
							</c:forEach>
							
						</select>
					</td>
					<td class="form-label">입영일자</td>
					<td><input type="date" class="form-control d-line" id="mil_startdate" name="mil_startdate" value="${insaPage.mil_startdate }"></td>
					<td class="form-label">전역일자</td>
					<td><input type="date" class="form-control d-line" id="mil_enddate" name="mil_enddate" value="${insaPage.mil_enddate }"></td>
				</tr>
	
				<tr>
					<td class="form-label">KOSA등록</td>
					<td>
						<select class="form-select" id="kosa_reg_yn" name="kosa_reg_yn">
							<option value="">선택</option>
							
							
							
							<c:forEach var="kosa_reg_ynList" items="${kosa_reg_ynList}">
								<c:if test="${kosa_reg_ynList.name eq insaPage.kosa_reg_yn }">
									<option value="${kosa_reg_ynList.name}" selected="selected">${kosa_reg_ynList.name}</option>
								</c:if>
								<c:if test="${kosa_reg_ynList.name != insaPage.kosa_reg_yn}">
					        		<option value="${kosa_reg_ynList.name}">${kosa_reg_ynList.name}</option>
					   			</c:if>
							</c:forEach>
							
						</select>
					</td>
					<td class="form-label">KOSA등급</td>
					<td>
						<select class="form-select" id="kosa_class_code" name="kosa_class_code" >
							<option value="">선택</option>
							
							<c:forEach var="kosa_class_codeList" items="${kosa_class_codeList}">
								<c:if test="${kosa_class_codeList.name eq insaPage.kosa_class_code }">
									<option value="${kosa_class_codeList.name}" selected="selected">${kosa_class_codeList.name}</option>
								</c:if>
								<c:if test="${kosa_class_codeList.name != insaPage.kosa_class_code}">
					        		<option value="${kosa_class_codeList.name}">${kosa_class_codeList.name}</option>
					   			</c:if>
							</c:forEach>
							
							
						</select>
					</td>
					<td class="form-label">*입사일자</td>
					<td><input type="date" class="form-control d-line" id="join_day" name="join_day" value="${insaPage.join_day}"  />
						
					
					
					</td>
					<td class="form-label">퇴사일자</td>
					<td><input type="date" class="form-control d-line" id="retire_day" name="retire_day"  value="${insaPage.retire_day }"></td>
				</tr>
	
				<tr>
					<td class="form-label">사업자번호</td>
					<td><input type="text" id="cmp_reg_no" name="cmp_reg_no" class="form-control d-line" maxlength="10" value="${insaPage.cmp_reg_no }"></td>
					<td class="form-label">사업자업체명</td>
					<td><input type="text" id="crm_name" name="crm_name" class="form-control d-line" value="${insaPage.crm_name }"></td>
					<td class="form-label">사업자등록증</td>
					<td><input type="text" id="cmp_reg_img_text"  class="form-control d-line" value="${insaPage.cmp_reg_img }" readonly></td>
					
					<td colspan="2">
						<div style="text-align: center;">
							<!--사업자등록증 Button trigger modal -->
							<button type="button" class="btn-outline-dark" data-toggle="modal" data-target="#cmp_modal">미리보기</button>
							<!-- Modal -->
							<div class="modal fade" id="cmp_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel" >사업자 등록증 미리보기</h5>
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							      </div>
							      <div class="modal-body">
							      	<c:if test="${insaPage.cmp_reg_img eq 'default_cmp.jpg' }">
							      		<img src="/images/default_cmp.jpg" id="cmp_img_preview" width="400">
									</c:if>
									<c:if test="${insaPage.cmp_reg_img !=  'default_cmp.jpg' }">
						        		<img src="/images/cmp_reg/${insaPage.cmp_reg_img}" id="cmp_img_preview" width="400">
						   			</c:if>
							      
							      </div>
							    </div>
							  </div>
							</div>
							<!-- Modal end -->
							
							<input type="file" id="cmp_reg_img_file" name="cmp_reg_img_file" onchange="setCmpPreview(event);"  style="display: none;"/><!-- "display: none;" = 안보이게 -->
							<input type="button" class="btn-outline-dark" value="등록증 업로드" onclick=document.all.cmp_reg_img_file.click();>
																									<!-- cmp_reg_img_file로 click링크 -->
							
						</div>
					</td>
				</tr>

				<tr>
					<td class="form-label">자기소개</td>
					<td colspan="3">
						<textarea id="self_intro" name="self_intro" placeholder="100자 내외로 적으시오" class="form-control d-line">${insaPage.self_intro}</textarea>
					</td>
					<td class="form-label">이력서</td>
					<td>
						<input type="text" id="carrier_text" class="form-control d-line" value="${insaPage.carrier }" readonly>
					</td>
					<td colspan="2">
						<div style="text-align: center;">
							<!--이력서 Button trigger modal -->
							<button type="button" class="btn-outline-dark" data-toggle="modal" data-target="#carrier_modal">미리보기</button>
							<!-- Modal -->
							<div class="modal fade" id="carrier_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">이력서 미리보기</h5>
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							      </div>
							      <div class="modal-body">
							      	<c:if test="${insaPage.carrier eq 'default_carrier.jpg' }">
							      		<img src="/images/default_carrier.jpg" id="cmp_img_preview" width="400">
									</c:if>
									<c:if test="${insaPage.carrier !=  'default_carrier.jpg' }">
						        		<img src="/images/carrier/${insaPage.carrier}"  id="carrier_preview" width="400" >
						   			</c:if>
							      </div>
							    </div>
							  </div>
							</div>
							<!-- Modal end -->
							
							
							
							<input type="file" id="carrier_file" name="carrier_file" onchange="setCarrierPreview(event);" style="display: none;"/><!-- 첨부파일 안보이게 -->
							<input type="button" class="btn-outline-dark" value="이력서 사진 업로드" onclick=document.all.carrier_file.click();><!-- 첨부파일 링크 -->
							
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		

	</form>







</body>
</html>