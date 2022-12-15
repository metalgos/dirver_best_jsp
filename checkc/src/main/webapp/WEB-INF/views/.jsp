<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Full Width Pics - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
    </head>
    <body>
         <!-- Responsive navbar-->
        <%@include file ="../../header.jsp" %>
        <video autoplay muted loop id="bg-video">
		<source src="resources/video/gfp-astro-timelapse.mp4" type="video/mp4">
	</video>

        
        <!-- Content section-->
	<section class="py-3">
		<form>
			<div class="container my-5">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<table class="table table-sm caption-top">
						<caption>알림 설정</caption>
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">알림음</th>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>알림음 선택</option>
											<option value="alarm1">삐용</option>
											<option value="alarm2">에에에엥</option>
											<option value="alarm3">야!!!!</option>
									</select>



										<form action="/file/alarm" method="post"
											enctype="multipart/form-data">
											<p>

												알림음을 직접 업로드 <input type="file" name="uploadFile" value=""
													accept="audio/*">
											</p>

											<p>
												<input type="submit" value="제출">
											</p>
										</form></td>
								</tr>
								<tr>
									<th scope="row">알림 시간</th>
									<td><select class="form-select"
										aria-label="Default select example">
											<option selected>알림 시간 선택</option>
											<option value="time1">2초</option>
											<option value="time2">4초</option>
											<option value="time3">6초</option>
									</select></td>
								</tr>
							</tbody>
						</table>

						<button type="button" class="btn btn-secondary"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="float:right;">
							졸음운전 수정완료</button>

						<!-- 수정완료 Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">수정이 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">확인</button>
									</div>
								</div>
							</div>
						</div>
						<!-- modal끝 -->
					</div>
				</div>
			</div>
		</form>
	</section>
	<div class="row justify-content-center">
            <div class="d-grid gap-2 col-6 mx-auto">
                <a href="list.html" class="btn btn-secondary disabled" tabindex="-1" role="button" aria-disabled="true">기록목록</a>
        </div>

	<!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-4 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>

