<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="layout/header.jsp"%>


<section class="hero-wrap hero-wrap-2"
	style="background-image: url('images/room-14.png');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="index.html">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
				<h1 class="mb-0 bread">Reservation</h1>
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
								<form method="POST" id="contactForm" name="contactForm"
									class="contactForm">
									<div class="row row2">

										<div class="col-md-6">
											<div class="form-group">
												<label class="label" for="subject">이름</label> <input
													type="text" class="form-control" name="subject" id="id"
													value="${user.name}" disabled>
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
														id="checkin" placeholder="Check-In">
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="input-wrap">
													<input type="text"
														class="form-control appointment_date-check-out"
														id="checkout" placeholder="Check-Out">
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="subject">Room</label> <input
													type="text" class="form-control" name="subject" id="room"
													value="선택한 방 이름(최대인원수,방크기)" disabled>
											</div>
										</div>
										<div class="col-md-12">
											<label class="label" for="subject">인원</label>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-field">
													<div class="select-wrap">
														<select name="" id="adult" class="form-control">
															<option value="">성인</option>
															<option value="1">성인 1명</option>
															<option value="2">성인 2명</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-field">
													<div class="select-wrap">
														<select name="" id="kid" class="form-control">
															<option value="">아동</option>
															<option value="0">아동 0명</option>
															<option value="1">아동 1명</option>
															<option value="2">아동 2명</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="email" id="service">Service</label><br>
												<label><input type="checkbox" value="조식"> 조식</label><br>
												<label><input type="checkbox" value="픽업"> 픽업</label><br>
												<label><input type="checkbox" value="조기 체크인">
													조기 체크인</label><br> <label><input type="checkbox"
													value="늦은 체크아웃"> 늦은 체크아웃</label><br> <label><input
													type="checkbox" value="룸 음식 서비스"> 룸 음식 서비스(메뉴에 따라
													추가금 별도)</label><br> <label><input type="checkbox"
													value="이벤트 장식"> 이벤트 장식</label><br> <label><input
													type="checkbox" value="추가 침대"> 추가 침대</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="email" id="pay">결제</label><br>
												<label style="margin-right: 20px;"><input
													type="radio" name="pay" value="카드"> 카드 결제</label> <label
													style="margin-right: 20px;"><input type="radio"
													name="pay" value="Toss"> Toss</label> <label
													style="margin-right: 20px;"><input type="radio"
													name="pay" value="KakaoPay"> Kakao Pay</label> <label><input
													type="radio" name="pay" value="계좌이체"> 계좌이체</label>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="subject">Etc</label>
												<textarea class="reviewtextarea form-control" name="subject"
													id="other" rows="5" placeholder="기타 사항"></textarea>
											</div>
											<br>
										</div>

										<div class="col-md-12 colbtn text-right">
											<div class="form-group">
												<h4 class="h5title">
													최종 가격 : <span style="color: #222">9,999,999</span> 원
												</h4>
												<br> <input type="submit" value="돌아가기"
													class="btn btn6 btn-white" id="btnkakao"> <input
													type="submit" value="예약하기" class="btn btn6 btn-primary">
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
<%@ include file="layout/footer.jsp"%>
