<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="layout/header.jsp"%>


<section class="ftco-section bg-light">

    <div class="container" style="display: flex; justify-content: center;">
        <div class="row justify-content-center align-items-center text-center" style=" width: 100%;">
            <div class="col-lg-12">
                <form action="#" class="appointment-form">
                    <h3 class="mb-3 text-center">Filter</h3>
                    <div class="row align-items-center">
                        <input type="hidden" class="form-control" value="이름받아오기">
                        <div class="col-md-3">
                            <div class="form-group">
                                <div class="input-wrap">
                                    <div class="icon"><span class="ion-md-calendar"></span></div>
                                    <input type="text" class="form-control appointment_date-check-in" id="checkin" placeholder="Check-In" value="${startDate}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <div class="input-wrap">
                                    <input type="text" class="form-control appointment_date-check-out" id="checkout" placeholder="Check-Out" value="${endDate}">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <c:if test="${adult==1}">
                                            <select name="" id="adult" class="form-control">
                                                <option value="">성인</option>
                                                <option value="1" selected="selected">성인 1명</option>
                                                <option value="2">성인 2명</option>
                                            </select>
                                        </c:if>
                                        <c:if test="${adult==2}">
                                            <select name="" id="adult" class="form-control">
                                                <option value="">성인</option>
                                                <option value="1">성인 1명</option>
                                                <option value="2" selected="selected">성인 2명</option>
                                            </select>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <div class="form-field">
                                    <div class="select-wrap">
                                        <c:if test="${kid==0}">
                                            <select name="" id="kid" class="form-control">
                                                <option value="">아동</option>
                                                <option value="0" selected="selected">아동 0명</option>
                                                <option value="1">아동 1명</option>
                                                <option value="2">아동 2명</option>
                                            </select>
                                        </c:if>
                                        <c:if test="${kid==1}">
                                            <select name="" id="kid" class="form-control">
                                                <option value="">아동</option>
                                                <option value="0">아동 0명</option>
                                                <option value="1"  selected="selected">아동 1명</option>
                                                <option value="2">아동 2명</option>
                                            </select>
                                        </c:if>
                                        <c:if test="${kid==2}">
                                            <select name="" id="kid" class="form-control">
                                                <option value="">아동</option>
                                                <option value="0">아동 0명</option>
                                                <option value="1">아동 1명</option>
                                                <option value="2" selected="selected">아동 2명</option>
                                            </select>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <input type="submit" value="변경하기" class="btn btn-primary btn6 py-3 px-4" onclick="room()">
                            </div>
                        </div>
                        <input type="hidden" class="form-control" placeholder="연락처">
                    </div>
                </form>
                <br><br>
            </div>

        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <h2>Reseach Result</h2>
                <br><br>
            </div>

            <!--검색시 해당 div를 반복-->
            <c:forEach var="room" items="${room}" varStatus="status">
                <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate margin-bottom">
                    <div class="d-block services-wrap text-center">
                        <a href="/auth/roomdetail/${room.id}" class="img">
                            <div class="img" style="background-image: url(/room/${room.roommainimg});">
                            </div>
                        </a>
                        <div class="media-body py-4 px-3">
                            <h3 class="heading" id="roomname">${room.roomname}</h3>
                            <div class="text-center">
                                <p class="star mb-0"><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span></p>
                                <ul class="list-accomodation roomlist" id="room">
                                    <li><span>Max:</span> ${room.maxpeople}</li>
                                    <li><span>Size:</span> ${room.size}</li>
                                    <li><span>View:</span> ${room.view}</li>
                                    <li><span>Bed:</span> ${room.bed}</li>
                                    <li><span>price:</span> <span class="price mr-1"><fmt:formatNumber
                                            value="${room.price}" pattern="#,###,###" /></span> <span class="per">원</span></li>
                                </ul>
                            </div>
                            <div class="row justify-content-center">
                                <p><a href="/auth/roomdetail/${room.id}" class="btn btn-primary btn5">방 정보</a></p>
                                <p><a href="#" class="btn btn-primary btn5" onclick="reserve(this.id); return false;" id="${room.id}">예약하기</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br><br><br>
    </div>
    <br><br>
</section>

<script defer src="/js/reservation.js"></script>
<%@ include file="layout/footer.jsp"%>