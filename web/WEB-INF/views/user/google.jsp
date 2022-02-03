<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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

<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="#" onclick="signOut();">Sign out</a>

<script>

    function onSignIn(googleUser) {
        var profile = googleUser.getBasicProfile();
        const name = profile.getName();
        const email = profile.getEmail();
        const loginObj = {
            u_email:email,
            u_nm:name
        };

        var url = "/user/google";
        fetch(url, {
            method: 'post',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(loginObj)
        }).then(function(res) {
            location.href='/board/list';
            return res.json();
        }).then(function(data) {
            console.log(data);
        }).catch(function (err) {
            console.log(err);
        });

    }
    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function (){
            location.href='/user/login';
        });
        auth2.disconnect();
    }

</script>


</body>
</html>