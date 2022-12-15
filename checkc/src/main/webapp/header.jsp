<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container px-lg-5">
			<a class="navbar-brand" href="${cpath}/main">
				<h1>
					Driver<span> Best</span>
				</h1>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${cpath}/main">Home</a></li>
					<c:choose>

						<c:when test="${empty loginMember}">
							<li class="nav-item"><button type="button"
									class="btn btn-dark" data-bs-toggle="modal"
									data-bs-target="#exampleModal">로그인</button></li>
							<li class="nav-item"><a href="${cpath}/join.do"
								type="button" class="btn btn-dark">회원가입</a></li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><button type="button"
									class="btn btn-dark" onclick="returnJsp('main2')">도난</button></li>
							<li class="nav-item"><button type="button"
									class="btn btn-dark" onclick="returnJsp('alarm')">알림설정</button></li>
							<li class="nav-item"><button type="button"
									class="btn btn-dark" onclick="returnJsp('list')">도난기록</button></li>
							<li class="nav-item"><button type="button"
									class="btn btn-dark" onclick="returnJsp('Mypage')">개인정보</button></li>

							<li class="nav-item"><button type="button"
									onclick="logout()" class="btn btn-dark">로그아웃</button></li>
						</c:otherwise>
					</c:choose>


				</ul>
			</div>
		</div>
	</nav>

	<!-- Modal -->
	<!-- 로그인 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<form action="${cpath}/memberLogin.do" method="POST">
					<div class="modal-body">
						<input type="text" name="m_id" placeholder="아이디" class="in">
						<input type="password" name="m_pw" placeholder="비밀번호" class="in">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-dark">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 스크립트  -->
	<script type="text/javascript">
		function logout() {
			location.href = "${cpath}/memberLogout.do";
		}

		function returnJsp(nextPage) {

			location.href = "${cpath}/pagenext.do?nextPage=" + nextPage;
		}
	</script>
</body>
</html>