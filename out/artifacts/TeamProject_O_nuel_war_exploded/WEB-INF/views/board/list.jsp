<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="808354205537-osu6jfd5peaqbqnmuhp3dctkn1mfhanb.apps.googleusercontent.com">
    <title></title>
</head>
<body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<div>${sessionScope.loginUser.u_nm}님 환영합니다</div>
<div>${requestScope.login.u_nm}님 환영합니다~</div>
<div>${sessionScope.loginUser.u_pfnum} - 플랫폼 넘버</div>
<div><a href="/user/mypage/profile"><input type="button" value="마이페이지"></a></div>

<c:if test="${sessionScope.loginUser.u_pfnum == 1}">
<div><a href="/user/logout">로그아웃</a></div>
</c:if>

<c:if test="${sessionScope.loginUser.u_pfnum == 2}">
    <div><a href="/user/logout">네이버 로그아웃</a></div>
</c:if>

<c:if test="${sessionScope.loginUser.u_pfnum == 3}">
        <div onclick="kakaoLogout();">
            <a href="javascript:void(0)">
                <span>카카오 로그아웃</span></a>
        </div>
</c:if>
<c:if test="${sessionScope.loginUser.u_pfnum == 4}">
    <div><input type="hidden" class="g-signin2" data-onsuccess="onSignIn"></input></div>
    <a href="#" onclick="signOut();">Sign out</a>
</c:if>



</body>
</html>