<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<!-- Favicon-->
<!--  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
 function goIndex(){
	 location.href="index.jsp";
 }
</script>
</head>


<body>
	<!-- Responsive navbar-->

	<%@include file="../../header.jsp"%>

	<video autoplay muted loop id="bg-video">
		<source src="resources/video/gfp-astro-timelapse.mp4" type="video/mp4">
	</video>

	<section class="py-5">
	<section class="py-3">
		<div class="container my-3"></div>
	</section>
		<div class="container">
		
			<form action="${cpath}/memberInsert.do" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">아이디</label> <input
						type="text" name="m_id" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>
				<div class="form-group has-success">
					<label class="form-label" for="inputValid">비밀번호</label> <input
						type="password" name="m_pw" class="form-control" id="inputValid">
					<div class="valid-feedback"></div>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">이름</label> <input
						type="text" name="m_name" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">차량번호</label> <input
						type="text" name="m_car" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label mt-4">전화번호</label>
					<input type="text" name="m_tel" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">주소</label> <input
						type="text" name="m_address" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1" class="form-label">비상연락망</label> <input
						type="text" name="m_emergency" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
				</div>

				<section class="py-5">
		<div class="container my-1"></div>
	</section>
				<!-- 자바스크립트 녹화랑 연동하기위해 가입하기 버튼 아이디 따로 만들어서 스타일 적용, -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<button class="btn btn-primary" type="submit" >가입하기</button>
					<button class="btn btn-primary" type="button"
						onclick="goIndex()">취소</button>
				</div>


			</form>
			
		</div>

	</section>

	<!-- Content section-->
	<section class="py-5">
		<div class="container my-5"></div>
	</section>
	<!-- Footer-->
	<%@include file="../../footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<!--  
  <script src="resources/js/WebCam3_insertMember.js"></script>
  -->
</body>

</html>