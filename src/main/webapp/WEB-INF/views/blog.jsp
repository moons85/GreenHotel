<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<%@ include file="layout/header.jsp"%>
<section class="hero-wrap hero-wrap-2"
	style="background-image: url('/images/room-12.png');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="index.html">Home <i
							class="fa fa-chevron-right"></i></a></span> <span>Reviews <i
						class="fa fa-chevron-right"></i></span>
				</p>
				<h1 class="mb-0 bread">Reviews</h1>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="row d-flex">
			<!--col-md-4 d-flex ftco-animate div를 기준으로 반복-->
			<c:forEach items="${review.content}" var="rev">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
					<c:choose>
						<c:when test="${rev.photo == null }">
							<a href="/auth/reviewDetail/${rev.id}" class="block-20 rounded"
								style="background-image: url('/image/');"> </a>
						</c:when>
						<c:otherwise>
							<a href="/auth/reviewDetail/${rev.id}" class="block-20 rounded"
								style="background-image: url('/image/${rev.photo}');"> </a>
						</c:otherwise>
					</c:choose>
						<div class="text p-4 text-center">
							<h3 class="heading">
								<a href="/auth/reviewDetail/${rev.id}">${rev.title}</a>
							</h3>
							<div class="meta mb-2">
								<div>
									<a href="/auth/reviewDetail/${rev.id}">${rev.createTime}</a>
								</div>
								<p class="star mb-0">
									<span class="fa fa-star"></span><span class="fa fa-star"></span><span
										class="fa fa-star"></span><span class="fa fa-star"></span><span
										class="fa fa-star"></span>
								</p>
							</div>
							<div class="ellipsis">${rev.content}</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row mt-5">
			<div class="col-md-12 text-center">
				<c:choose>
					<c:when test="${review.first}">
						<a href="#" onclick="return false;"
							style="margin: 10px; color: #ccc;"> < Previous</a>
					</c:when>
					<c:otherwise>
						<a href="?page=${review.number-1}" style="margin: 10px;"> <
							Previous</a>

					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${review.last}">
						<a href="#" onclick="return false;"
							style="margin: 10px; color: #ccc;">Next > </a>
					</c:when>
					<c:otherwise>
						<a href="?page=${review.number+1}" style="margin: 10px;">Next >
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</section>
<%@ include file="layout/footer.jsp"%>