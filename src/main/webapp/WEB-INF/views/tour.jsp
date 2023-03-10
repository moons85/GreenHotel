<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/tour.css">
<%@ include file="layout/header.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c0872d868e5210385c4c92e6eb951e7"></script>
<div class="modalal">
    <div class="modalal_body">
        <div class="mapwrap">
            <div id="kakaomap"></div>
        </div>
    </div>
</div>
<section class="hero-wrap hero-wrap-2"
         style="background-image: url(/images/room-16.png);"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div
                class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="/">Home <i
                            class="fa fa-chevron-right"></i></a></span> <span>Hot place <i
                        class="fa fa-chevron-right"></i></span>
                </p>
                <h1 class="mb-0 bread">Hot place</h1>
            </div>
        </div>
    </div>
</section>
<div class="tour_list_wrap">

</div>
<script defer src="/js/tour.js"></script>
<%@ include file="layout/footer.jsp"%>