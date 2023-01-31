<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layout/header.jsp" %>
<section class="hero-wrap hero-wrap-2" style="background-image: url(/images/room-13.png);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="fa fa-chevron-right"></i></a></span> <span>Account <i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">Find Id & Password</h1>
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
                                <h3 class="mb-4">Find Password</h3>
                                <div id="form-message-warning" class="mb-4"></div>
                                <div class="row row2">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label class="label" for="username">ID</label>
                                            <input type="text" class="form-control" name="username" id="username" placeholder="ID를 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label class="label" for="email">Email</label>
                                            <input type="email" class="form-control" name="email" id="email" placeholder="가입시 사용한 Email을 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary idcheckbtn" id="send_code">임시비밀번호 전송하기</button>
                                    </div>
                                    <div class="col-md-12 idvalue">
                                        <!--이메일 확인 할 수 없을때 or 인증 요청 성공-->
                                    </div>
                                    <div class="col-md-12 colbtn">
                                        <div id="form-message-success" class="mb-4">
                                            <br>
                                            <a href="/auth/login"> > 로그인 하러가기</a>
                                            <br>
                                            아이디가 없으신가요?
                                            <a href="/auth/signup"> >회원가입 하러가기</a>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                            <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                                <h3>Private Hotel is...</h3>
                                <p class="mb-4">집과 같은 편안함, 궁과 같은 럭셔리함을 모두 잡은 당신만을 위한 숙소입니다.</p>
                                <div class="dbox w-100 d-flex align-items-start">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-map-marker"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-phone"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-paper-plane"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
                                    </div>
                                </div>
                                <div class="dbox w-100 d-flex align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center">
                                        <span class="fa fa-globe"></span>
                                    </div>
                                    <div class="text pl-3">
                                        <p><span>Website</span> <a href="#">yoursite.com</a></p>
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
<script defer src="/js/newPassword.js"></script>
<%@ include file="layout/footer.jsp" %>