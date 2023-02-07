<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<%@ include file="layout/header.jsp"%>
<section class="hero-wrap hero-wrap-2"
         style="background-image: url(/images/room-13.png);"
         data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div
                class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="/">Home <i
                            class="fa fa-chevron-right"></i></a></span> <span>Admin <i
                        class="fa fa-chevron-right"></i></span>
                </p>
                <h1 class="mb-0 bread">Admin</h1>
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
                                <h3 class="mb-4">Login</h3>
                                <ul>
                                    <li class="tab_menu menu1" style="cursor: pointer"
                                        onclick="menu1()">월별 매출</li>
                                    <li class="tab_menu menu2" style="cursor: pointer"
                                        onclick="menu2()">예약 확인</li>
                                    <li class="tab_menu menu3" style="cursor: pointer"
                                        onclick="menu3()">객실 등록</li>
                                    <li class="tab_menu menu4" style="cursor: pointer"
                                        onclick="menu4()">객실 수정</li>
                                </ul>
                                <div class="mSales">
                                    <c:forEach var="price" items="${price}" varStatus="status">
                                        <input type="hidden" value="${price}" id="mon${status.count}">
                                    </c:forEach>
                                    <div>
                                        <canvas id="myChart"></canvas>
                                    </div>
                                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                                    <script>
                                        var mon1=$("#mon1").val();
                                        var mon2=$("#mon2").val();
                                        var mon3=$("#mon3").val();
                                        var mon4=$("#mon4").val();
                                        var mon5=$("#mon5").val();
                                        var mon6=$("#mon6").val();
                                        var mon7=$("#mon7").val();
                                        var mon8=$("#mon8").val();
                                        var mon9=$("#mon9").val();
                                        var mon10=$("#mon10").val();
                                        var mon11=$("#mon11").val();
                                        var mon12=$("#mon12").val();
                                        const ctx = document.getElementById('myChart');


                                        new Chart(ctx, {
                                            type: 'bar',
                                            data: {
                                                labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월' , '9월' , '10월' , '11월' , '12월'],
                                                datasets: [{
                                                    label: '월별 매출',
                                                    data: [mon1,mon2,mon3,mon4,mon5,mon6,mon7,mon8,mon9,mon10,mon11,mon12],
                                                    borderWidth: 2
                                                }]
                                            },
                                            options: {
                                                scales: {
                                                    y: {
                                                        beginAtZero: true
                                                    }
                                                }
                                            }
                                        });
                                    </script>

                                </div>

                                <div class="reserve" style="display: none">
                                    <table>
                                        <tr>
                                            <th>객실 이름</th>
                                            <th>체크인 날짜</th>
                                            <th>이름</th>
                                            <th>핸드폰번호</th>
                                        </tr>
                                        <c:if test="${!(empty reservation)}">
                                            <c:forEach var="res" items="${reservation}">
                                                <tr>
                                                    <td>${res.roomname}</td>
                                                    <td>${res.startDate}
                                                    <td>
                                                    <td>${res.user.username}
                                                    <td>
                                                    <td>${res.user.phonenumber}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </table>
                                </div>
                                <div class="roomRegist" style="display: none">
                                    객실이름 <input type="text" id="roomname">
                                    객실 컨텐츠 <input type="text" id="roomContent">
                                    최대인원 <input type="text" id="maxPeople">
                                    객실 사이즈 <input type="text" id="roomSize">
                                    객실 뷰 <input type="text" id="roomView">
                                    침대 갯수 <input type="text" id="roomBed">
                                    가격 <input type="text" id="roomPrice">
                                    메인이미지 <input type="file" id="roomImg1" name="img1">
                                    서브이미지1 <input type="file" id="roomImg2" name="img2">
                                    서브이미지2 <input type="file" id="roomImg3" name="img3">
                                    서브이미지3 <input type="file" id="roomImg4" name="img4">
                                    <button onclick="regist()">등록하기</button>
                                </div>
                                <div class="roomFix" style="display: none">
                                    <section class="ftco-section bg-light ftco-no-pt ftco-no-pb">
                                        <div class="container-fluid px-md-0">
                                            <div class="row no-gutters">
                                                객실수정
                                                <c:forEach var="room" items="${rooms.content}" varStatus="status">
                                                    <div class="col-lg-6">
                                                        <div class="room-wrap d-md-flex" id="${status.index}" onclick="fixRoom(this.id)" >
                                                            <div class="img"
                                                                 style="background-image: url(/room/${room.roommainimg});"></div>
                                                            <div class="half left-arrow d-flex align-items-center">
                                                                <div class="text p-4 p-xl-5 text-center">
                                                                    <p class="star mb-0">
                                                                        <span class="fa fa-star"></span><span
                                                                            class="fa fa-star"></span><span class="fa fa-star"></span><span
                                                                            class="fa fa-star"></span><span class="fa fa-star"></span>
                                                                    </p>
                                                                    <p class="mb-0">
																		<span class="price mr-1">
																		<fmt:formatNumber value="${room.price}" pattern="#,###" /></span>
                                                                        <span class="per">원</span>
                                                                    </p>
                                                                    <h3 class="mb-3">
                                                                        <div>${room.roomname}</div>
                                                                    </h3>
                                                                    <ul class="list-accomodation">
                                                                        <li><span>Max:</span> ${room.maxpeople} Persons</li>
                                                                        <li><span>Size:</span> ${room.size}</li>
                                                                        <li><span>View:</span> ${room.view}</li>
                                                                        <li><span>Bed:</span> ${room.bed}</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div style="display:none;" class="fix${status.index}">
                                                        객실이름 <input type="text" value="${room.roomname}" id="roomname${status.index}">
                                                        객실 컨텐츠 <input type="text" value="${room.roomcontent}" id="roomContent${status.index}">
                                                        최대인원 <input type="text" value="${room.maxpeople}" id="maxPeople${status.index}">
                                                        객실 사이즈 <input type="text" value="${room.size}" id="roomSize${status.index}">
                                                        객실 뷰 <input type="text" value="${room.view}" id="roomView${status.index}">
                                                        침대 갯수 <input type="text" value="${room.bed}" id="roomBed${status.index}">
                                                        가격 <input type="text"value="${room.price}" id="roomPrice${status.index}">
                                                        메인이미지 <input type="file" value="${room.roommainimg}" name="room1${status.index}">
                                                        서브이미지1 <input type="file" value="${room.roomimg1}"  name="room2${status.index}">
                                                        서브이미지2 <input type="file" value="${room.roomimg2}" name="room3${status.index}">
                                                        서브이미지3 <input type="file" value="${room.roomimg3}" name="room4${status.index}">
                                                        <button onclick="updateRoom(${room.id},${status.index})">수정하기</button>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <script defer src="/js/admin.js"></script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="layout/footer.jsp"%>