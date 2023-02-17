<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> </code>

<%@ include file="layout/header.jsp" %>
<div class="modal">
  <div class="modal_body">
    <h2 class="h2_title h2_title2 modaltitle2">보유 쿠폰</h2><br>
    <c:forEach var="coupon" items="${coupons.content}">
      <c:choose>
        <c:when test="${coupon.user.id==principal.user.id}">
          <div class="coupondiv text-left">
            <span class="couponsub">Private Coupon</span>
            <hr>
            <ul>
              <li class="coupontitle">${coupon.coupon}</li>
              <li>발급일: <fmt:formatDate value="${coupon.createTime}" pattern="yyyy.MM.dd"
                                       type="date" /></li>
              <c:set var="cdate" value="${coupon.createTime}"/>
              <%
                Timestamp edate = (Timestamp) pageContext.getAttribute("cdate");
                LocalDateTime localDate = edate.toLocalDateTime();
                LocalDateTime result = localDate.plusYears(0).plusMonths(3).plusDays(0);
                out.print("<li> 사용기한: "+ result.format(DateTimeFormatter.ofPattern("yyyy.MM.dd")) + "</li>");
              %>
            </ul>
          </div>
<%--          <a href="/#eventsection" id="couponhref" class="coupon_a text-center">다른 쿠폰 더 뽑으러 가기</a>--%>
          <script>
            var anchor = document.getElementById("couponhref");

          </script>
        </c:when>
        <c:otherwise>
          <br>
          이용 가능한 쿠폰이 없습니다.
          <br><br><br>
          <a href="/#eventsection" class="btn-primary btn" >지금 바로 뽑으러 가기</a>
        </c:otherwise>
      </c:choose>

    </c:forEach>

  </div>
</div>
<div class="resmodal">
  <div class="resmodal_body">
    <p class="resmodal_title">예약 내역</p>
    <div>
      <c:forEach var="res" items="${res.content}">
        <c:choose>
          <c:when test="${res.user.id==principal.user.id}">
            <div class="coupondiv text-left">
              <hr>
              <ul>
                <li class="coupontitle">${res.roomname}</li>
                <li>체크인: ${res.startDate}</li>
                <li>체크아웃: ${res.endDate}</li>
                <li>성인: ${res.adult}</li>
                <li>아동: ${res.kid}</li>
                <li>가격: <fmt:formatNumber value="${res.price}" pattern="#,###"/>원</li>
              </ul>
            </div>
          </c:when>
          <c:otherwise>
            <br>
            예약 내역이 없습니다.
          </c:otherwise>
        </c:choose>

      </c:forEach>
    </div>
  </div>
</div>
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
                    <p><span>Point:</span><span id="showpoint"><fmt:formatNumber value="${user.point}" pattern="#,###"/></span></p>
                  </div>
                </div>
                <div class="dbox w-100 d-flex align-items-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                    <span style="font-size: 16pt;">R</span>
                  </div>
                  <div class="text pl-3">
                    <a class="checkres hovercursor">예약 확인 하기</a>
                  </div>
                </div>
                <div class="dbox w-100 d-flex align-items-center">
                  <div class="icon d-flex align-items-center justify-content-center">
                    <span style="font-size: 16pt;">C</span>
                  </div>
                  <div class="text pl-3">
                    <p><a class="btn-open-popup hovercursor">보유 쿠폰 확인하기</a>
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
<script defer src="/js/random.js"></script>
<%@ include file="layout/footer.jsp" %>