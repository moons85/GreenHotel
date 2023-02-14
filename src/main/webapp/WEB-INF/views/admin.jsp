<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
        crossorigin="anonymous"></script>
<%@ include file="layout/header.jsp"%>
<section class="hero-wrap hero-wrap-2"
         style="background-image: url(/images/room-15.jpg);"
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
                                <h3 class="mb-4">Admin Page</h3>

                                <!-- 월별 매출 -->
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
                                <!-- 예약 확인 -->
                                <div class="reserve" style="display: none">
                                    <table class="col-md-12 text-center tabletext">
                                        <tr class="tablehead">
                                            <th>객실 이름</th>
                                            <th>체크인 날짜</th>
                                            <th>이름</th>
                                            <th>핸드폰번호</th>
                                        </tr>
                                        <c:if test="${!(empty reservation)}">
                                            <c:forEach var="res" items="${reservation}">
                                                <tr class="tablebody">
                                                    <td>${res.roomname}</td>
                                                    <td>${res.startDate}</td>
                                                    <td>${res.user.username}</td>
                                                    <td>${res.user.phonenumber}</td>
                                                </tr>

                                            </c:forEach>
                                        </c:if>
                                    </table>
                                    <c:if test="${empty reservation}">
                                        <p class="text-center" style="margin:10px;">예약 사항이 없습니다.</p>
                                    </c:if>
                                </div>

                                <!-- 객실등록  -->


                                <div class="roomRegist" style="display: none">
                                    <div id="form-message-warning" class="mb-4"></div>
                                    <div id="form-message-success" class="mb-4">
                                        객실 등록을 위한 폼입니다. <br> 관리자께서는 등록 정보를 재차 확인한 후 업로드해주시기 바랍니다.
                                    </div>
                                    <form method="POST" id="contactForm" name="contactForm"
                                          class="contactForm">
                                        <div class="row row2">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="subject">객실 이름</label> <input
                                                        type="text" class="form-control" id="roomname"
                                                        placeholder="객실 이름을 적어주세요.">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="subject">가격</label> <input
                                                        type="text" class="form-control" id="roomPrice"
                                                        placeholder="기본 예약가를 적어주세요.">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="label" for="subject">컨텐츠</label> <input
                                                        type="text" class="form-control" id="roomContent"
                                                        placeholder="객실과 관련된 세부사항 및 컨텐츠를 적어주세요.">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="label" for="subject">기타</label>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="maxPeople">최대 인원수</label> <input
                                                        type="text" class="form-control" id="maxPeople"
                                                        placeholder="최대 인원수">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="roomBed">침대수</label> <input
                                                        type="text" class="form-control" id="roomBed"
                                                        placeholder="침대수">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="roomView">룸 뷰</label> <input
                                                        type="text" class="form-control" id="roomView"
                                                        placeholder="룸 뷰">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="roomSize">룸 사이즈</label> <input
                                                        type="text" class="form-control" id="roomSize"
                                                        placeholder="룸 사이즈">
                                                </div>
                                            </div>
                                            <!-- <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="" class="form-control">
                                                                <option value="maxPeople" selected disabled>인원수</option>
                                                                <option value="1">1명</option>
                                                                <option value="2">2명</option>
                                                                <option value="3">3명</option>
                                                                <option value="4">4명</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="roomBed" class="form-control">
                                                                <option value="" selected disabled>침대수</option>
                                                                <option value="1">1개</option>
                                                                <option value="2">2개</option>
                                                                <option value="3">3개</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="roomView" class="form-control">
                                                                <option value="" selected disabled>뷰</option>
                                                                <option value="Normal View">일반 뷰</option>
                                                                <option value="Sea view">바다 뷰</option>
                                                                <option value="City view">도시 뷰</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> -->
                                            <div class="col-md-12">
                                                <label class="label" for="rooms">Image</label><br>
                                                <div class="form-group">
                                                    <label class="label" for="roomImg1">메인 이미지
                                                        &nbsp&nbsp</label><input type="file" id="roomImg1" name="img1">
                                                </div>
                                                <div class="form-group">
                                                    <label class="label" for="roomImg2">서브 이미지1
                                                        &nbsp&nbsp</label><input type="file" id="roomImg2" name="img2">
                                                </div>
                                                <div class="form-group">
                                                    <label class="label" for="roomImg3">서브 이미지2
                                                        &nbsp&nbsp</label><input type="file" id="roomImg3" name="img3">
                                                </div>
                                                <div class="form-group">
                                                    <label class="label" for="roomImg4">서브 이미지3
                                                        &nbsp&nbsp</label><input type="file" id="roomImg4" name="img4">
                                                </div>
                                            </div>

                                            <br>
                                            <div class="col-md-12 colbtn">
                                                <div class="form-group">
                                                    <input type="submit" value="Reset" class="btn btn-white"
                                                           id="btnkakao">
                                                    <button type="button" onclick="regist()" value="Upload"
                                                            class="btn btn-primary">Upload</button>
                                                    <div class="submitting"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>


                                <!-- 								<div class="roomRegist" style="display: none">
                                    객실이름 <input type="text" id="roomname"> 객실 컨텐츠 <input
                                        type="text" id="roomContent"> 최대인원 <input type="text"
                                        id="maxPeople"> 객실 사이즈 <input type="text"
                                        id="roomSize"> 객실 뷰 <input type="text" id="roomView">
                                    침대 갯수 <input type="text" id="roomBed"> 가격 <input
                                        type="text" id="roomPrice"> 메인이미지 <input type="file"
                                        id="roomImg1" name="img1"> 서브이미지1 <input type="file"
                                        id="roomImg2" name="img2"> 서브이미지2 <input type="file"
                                        id="roomImg3" name="img3"> 서브이미지3 <input type="file"
                                        id="roomImg4" name="img4">
                                    <button onclick="regist()">등록하기</button>
                                </div> -->

                                <!-- 객실 수정 -->


                                <div class="roomFix" style="display: none">
                                    <section class="ftco-section bg-light ftco-no-pt ftco-no-pb">
                                        <div class="container-fluid px-md-0">
                                            <div class="row no-gutters">
                                                <c:forEach var="room" items="${rooms.content}"
                                                           varStatus="status">

                                                    <!-- 객실수정리스트 -->
                                                    <div class="col-lg-6">
                                                        <div class="room-wrap d-md-flex" id="${status.index}"
                                                             onclick="fixRoom(this.id)">
                                                            <div class="img"
                                                                 style="background-image: url(/room/${room.roommainimg});"></div>
                                                            <div class="half left-arrow d-flex align-items-center">
                                                                <div class="text p-4 p-xl-5 text-center">



                                                                    <div>
                                                                        <h3 class="mb-3">${room.roomname}</h3>
                                                                    </div>

                                                                    <p class="mb-0">
																		<span class="price mr-1"> <fmt:formatNumber
                                                                                value="${room.price}" pattern="#,###" /></span> <span
                                                                            class="per">원</span>
                                                                    </p>
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

                                                    <!-- 객실수정 폼 -->


                                                    <div class="bg-white fix${status.index}"
                                                         style="display: none">
                                                        <div id="form-message-success" class="mb-4">
                                                            객실 수정을 위한 폼입니다. <br> 관리자께서는 등록 정보를 재차 확인한 후 업로드해주시기
                                                            바랍니다.
                                                        </div>
                                                        <form method="POST" id="contactForm" name="contactForm"
                                                              class="contactForm">
                                                            <div class="row row2">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="subject">객실 이름</label> <input
                                                                            type="text" class="form-control"
                                                                            id="roomname${status.index}" value="${room.roomname}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="subject">가격</label> <input
                                                                            type="text" class="form-control"
                                                                            value="${room.price}" id="roomPrice${status.index}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label class="label" for="subject">컨텐츠</label> <input
                                                                            type="text" class="form-control"
                                                                            id="roomContent${status.index}"
                                                                            value="${room.roomcontent}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="label" for="subject">기타</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="maxPeople">최대 인원수</label> <input
                                                                            type="text" class="form-control"
                                                                            value="${room.maxpeople}"
                                                                            id="maxPeople${status.index}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomBed">침대수</label> <input
                                                                            type="text" class="form-control" value="${room.bed}"
                                                                            id="roomBed${status.index}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomView">룸 뷰</label> <input
                                                                            type="text" class="form-control" value="${room.view}"
                                                                            id="roomView${status.index}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomSize">룸 사이즈</label> <input
                                                                            type="text" class="form-control" value="${room.size}"
                                                                            id="roomSize${status.index}">
                                                                    </div>
                                                                </div>
                                                                <!-- <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="" class="form-control">
                                                                <option value="maxPeople" selected disabled>인원수</option>
                                                                <option value="1">1명</option>
                                                                <option value="2">2명</option>
                                                                <option value="3">3명</option>
                                                                <option value="4">4명</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="roomBed" class="form-control">
                                                                <option value="" selected disabled>침대수</option>
                                                                <option value="1">1개</option>
                                                                <option value="2">2개</option>
                                                                <option value="3">3개</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="" id="roomView" class="form-control">
                                                                <option value="" selected disabled>뷰</option>
                                                                <option value="Normal View">일반 뷰</option>
                                                                <option value="Sea view">바다 뷰</option>
                                                                <option value="City view">도시 뷰</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> -->
                                                                <div class="col-md-12">
                                                                    <label class="label" for="rooms">Image</label><br>
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomImg1">메인 이미지
                                                                            &nbsp&nbsp</label><input type="file"
                                                                                                     value="${room.roommainimg}"
                                                                                                     name="room1${status.index}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomImg2">서브 이미지1
                                                                            &nbsp&nbsp</label><input type="file" value="${room.roomimg1}"
                                                                                                     name="room2${status.index}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomImg3">서브 이미지2
                                                                            &nbsp&nbsp</label><input type="file" value="${room.roomimg2}"
                                                                                                     name="room3${status.index}">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="label" for="roomImg4">서브 이미지3
                                                                            &nbsp&nbsp</label><input type="file" value="${room.roomimg3}"
                                                                                                     name="room4${status.index}">
                                                                    </div>
                                                                </div>

                                                                <br>
                                                                <div class="col-md-12 colbtn">
                                                                    <div class="form-group">
                                                                        <input type="submit" value="Reset"
                                                                               class="btn btn-white" id="btnkakao">
                                                                        <button type="button"
                                                                                onclick="updateRoom(${room.id},${status.index})"
                                                                                value="Upload" class="btn btn-primary">Upload</button>
                                                                        <div class="submitting"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <script defer src="/js/admin.js"></script>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                            <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                                <h5 class="h5title">${principal.user.name }님,환영합니다.</h5>
                                <p class="mb-4 ">
                                    <a href="/logout" class="text-light">Logout</a>
                                </p>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex justify-content-center align-items-center">

                                        <svg onclick="menu1()" style="cursor: pointer"
                                             xmlns="http://www.w3.org/2000/svg"
                                             viewBox="-340 -330 1200 1200">
                                            <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                            <path style="fill:#fff;"
                                                  d="M192 96H320l47.4-71.1C374.5 14.2 366.9 0 354.1 0H157.9c-12.8 0-20.4 14.2-13.3 24.9L192 96zm128 32H192c-3.8 2.5-8.1 5.3-13 8.4l0 0 0 0C122.3 172.7 0 250.9 0 416c0 53 43 96 96 96H416c53 0 96-43 96-96c0-165.1-122.3-243.3-179-279.6c-4.8-3.1-9.2-5.9-13-8.4zM289.9 336l47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47z" /></svg>
                                    </div>
                                    <div class="text pl-3">
                                        <p onclick="menu1()" style="cursor: pointer">월별 매출</p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <svg onclick="menu2()" style="cursor: pointer"
                                             xmlns="http://www.w3.org/2000/svg"
                                             viewBox="-380 -330 1200 1200">
                                            <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                            <path style="fill:#fff;"
                                                  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z" /></svg>
                                    </div>
                                    <div class="text pl-3">
                                        <p onclick="menu2()" style="cursor: pointer">예약 확인</p>

                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <svg onclick="menu3()" style="cursor: pointer"
                                             xmlns="http://www.w3.org/2000/svg"
                                             viewBox="-290 -330 1200 1200">
                                            <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                            <path style="fill:#fff;"
                                                  d="M32 32c17.7 0 32 14.3 32 32V320H288V160c0-17.7 14.3-32 32-32H544c53 0 96 43 96 96V448c0 17.7-14.3 32-32 32s-32-14.3-32-32V416H352 320 64v32c0 17.7-14.3 32-32 32s-32-14.3-32-32V64C0 46.3 14.3 32 32 32zM176 288c-44.2 0-80-35.8-80-80s35.8-80 80-80s80 35.8 80 80s-35.8 80-80 80z" /></svg>
                                    </div>
                                    <div class="text pl-3">
                                        <p onclick="menu3()" style="cursor: pointer">객실 등록</p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <svg onclick="menu4()" style="cursor: pointer"
                                             xmlns="http://www.w3.org/2000/svg"
                                             viewBox="-330 -330 1200 1200">
                                            <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                            <path style="fill:#fff;"
                                                  d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456c13.3 0 24-10.7 24-24s-10.7-24-24-24s-24 10.7-24 24s10.7 24 24 24z" /></svg>
                                    </div>
                                    <div class="text pl-3">
                                        <p onclick="menu4()" style="cursor: pointer">객실 수정</p>

                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div
                                            class="icon d-flex align-items-center justify-content-center">
                                        <svg onclick="menu5()" style="cursor: pointer"
                                             xmlns="http://www.w3.org/2000/svg"
                                             viewBox="-330 -330 1200 1200">
                                            <!--! Font Awesome Pro 6.2.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
                                            <path style="fill:#fff;"
                                                  d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456c13.3 0 24-10.7 24-24s-10.7-24-24-24s-24 10.7-24 24s10.7 24 24 24z" /></svg>
                                    </div>
                                    <div class="text pl-3">
                                        <p onclick="menu5()" style="cursor: pointer">객실 수정</p>

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

<%@ include file="layout/footer.jsp"%>