<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<%@ include file="layout/header.jsp"%>
<div class="wrap">
	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('images/room-12.png');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Reviews <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">Reviews Form</h1>
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
									<h3 class="mb-4">Review</h3>
									<div id="form-message-warning" class="mb-4"></div>
									<div id="form-message-success" class="mb-4">
										리뷰 작성을 위한 폼입니다. <br> 체크아웃이 완료된 사용자만이 이용이 가능합니다.
									</div>
									<input type="hidden" value="${principal.user.id}" id="userId">
								<div class="reserve" >
                                    <table class="col-md-12 text-center tabletext">
                                        <tr class="tablehead">
                                            <th>객실 이름</th>
                                            <th>체크인 날짜</th>
                                            <th>체크아웃 날짜</th>
                                            <th>이름</th>
                                            <th>핸드폰번호</th>
                                            
                                            
                                        </tr>
                                        <c:if test="${!(empty room)}">
                                            <c:forEach var="res" items="${room}">
                                                <tr class="tablebody" id="${res.id}" onclick="selectRoom(this.id)">
                                                    <td>${res.roomname}</td>
                                                    <td>${res.startDate}</td>
                                                    <td>${res.endDate}</td>
                                                    <td>${res.user.username}</td>
                                                    <td>${res.user.phonenumber}</td>
                                                </tr>
												<input type="hidden" id="resName${res.id}"value="${res.roomname}">
                                            </c:forEach>
                                        </c:if>
                                    </table>
                                    <c:if test="${empty room}">
                                        <p class="text-center" style="margin:10px;">예약 사항이 없습니다.</p>
                                    </c:if>
                                </div>
									<div id="contactForm"
										class="contactForm" style="display:none;">
										<div class="row row2">

											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="username">작성자</label> <input
														type="text" class="form-control" name="username"
														id="username" value="${principal.user.name}" readonly="readonly">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="label" for="roomname">Room</label> <input
														type="text" class="form-control" name="roomname"
														id="roomname" value="" readonly="readonly">
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="point">별점</label>
													<p class="star mb-0">
														<span class="fa fa-star"></span><span class="fa fa-star"></span><span
															class="fa fa-star"></span><span class="fa fa-star"></span><span
															class="fa fa-star"></span>
													</p>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="Review">Title</label>
													<input type="text" class="reviewtextarea form-control"
														name="Title" id="Title" rows="10"
														placeholder="제목을 작성해주세요."></input>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="Review">Review</label>
													<textarea class="reviewtextarea form-control"
														name="Review" id="Review" rows="10"
														placeholder="리뷰 내용을 작성해주세요.(500자 이내)"></textarea>
												</div>
											</div>
											<div class="col-md-12">
												<div class="form-group">
													<label class="label" for="img">Image</label><br> <input
														type="file" name="img" id="img">
												</div>
											</div>

											<br>
											<div class="col-md-12 colbtn">
												<div class="form-group">
													<input type="submit" value="Reset" class="btn btn-white"
														id="btnkakao"> <input type="button" value="Upload"
														class="btn btn-primary" onclick="saveRev()">
													<div class="submitting"></div>
												</div>
											</div>
										</div>
									</div>
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
												<span>Address:</span> 198 West 21th Street, Suite 721 New
												York NY 10016
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
	<script>
		function selectRoom(id){
			$(".contactForm").show();
			var roomname=$("#resName"+id).val();
			$("#roomname").val(roomname);
			$(".reserve").hide();
		}
		function saveRev(){
			const title= $("#Title").val();
			const review = $("#Review").val();
			const img = $('input[name="img"]')[0].files[0];
			const userid =$("#userId").val();
			const roomname =$("#roomname").val();
			        let formData = new FormData();
			        formData.append("title",title);
			        formData.append("content",review);
			        formData.append("img",img);
			        formData.append("user",userid);
			        formData.append("room",roomname);


			        $.ajax({
			            type:"POST",
			            url:"/save/review",
			            data: formData,
			            contentType: false,
			            processData: false,
			            enctype: "multipart/form-data",
			            dataType:"text"
			        }).done(function(resp) {
			            alert("등록이 완료 되었습니다.")
			            location.replace("/auth/review")
			        }).fail(function(error) {
			            alert("등록에 실패했습니다.");
			        })
			    }

	
	</script>
	
	<%@ include file="layout/footer.jsp"%>