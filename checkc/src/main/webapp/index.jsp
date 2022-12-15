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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Driver Best외부</title>
<link href="resources/css/index.css" rel="stylesheet" />
</head>
<body>
	<video autoplay muted loop id="bg-video">
		<source src="resources/video/gfp-astro-timelapse.mp4" type="video/mp4">
	</video>
<body id="particles-js"></body>
<div class="animated bounceInDown">
	<div class="container">
	
		<span class="error animated tada" id="msg"></span>
		<form action="${cpath}/memberLogin.do" method="POST" name="form1" class="box" >
			<h1>
				Driver<span>Best</span>
			</h1>
			<h2>로그인</h2>
			<input type="text" name="m_id" placeholder="아이디" autocomplete="off">
			<i class="typcn typcn-eye" id="eye"></i> 
			<input type="password"
				name="m_pw" placeholder="비밀번호" id="pwd" autocomplete="off">
			<input type="submit" value="로그인" class="btn1">
		</form>
		<a href="${cpath}/join.do" class="btn2">회원가입</a>
	</div>
	<div class="footer"></div>
</div>
<script type="text/javascript">
	function logout() {
		location.href = "${cpath}/memberLogout.do";
	}

	function returnJsp(nextPage) {

		location.href = "${cpath}/pagenext.do?nextPage=" + nextPage;
	}
</script>



<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="resources/js/jquery-3.6.1.min.js"></script>
<script src="resources/js/index.js"></script>
<script src="resources/js/WebCam2.js"></script>
</body>
</html>