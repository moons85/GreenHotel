<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row no-gutters">

            <div class="col-md-12 p-4 p-md-5 bg-white">
                <div class="d-flex justify-content-between">
                    작성자: ${faq.user.name}<br>
                    <c:if
                            test="${principal.user.roleType=='MANAGER' || principal.user.id==faq.user.id}">
                        <a class="text-right textdiv" id="deletebtn">
                            X </a>
                    </c:if>
                </div>
                <h3 class="font-weight-bold mb-4 h2_title h2_title2">Q.
                    ${faq.title}</h3>
                <h5 class="mb-3 pricestyle">${faq.category}</h5>
                <div class="text-left textdiv">
                    <br>
                    <div class="reviewtext">${faq.content}</div>
                    <br>
                    <div class="reviewtext text-right">
                        작성일:
                        <fmt:formatDate value="${faq.createTime}" pattern="yyyy.MM.dd"
                                        type="date" />
                        <br>
                    </div>
                </div>

            </div>
            <c:forEach var="faqreply" items="${faqreplys}">
                <c:if test="${faqreply.faq.id==faq.id}">
                    <div class="col-md-12 p-4 p-md-5 bg-primary">
                        <div class="text-left textdiv text-light">
                            <div class="d-flex justify-content-between">
                                작성자: ${faqreply.user.name}
                                <c:if
                                        test="${principal.user.roleType=='MANAGER' || principal.user.id==faq.user.id}">
                                    <a class="text-right textdiv text-light" onclick="deleteById()">
                                        X </a>
                                </c:if>

                            </div>
                            <br>
                            <div class="reviewtext text-light">
                                <h3 class="font-weight-bold mb-4 h2_title h2_title2 text-light">A.
                                        ${faqreply.faq.title}</h3>
                                <p>${faqreply.content}</p>
                            </div>
                            <br>
                            <div class="reviewtext text-right text-light">
                                작성일:
                                <fmt:formatDate value="${faqreply.createTime}"
                                                pattern="yyyy.MM.dd" type="date" />
                                <br>
                            </div>
                        </div>
                        <input type="hidden" value="${faqreply.id}" id="frId">

                    </div>
                </c:if>
            </c:forEach>
            <c:if
                    test="${principal.user.roleType=='MANAGER' || principal.user.id==faq.user.id}">
                <div class="col-md-12 p-4 p-md-5 bg-white">
                    <form method="" class="contactForm" onSubmit="return false;">
                        <div class="text-left textdiv">
                            댓글 작성하기
                            <br>
                            <div class="reviewtext d-flex .justify-content-between">
                                <div class="col-md-11">
                                    <input type="hidden" value="${faq.id}" id="fId"> <input
                                        type="hidden" value="${principal.user.id }" id="uId"> <input
                                        type="text" placeholder="댓글 추가" class="add_reply form-control form-control2" style="min-height:100px;" autofocus>
                                </div>
                                <button type="submit" class="r_btn-save btn btn-primary d-flex" onclick="save()" style="height:40px;">게시</button>
                            </div>
                            <br>
                        </div>
                    </form>

                </div>
            </c:if>
        </div>
        <br>

    </div>

</section>
<script defer src="/js/faqreply.js"></script>
<script defer src="/js/qnaForm.js"></script>
<%@ include file="layout/footer.jsp"%>