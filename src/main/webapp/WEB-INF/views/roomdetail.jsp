<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="layout/header.jsp"%>
<section class="hero-wrap hero-wrap-2" style="background-image: url(/room/${rd.roommainimg});" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Rooms <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-0 bread">${rd.roomname}</h1>
            </div>
        </div>
    </div>
</section>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-md-8">
                <div id="image" class="hero-wrap hero-wrap-2" style="background-image: url(/room/${rd.roommainimg}); height: 600px;"></div>
            </div>
            <div class="col-md-4 p-4 p-md-5 bg-white">
                <h2 class="font-weight-bold mb-4 h2_title">${rd.roomname}</h2>
                <p class="star mb-0"><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span></p>
                <p>${rd.roomcontent}</p>
                <div class="text-left textdiv">
                    <ul class="list-accomodation liststyle">
                        <li><span>Max:</span> ${rd.maxpeople} Persons</li>
                        <li><span>Size:</span> ${rd.size}</li>
                        <li><span>View:</span> ${rd.view}</li>
                        <li><span>Bed:</span> ${rd.bed}</li>
                    </ul>
                    <h4 class="mb-3 pricestyle"><span class="price mr-1"><fmt:formatNumber value="${rd.price}" pattern="#,###"/></span> <span class="per">원</span></h4>
                    <p><a href="#" class="btn btn-primary btn_reservation" onclick="reserve(this.id); return false;" id="${room.id}">지금 바로 예약하기</a></p>
                </div>
            </div>
        </div>
        <br>
        <div class="row no-gutters">
            <div class="col-md-4">
                <div id="image" class="hero-wrap hero-wrap-2" style="background-image: url(/room/${rd.roomimg1}); height: 300px;"></div>
            </div>
            <div class="col-md-4">
                <div id="image" class="hero-wrap hero-wrap-2" style="background-image: url(/room/${rd.roomimg2}); height: 300px;"></div>
            </div>
            <div class="col-md-4">
                <div id="image" class="hero-wrap hero-wrap-2" style="background-image: url(/room/${rd.roomimg3}); height: 300px;"></div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light ftco-no-pt">
    <div class="container">
        <div class="row no-gutters justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>Service</h2>
            </div>
        </div>
        <div class="row">
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-diet"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Tea Coffee</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-workout"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Hot Showers</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-diet-1"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Laundry</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-first"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Air Conditioning</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-first"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Free Wifi</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-first"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Kitchen</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-first"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Ironing</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
            <div class="services-2 col-md-3 d-flex w-100 ftco-animate">
                <div class="icon d-flex justify-content-center align-items-center">
                    <span class="flaticon-first"></span>
                </div>
                <div class="media-body pl-3">
                    <h3 class="heading">Lovkers</h3>
                    <p>A small river named Duden flows by their place and supplies it with the necessary</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section bg-light">
    <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>Reviews</h2>
            </div>
        </div>
        <div class="row ftco-animate">
            <div class="col-md-12">
                <div class="carousel-testimony owl-carousel">
                    <div class="item">
                        <div class="testimony-wrap d-flex">
                            <div class="user-img" style="background-image: url(images/person_1.jpg)">
                            </div>
                            <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">가나다라 이름</p>
                                <span class="position">id01234567</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap d-flex">
                            <div class="user-img" style="background-image: url(images/person_2.jpg)">
                            </div>
                            <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">가나다라 이름</p>
                                <span class="position">id01234567</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap d-flex">
                            <div class="user-img" style="background-image: url(images/person_3.jpg)">
                            </div>
                            <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">가나다라 이름</p>
                                <span class="position">id01234567</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap d-flex">
                            <div class="user-img" style="background-image: url(images/person_4.jpg)">
                            </div>
                            <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">가나다라 이름</p>
                                <span class="position">id01234567</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap d-flex">
                            <div class="user-img" style="background-image: url(images/person_1.jpg)">
                            </div>
                            <div class="text pl-4">
                  	<span class="quote d-flex align-items-center justify-content-center">
                      <i class="fa fa-quote-left"></i>
                    </span>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">가나다라 이름</p>
                                <span class="position">id01234567</span>
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