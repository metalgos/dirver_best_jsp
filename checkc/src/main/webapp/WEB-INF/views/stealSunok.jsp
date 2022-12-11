<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
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
    <!-- Header - set the background image for the header in the line below-->

    <!-- Content section-->
    <section class="py-3">
        <form>
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <!-- <table class="table table-hover"> -->
                        <table class="table table-sm caption-top">
						<caption>첨부 사진</caption>
                            <thead>
                                <tr>
                                    <th scope="col">2022-12-9 08:57</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                	<td>
                                	<div style="text-align : center;">
                                	<img src="resources/img/sunok.jpg" width=300; height=300;>
                                	</div>
                                	</td>
                                </tr>
                                <tr>
                                	<td>
                                	<div style="text-align : center;">
                              		<video width="300" height="300" src="resources/img/sunok.mp4" controls="controls"></video>
                                	</div>
                                	</td>
                                
                                </tr>
                            </tbody>
                             
                           
                        </table>
                    </div>
                </div>
            </div>
           
        </form>
    </section>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resources/js/scripts.js"></script>
</body>

</html>