<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<header class="bg-pink hg-100">
    <section class="header-logo ">
        <div class="mr50">
            <a href="/main"><img class="sizeLogo" src="/res/img/logo_white.png"></a>
        </div>
        <div class="flex-c-r g30">
            <div><a href="/food/random">오늘의 음식</a></div>
            <div><a href="#">오늘의 맛집</a></div>
            <div><a href="#">방송별 맛집</a></div>
            <div><a href="#">계절별 음식</a></div>
            <div><a href="#">술과 페어링</a></div>
        </div>
    </section>
    <section class="header-user g50">
        <div class="search-box">
            <button class="search-btn"><i class="fas fa-search"></i></button>
            <input type="text" placeholder="맛집이름을 검색해주세요!">
        </div>
        <c:choose>
            <c:when test="${sessionScope.loginUser!=null}">
                <a class="flex-c-r">마이페이지</a>
                <a class="flex-c-r">로그아웃</a>
            </c:when>
            <c:otherwise>
                <a class="flex-c-r">로그인</a>
                <a class="flex-c-r">회원가입</a>
            </c:otherwise>
        </c:choose>
    </section>
</header>