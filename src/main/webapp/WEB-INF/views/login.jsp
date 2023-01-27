<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layout/header.jsp" %>
<section class="hero-wrap hero-wrap-2" style="background-image: url(/images/room-13.png);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>LogIn <i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">LogIn</h1>
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
                                <div id="form-message-warning" class="mb-4"></div>
                                <div id="form-message-success" class="mb-4">
                                    빠르고 편리한 Private Hotel만의 예약 서비스를 이용하고 싶으신가요?
                                    <br>지금 바로 로그인 후 이용하세요.
                                </div>
                                <form method="post" id="contactForm" name="contactForm" class="contactForm" action="/auth/loginProc">
                                    <div class="row row2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="label" for="username">Id</label>
                                                <input type="text" class="form-control" name="username" id="username" placeholder="아이디를 입력해주세요.">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="label" for="password">Password</label>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
                                            </div>
                                        </div>
                                        <div class="col-md-12 colbtn">
                                            <div id="form-message-successt" class="mb-4">
                                                <br>
                                                계정 정보를 잊어버리셨나요?
                                                <a href="회원가입링크"> > 아이디 찾기</a>
                                                <a href="#"> ｜</a>
                                                <a href="회원가입링크"> 비밀번호 찾기</a>
                                                <br>
                                                아이디가 없으신가요?
                                                <a href="/auth/signup"> >회원가입 하러가기</a>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-md-12 colbtn">
                                            <div class="form-group">
                                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=9087b45cc0614d0db706baf5b2bedb62&redirect_uri=http://localhost:8081/auth/kakao/login&response_type=code" class="noneunderline">
                                                    <img class="kakaotalk_login" src="/images/kakao_login_medium_narrow.png" alt="카카오톡으로 로그인" class="kakaotalk_icon" />
                                                </a>
                                                <button type="submit" class="btn btn-primary">Login</button>
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
<%@ include file="layout/footer.jsp" %>