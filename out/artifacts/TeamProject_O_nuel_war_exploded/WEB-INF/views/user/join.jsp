<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
<form action="/user/join" method="post">
    <div><input type="text" name="u_id" placeholder="아이디"></div>
    <div><input type="password" name="u_pw" placeholder="비밀번호"></div>
    <div><input type="text" name="u_nm" placeholder="이름"></div>
    <div><input type="text" name="u_email" placeholder="이메일"></div>
    <div><input type="submit" value="회원가입"></div>
</form>


</body>
</html>
