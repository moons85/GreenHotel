<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="layout/header.jsp" %>
<section class="hero-wrap hero-wrap-2" style="background-image: url(/images/room-14.png);" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-center justify-content-center">
      <div class="col-md-9 ftco-animate text-center">
        <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>Mypage <i class="fa fa-chevron-right"></i></span></p>
        <h1 class="mb-0 bread">Mypage</h1>
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
                <h3 class="mb-4">Mypage</h3>
                <div id="form-message-warning" class="mb-4"></div>
                <form method="POST" id="contactForm" name="contactForm" class="contactForm">
                  <div class="row row2">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="id">Id</label>
                        <input type="text" class="form-control" name="id" id="id" value="${principal.user.username }" disabled>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="name">Name</label>
                        <input type="text" class="form-control" name="name" id="name" value="${principal.user.name }" disabled>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="email">Email Address</label>
                        <input type="email" class="form-control" name="email" id="email" value="${principal.user.email }" disabled>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="label" for="phone">Phone</label>
                        <input type="text" class="form-control" name="phone" id="phone" value="${principal.user.phonenumber }" disabled>
                      </div>
                    </div>
                    <div class="col-md-12 colbtn">
                      <div id="form-message-success" class="mb-4">
                        <br>
                        계정 정보를 수정하고 싶으신가요?
                        <br>
                        <a href="/updateUserForm"> > 회원정보 수정하기</a>
                      </div>
                    </div>
                    <br>
                    <div class="col-md-12 colbtn">
                      <div class="form-group">
                        <input type="submit" value="탈퇴하기" class="btn btn-white" id="btnkakao">
                        <a href="/logout" class="btn btn-primary">Logout</a>
                        <div class="submitting"></div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
              <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                <h5 class="h5title">${principal.user.name }님, 환영합니다.</h5>
                <p class="mb-4">집과 같은 편안함, 궁과 같은 럭셔리함을 모두 잡은 당신만을 위한 숙소입니다.</p>
                <div class="dbox w-100 d-flex align-items-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                    <span style="font-size: 16pt;">P</span>
                  </div>
                  <div class="text pl-3">
                    <p><span>Point:</span>${principal.user.point }</p>
                  </div>
                </div>
                <div class="dbox w-100 d-flex align-items-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                    <span style="font-size: 16pt;">H</span>
                  </div>
                  <div class="text pl-3">
                    <p><span>이용횟수:</span> <a href="tel://1234567920"> 3 번</a></p>
                  </div>
                </div>
                <div class="dbox w-100 d-flex align-items-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                    <span style="font-size: 16pt;">R</span>
                  </div>
                  <div class="text pl-3">
                    <p><span>다음 예약 일자:</span>  2023.12.31</p>
                  </div>
                </div>
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
<%@ include file="layout/footer.jsp" %>
