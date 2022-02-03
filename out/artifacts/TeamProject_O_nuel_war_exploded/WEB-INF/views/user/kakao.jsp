<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
<ul>
    <li onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
        </a>
    </li>
    <li onclick="kakaoLogout();">
        <a href="javascript:void(0)">
            <span>카카오 로그아웃</span>
        </a>
    </li>
</ul>
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
    //카카오로그아웃
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                    location.href='/user/login';
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
        }
    }
</script>

</body>
</html>
