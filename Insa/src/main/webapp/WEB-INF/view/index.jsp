<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <!-- Custom styles for this template -->
<link href="css/index.css" rel="stylesheet">
<!--
*******************************************************
 * DESC : 직원 홈 화면
 * AUTH : 박소영 (개발팀)
 * HIST : 20220220
********************************************************
-->
</head>
<body class="d-flex h-100 text-center text-white bg-dark">

<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<main class="px-3">
	  <h1>인사 시스템</h1>
	  <p class="lead">
	    <a href="INSA1.do" class="btn btn-lg btn-secondary fw-bold border-white bg-white">직원 등록</a>
	  </p>
	  <p class="lead">
	    <a href="INSA2.do" class="btn btn-lg btn-secondary fw-bold border-white bg-white">직원 조회</a>
	  </p>
	</main>
	
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
</div>

</body>
</html>