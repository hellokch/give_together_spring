<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>기부 페이지 메인</title>
            </head>

            <body>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/bootstrap.min.css">
                <style>
                    div {
                        padding: 0.1rem;
                    }

                    a {
                        text-decoration-line: none;
                        text-decoration: none;
                    }

                    .container {

                        max-width: 70rem;
                        margin-top: 1rem;
                        margin-bottom: 1rem;
                        padding-top: 1rem;

                    }

                    .img {
                        width: 250px;
                        height: 250px;
                        margin-left: 1rem;
                    }

                    .picarea {
                        min-width: 250px;
                        min-height: 250px;
                        margin-top: 0.5rem;
                    }

                    .wrap {
                        justify-content: space-evenly;
                        flex-direction: row;
                    }
                </style>

                <div class="container">
                    <c:if test="${sessionScope.id != null and sessionScope.kinds eq '2'}">
                        <a href="${pageContext.request.contextPath}/donation/donationForm" type="button" class="btn"
                            style="margin-left : 55rem">글쓰기(단체)</a>
                    </c:if>
                    
                    
                    <c:forEach var="card" items="${list}" varStatus="status">
                        <c:if test="${status.index % 3 == 0}">
                            <div class="row">
                        </c:if>
                        <div class="col-sm-4">
                            <a href="${pageContext.request.contextPath}/donation/donationInfo?num=${card.index_num}">
                                <div class="card d-flex bg-secondary mb-3" style="max-width: 18rem;">
                                    <div class="picarea" style="color:black">
                                        <img class="img"
                                            src="${pageContext.request.contextPath}/view/donation/img/${card.picture}"
                                            alt="등록된 사진이 없습니다.">
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text"> <strong>${card.title}</strong></p>
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar"
                                                style="width: ${card.raised/card.goal*100}%;"
                                                aria-valuenow="${card.raised/card.goal*100}" aria-valuemin="0"
                                                aria-valuemax="100"></div>
                                        </div>
                                        <div class="row" style="justify-content: space-between;">
                                            <div class="text-success" style="max-width: 30%"><strong>
                                                    <fmt:formatNumber type="percent" value=" ${card.raised/card.goal}"
                                                        pattern="0.0%" />
                                                </strong></div>
                                            <div class="text" style="max-width: 70%;" align="right">
                                                <fmt:formatNumber value="${card.raised}" type="currency" />
                                            </div></div></div></div></a>
                        </div>
                        <c:if test="${status.index % 3 == 2}">
                </div>
                </c:if>
                </c:forEach>

                <c:if test="${boardCount != end}">
                    <button type="button" class="btn" style="width : 68rem"
                        onclick="location.href='${pageContext.request.contextPath}/donation/donation?last=${nowpage+3}'">더보기</button>
                </c:if>
                </div>
                
            </body>

            </html>