<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="layout/header.jsp" %>
<section class="hero-wrap hero-wrap-2" style="background-image: url(/images/room-13.png);" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>SignUp <i class="fa fa-chevron-right"></i></span></p>
                <h1 class="mb-0 bread">SignUp</h1>
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
                                <h3 class="mb-4">Register</h3>
                                <div id="form-message-warning" class="mb-4"></div>
                                <div id="form-message-success" class="mb-4">
                                    빠르고 편리한 Private Hotel만의 예약 서비스를 이용하고 싶으신가요?
                                    <br>지금 바로 회원가입 후 이용하세요.
                                </div>
                                									<form method="" class="contactForm" onSubmit="return false;">
                                
                                <div class="row row2">

                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <label class="label" for="id">Id</label>
                                            <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="label" for="password">Password</label>
                                            <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="label" for="passwordck">Password Check</label>
                                            <input type="password" class="form-control" name="passwordck" id="passwordck" placeholder="비밀번호를 확인해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="label" for="name">Name</label>
                                            <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="label" for="email">Email Address</label>
                                            <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="label" for="phone">Phone</label>
                                            <input type="text" class="form-control" name="phone" id="phone" placeholder="'-'제외 휴대폰 번호를 입력해주세요.">
                                        </div>
                                    </div>
                                    <div class="col-md-12 colbtn">
                                        <div id="form-message-successt" class="mb-4">
                                            <br>
                                            계정 정보를 잊어버리셨나요?
                                            <br>
                                            <a href="회원가입링크"> 아이디 찾기</a>
                                            <a href="#"> ｜</a>
                                            <a href="회원가입링크"> 비밀번호 찾기</a>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col-md-12 colbtn">
                                        <div class="form-group">
                                            <input type="submit" value="Login" class="btn btn-white" id="btnkakao">
                                            <input type="submit" value="Sign up" class="btn btn-primary">
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
<script defer src="/js/signup.js"></script>
<%@ include file="layout/footer.jsp" %>