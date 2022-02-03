<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

<div>${sessionScope.loginUser.u_nm}님 환영합니다</div>
<div><a href="/user/mypage/profile"><input type="button" value="마이페이지"></a></div>
<div><a href="/user/logout"><input type="button" value="로그아웃"></a></div>


</body>
</html>