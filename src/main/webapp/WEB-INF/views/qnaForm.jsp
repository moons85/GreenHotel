<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ include file="layout/header.jsp" %>--%>
<%--<section class="hero-wrap hero-wrap-2" style="background-image: url(/images/room-13.png);" data-stellar-background-ratio="0.5">--%>
<%--    <div class="overlay"></div>--%>
<%--    <div class="container">--%>
<%--        <div class="row no-gutters slider-text align-items-center justify-content-center">--%>
<%--            <div class="col-md-9 ftco-animate text-center">--%>
<%--                <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> <span>QnA <i class="fa fa-chevron-right"></i></span></p>--%>
<%--                <h1 class="mb-0 bread">QnA</h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>


<%--<section class="ftco-section testimony-section bg-light">--%>
<%--    <div class="container">--%>
<%--        <div class="row justify-content-center pb-5 mb-3">--%>
<%--            <div class="col-md-7 heading-section text-center ftco-animate">--%>
<%--                <h2>QnA List</h2>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row ftco-animate">--%>
<%--            <div class="col-md-12">--%>
<%--                <div class="carousel-testimony owl-carousel">--%>
<%--                    <c:forEach var="faq" items="${faqs.content}">--%>
<%--                        <div class="item">--%>
<%--                            <div class="testimony-wrap d-flex">--%>
<%--                                <div class="user-img" style="background-image: url(../images/answer2.png)">--%>
<%--                                </div>--%>
<%--                                <div class="text pl-4">--%>
<%--                  	<span class="quote d-flex align-items-center justify-content-center">--%>
<%--                      <i class="fa fa-quote-left"></i>--%>
<%--                    </span>--%>
<%--                                    <p>작성자 : ${faq.user.username}</p>--%>
<%--                                    <p class="qnaanswer">Q. ${faq.title}</p>--%>
<%--                                    <a href="/auth/qnadetail/${faq.id}">상세보기</a>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </c:forEach>--%>
<%--                    <ul class="pagination">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${faqs.first}">--%>
<%--                                <li class="page-item disabled"><a class="page-link" href="?page=${faqs.number-1}">Previous</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="page-item"><a class="page-link" href="?page=${faqs.number-1}">Previous</a></li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${faqs.last}">--%>
<%--                                <li class="page-item disabled"><a class="page-link" href="?page=${faqs.number+1}">Next</a></li>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <li class="page-item"><a class="page-link" href="?page=${faqs.number+1}">Next</a></li>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<c:choose>--%>
<%--    <c:when test="${empty principal}">--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
<%--        <section class="ftco-section bg-light">--%>
<%--            <div class="container">--%>
<%--                <div class="row justify-content-center pb-5 mb-3">--%>
<%--                    <div class="col-md-7 heading-section text-center ftco-animate">--%>
<%--                        <h2>Get in Touch</h2>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="row no-gutters">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="wrapper">--%>
<%--                            <div class="row no-gutters">--%>
<%--                                <div class="col-lg-8 col-md-7 d-flex align-items-stretch">--%>
<%--                                    <div class="contact-wrap w-100 p-md-5 p-4">--%>
<%--                                        <h3 class="mb-4">Get in touch</h3>--%>
<%--                                        <div id="form-message-warning" class="mb-4"></div>--%>
<%--                                        <div id="form-message-success" class="mb-4">--%>
<%--                                            문의사항을 남겨주세요. 빠른 시일 내로 답변드리겠습니다.--%>
<%--                                        </div>--%>
<%--                                        <input type="hidden" value="${principal.user.id}" id="userId">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-md-6">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label class="label" for="name">Name</label>--%>
<%--                                                    <input type="text" class="form-control" name="name" id="name" value="${principal.user.name}" disabled>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-6">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label class="label" for="email">Email</label>--%>
<%--                                                    <input type="email" class="form-control" name="email" id="email" value="${principal.user.email}" disabled>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-6">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label class="label" for="category">종류</label>--%>
<%--                                                    <div class="form-field">--%>
<%--                                                        <div class="select-wrap">--%>
<%--                                                            <select name="category" id="category" class="form-control">--%>
<%--                                                                <option value="결제 및 환불">결제 및 환불</option>--%>
<%--                                                                <option value="예약 정보">예약 정보</option>--%>
<%--                                                                <option value="사이트 이용">사이트 이용</option>--%>
<%--                                                                <option value="애프터서비스">애프터서비스</option>--%>
<%--                                                                <option value="기타">기타</option>--%>
<%--                                                            </select>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-12">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label class="label" for="title">Title</label>--%>
<%--                                                    <input type="text" class="form-control" name="title" id="title" placeholder="문의 제목을 남겨주세요.">--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-12">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <label class="label" for="content">문의 내용</label>--%>
<%--                                                    <textarea name="message" class="form-control" id="content" cols="30" rows="4" placeholder="문의 사항에 대해 상세히 적어주세요."></textarea>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-md-12">--%>
<%--                                                <div class="form-group">--%>
<%--                                                    <button type="submit" class="btn btn-primary">문의하기</button>--%>
<%--                                                    <div class="submitting"></div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-4 col-md-5 d-flex align-items-stretch">--%>
<%--                                    <div class="info-wrap bg-primary w-100 p-md-5 p-4">--%>
<%--                                        <h3>Let's get in touch</h3>--%>
<%--                                        <p class="mb-4">We're open for any suggestion or just to have a chat</p>--%>
<%--                                        <div class="dbox w-100 d-flex align-items-start">--%>
<%--                                            <div class="icon d-flex align-items-center justify-content-center">--%>
<%--                                                <span class="fa fa-map-marker"></span>--%>
<%--                                            </div>--%>
<%--                                            <div class="text pl-3">--%>
<%--                                                <p><span>Address:</span> 198 West 21th Street, Suite 721 New York NY 10016</p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dbox w-100 d-flex align-items-center">--%>
<%--                                            <div class="icon d-flex align-items-center justify-content-center">--%>
<%--                                                <span class="fa fa-phone"></span>--%>
<%--                                            </div>--%>
<%--                                            <div class="text pl-3">--%>
<%--                                                <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dbox w-100 d-flex align-items-center">--%>
<%--                                            <div class="icon d-flex align-items-center justify-content-center">--%>
<%--                                                <span class="fa fa-paper-plane"></span>--%>
<%--                                            </div>--%>
<%--                                            <div class="text pl-3">--%>
<%--                                                <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dbox w-100 d-flex align-items-center">--%>
<%--                                            <div class="icon d-flex align-items-center justify-content-center">--%>
<%--                                                <span class="fa fa-globe"></span>--%>
<%--                                            </div>--%>
<%--                                            <div class="text pl-3">--%>
<%--                                                <p><span>Website</span> <a href="#">yoursite.com</a></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>
<%--<script defer src="/js/qnaForm.js"></script>--%>
<%--<%@ include file="layout/footer.jsp" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            class="fa fa-chevron-right"></i></a></span> <span>QnA <i
                        class="fa fa-chevron-right"></i></span>
                </p>
                <h1 class="mb-0 bread">QnA</h1>
            </div>
        </div>
    </div>
</section>


<section class="ftco-section testimony-section bg-light">
    <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
            <div class="col-md-7 heading-section text-center ftco-animate">
                <h2>QnA List</h2>
            </div>
        </div>
        <div class="row ftco-animate">
            <div class="col-md-12">
                <div class="carousel-testimony owl-carousel">
                    <c:forEach var="faq" items="${faqs.content}">
                        <div class="item">
                            <div class="testimony-wrap d-flex">
                                <div class="user-img"
                                     style="background-image: url(../images/answer2.png)"></div>
                                <div class="text pl-4">
									<span
                                            class="quote d-flex align-items-center justify-content-center">
										<i class="fa fa-quote-left"></i>
									</span>
                                    <p>작성자 : ${faq.user.username}</p>
                                    <p class="qnaanswer">Q. ${faq.title}</p>
                                    <a href="/auth/qnadetail/${faq.id}">상세보기</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-md-12 text-center">
                    <c:choose>
                        <c:when test="${faqs.first}">
                            <a href="#" onclick="return false;" style="margin: 10px; color:#ccc;"> < Previous</a>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${faqs.number-1}" style="margin: 10px;"> < Previous</a>

                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${faqs.last}">
                            <a href="#" onclick="return false;"  style="margin: 10px;color:#ccc;">Next >
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="?page=${faqs.number+1}" style="margin: 10px;">Next >
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>

<c:choose>
    <c:when test="${empty principal}">
    </c:when>
    <c:otherwise>
        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center pb-5 mb-3">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <h2>Get in Touch</h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-md-12">
                        <div class="wrapper">
                            <div class="row no-gutters">
                                <div class="col-lg-8 col-md-7 d-flex align-items-stretch">
                                    <div class="contact-wrap w-100 p-md-5 p-4">
                                        <h3 class="mb-4">Get in touch</h3>
                                        <div id="form-message-warning" class="mb-4"></div>
                                        <div id="form-message-success" class="mb-4">문의사항을 남겨주세요.
                                            빠른 시일 내로 답변드리겠습니다.</div>
                                        <input type="hidden" value="${principal.user.id}" id="userId">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="name">Name</label> <input
                                                        type="text" class="form-control" name="name" id="name"
                                                        value="${principal.user.name}" disabled>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="email">Email</label> <input
                                                        type="email" class="form-control" name="email" id="email"
                                                        value="${principal.user.email}" disabled>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="label" for="category">종류</label>
                                                    <div class="form-field">
                                                        <div class="select-wrap">
                                                            <select name="category" id="category"
                                                                    class="form-control">
                                                                <option value="결제 및 환불">결제 및 환불</option>
                                                                <option value="예약 정보">예약 정보</option>
                                                                <option value="사이트 이용">사이트 이용</option>
                                                                <option value="애프터서비스">애프터서비스</option>
                                                                <option value="기타">기타</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="label" for="title">Title</label> <input
                                                        type="text" class="form-control" name="title" id="title"
                                                        placeholder="문의 제목을 남겨주세요.">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="label" for="content">문의 내용</label>
                                                    <textarea name="message" class="form-control" id="content"
                                                              cols="30" rows="4" placeholder="문의 사항에 대해 상세히 적어주세요."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <button type="submit" class="btn btn-primary">문의하기</button>
                                                    <div class="submitting"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                                    <div class="info-wrap bg-primary w-100 p-md-5 p-4">
                                        <h3>Let's get in touch</h3>
                                        <p class="mb-4">We're open for any suggestion or just to
                                            have a chat</p>
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
    </c:otherwise>
</c:choose>
<script defer src="/js/qnaForm.js"></script>
<%@ include file="layout/footer.jsp"%>
