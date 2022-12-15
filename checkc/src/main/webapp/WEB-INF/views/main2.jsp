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
<title>Driver Best내부</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
#preview{
	transform: rotateY(180deg);
	-webkit-transform: rotateY(180deg); /* Safari and Chrome */
	-moz-transform: rotateY(180deg); /* Firefox */
}
</style>

</head>
<body>
	<!-- Responsive navbar-->
	<%@include file="../../header.jsp"%>

	<!--자바스클비트에서 세션값 가져오기위한 소스  -->
	<input type="hidden" value="${loginMember.m_no}" id="loginuser">
	<!-- 카테고리-->
	<section class="pt-4">
		<video autoplay muted loop id="bg-video">
			<source src="resources/video/gfp-astro-timelapse.mp4"
				type="video/mp4">
		</video>
		<!--  
            <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="index.html">메인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="sleepy.html">졸음 운전</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="steal.html">차량 도난</a>
                </li>
                <li class="nav-item">
                 <a class="nav-link" href="list.html">도난 기록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Mypage.html">개인 정보</a>
                   </li>
              </ul>
              -->
		<div class="p-4 p-lg-5 rounded-3 text-center">
			<div class="m-4 m-lg-5">
				<video class="position-absolute top-50 start-50 translate-middle w-100 p-3" id="preview" autoplay
					mute style="border: 1px solid #000;"></video>
			</div>
		</div>
	</section>

	<section class="py-3">
		<div class="container my-5 text-center" style="font-size:2em">도난 CAM</div>
	</section>


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
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/WebCam4_donan.js"></script>
	
</body>
</html>