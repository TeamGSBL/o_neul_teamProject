<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="shortcut icon" href="#">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

<form id="loginBtn" action="/user/login" method="post" data-msg="${requestScope.msg}">
    <div><input type="text" name="u_id" placeholder="아이디" value="mic"></div>
    <div><input type="password" name="u_pw" placeholder="비밀번호" value="1212"></div>
    <span><input type="submit" value="로그인"></span>
</form>
<span><a href="/user/join"><input type="button" value="회원가입"></a></span>






<%--네이버--%>
<div id="naver_id_login" >
    <a id="naverIdLogin_loginButton">

        <img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.0" width="50%" height="auto" style="max-width:100px;max-height:60px"/>
    </a>
</div>

<script type="text/javascript">
    var naver_id_login = new naver_id_login("CU4oIqnKlO1XPT8Z1wwf", "http://localhost:8090/naver/ncallback");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 2,50);
    naver_id_login.setDomain("YOUR_SERVICE_URL");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
</script>

<%--카카오--%>

    <div onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="80%" height="45px" style="max-width:130px;max-height:80px" alt="카카오 로그인 버튼"/>
        </a>
    </div>


<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    Kakao.init('a240cd5b5321fd46f13d6809dfd9b250'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    //카카오로그인
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        console.log(response);
                        var email = response.kakao_account.email;
                        var nickname = response.kakao_account.profile.nickname;
                        const loginObj= {
                            u_email: email,
                            u_nm: nickname
                        }
                        var url = "/user/kakao"
                        fetch(url, {
                            method: 'post',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify(loginObj)
                        }).then(function(res) {
                            return res.json();
                        }).then(function(data) {
                            console.log(data);
                        }).catch(function (err) {
                            console.log(err);
                        });
                        location.href='/board/list';


                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })

            },
            fail: function (error) {
                console.log(error)
            },
        })


    }
</script>

<div><a href="/user/google">구글 아이디로 로그인</a></div>
</body>
</html>

