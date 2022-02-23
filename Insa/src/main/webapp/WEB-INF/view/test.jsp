<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS,JS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>


<!-- Button trigger modal 사업자등록증 미리보기-->
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
<button type="button" class="btn btn-outline-dark">업로드</button>

<hr>

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
<button type="button" class="btn btn-outline-dark">업로드</button>


</body>
</html>