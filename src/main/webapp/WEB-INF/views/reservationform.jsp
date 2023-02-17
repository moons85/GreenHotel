<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" defer src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%
    String Date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
    String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>
<%@ include file="layout/header.jsp"%>


<section class="hero-wrap hero-wrap-2"
         style="background-image: url(/images/room-14.png);"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div
                class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="/">Home <i
                            class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i
                        class="ion-ios-arrow-forward"></i></span>
                </p>
                <h1 class="mb-0 bread">Reservation Form</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-md-12">
                <div class="wrapper">
                    <div class="row no-gutters">
                        <div class="col-lg-8 col-md-7 d-flex align-items-stretch">
                            <div class="contact-wrap w-100 p-md-5 p-4">
                                <h3 class="mb-4">Reservation</h3>
                                <div id="form-message-warning" class="mb-4"></div>
                                <div id="form-message-success" class="mb-4">
                                    호텔 예약 페이지입니다. <br> 관련 문의는 메일링, 전화, 문의게시판을 이용해주시기 바랍니다.
                                </div>
                                <form id="contactForm" name="contactForm"
                                      class="contactForm">
                                    <div class="row row2">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="label" for="subject">작성자</label> <input
                                                    type="text" class="form-control" name="subject" id="uId"
                                                    value="${principal.user.id}" disabled>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="label" for="subject">이용일</label>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-wrap">
                                                    <div class="icon">
                                                        <span class="ion-md-calendar"></span>
                                                    </div>
                                                    <input type="text"
                                                           class="form-control appointment_date-check-in"
                                                           id="checkin" placeholder="Check-In" value="${startDate}" onchange="selectroom()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-wrap">
                                                    <input type="text"
                                                           class="form-control appointment_date-check-out"
                                                           id="checkout" placeholder="Check-Out" value="${endDate}" onchange="selectroom()">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="label" for="subject">인원</label>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <c:if test="${adult==1}">
                                                            <select name="" id="adult" class="form-control" onchange="selectroom()">
                                                                <option value="">성인</option>
                                                                <option value="1" selected="selected">성인 1명</option>
                                                                <option value="2">성인 2명</option>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${adult==2}">
                                                            <select name="" id="adult" class="form-control" onchange="selectroom()">
                                                                <option value="">성인</option>
                                                                <option value="1">성인 1명</option>
                                                                <option value="2" selected="selected">성인 2명</option>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${empty adult}">
                                                            <select name="" id="adult" class="form-control" onchange="selectroom()">
                                                                <option value="" selected="selected">성인</option>
                                                                <option value="1">성인 1명</option>
                                                                <option value="2">성인 2명</option>
                                                            </select>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-field">
                                                    <div class="select-wrap">
                                                        <c:if test="${kid==0}">
                                                            <select name="" id="kid" class="form-control" onchange="selectroom()">
                                                                <option value="">아동</option>
                                                                <option value="0" selected="selected">아동 0명</option>
                                                                <option value="1">아동 1명</option>
                                                                <option value="2">아동 2명</option>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${kid==1}">
                                                            <select name="" id="kid" class="form-control" onchange="selectroom()">
                                                                <option value="">아동</option>
                                                                <option value="0">아동 0명</option>
                                                                <option value="1" selected="selected">아동 1명</option>
                                                                <option value="2">아동 2명</option>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${kid==2}">
                                                            <select name="" id="kid" class="form-control" onchange="selectroom()">
                                                                <option value="">아동</option>
                                                                <option value="0">아동 0명</option>
                                                                <option value="1">아동 1명</option>
                                                                <option value="2" selected="selected">아동 2명</option>
                                                            </select>
                                                        </c:if>
                                                        <c:if test="${empty kid}">
                                                            <select name="" id="kid" class="form-control" onchange="selectroom()">
                                                                <option value="" selected="selected">아동</option>
                                                                <option value="0">아동 0명</option>
                                                                <option value="1">아동 1명</option>
                                                                <option value="2">아동 2명</option>
                                                            </select>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="label" for="roomname">Room</label>
                                                <div class="roomlist">

                                                </div>
                                                <input type="text" class="form-control" name="subject" id="roomname" value="${room.roomname}" readonly disabled>

                                            </div>
                                        </div>
                                        <div class="col-md-12 colbtn text-right">
                                            <div class="form-group">
                                                <div id="box">
                                                    <fmt:parseDate value="${startDate }" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                                    <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
                                                    <fmt:parseDate value="${endDate }" var="endPlanDate" pattern="yyyy-MM-dd"/>
                                                    <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
                                                    <input type="hidden" id="price" value="${room.price*(endDate - strDate)}">
                                                    price : <fmt:formatNumber value="${room.price*(endDate - strDate)}" pattern="#,###"/>원
                                                </div>
                                                <br>
                                                <input type="submit" value="돌아가기" class="btn btn6 btn-white" id="btnkakao">
                                                <input type="button" value="예약하기" class="btn btn6 btn-primary" id="pay">
                                                <div class="submitting"></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                            <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                                <h3>Private Hotel is...</h3>
                                <p class="mb-4">집과 같은 편안함, 궁과 같은 럭셔리함을 모두 잡은 당신만을 위한 숙소입니다.</p>
                                <div class="dbox w-100 d-flex align-items-start">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-map-marker"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p>
                                            <span>Address:</span> 경기도 수원시 팔달구 덕영대로 905 아이메카 7층
                                        </p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-phone"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p>
                                            <span>Phone:</span> <a href="tel://1234567920">+ 1235
                                            2355 98</a>
                                        </p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-paper-plane"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p>
                                            <span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a>
                                        </p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-globe"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p>
                                            <span>Website</span> <a href="#">yoursite.com</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script defer src="/js/reservation.js"></script>
<%@ include file="layout/footer.jsp"%>
