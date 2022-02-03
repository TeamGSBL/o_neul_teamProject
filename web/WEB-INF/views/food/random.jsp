<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=25634032cad38fd0169f02c62df4da24&libraries=services,clusterer,drawing"></script>
</head>
<body>
    <form style="display: none">
        <c:forEach items="${requestScope.maincon.f_cookery}" var="item">
            <input type="hidden" class="mainCookery" value="${item}">
        </c:forEach>
        <c:forEach items="${requestScope.maincon.f_worlddiv}" var="item">
            <input type="hidden" class="mainWorld" value="${item}">
        </c:forEach>
        <c:forEach items="${requestScope.maincon.igd}" var="item">
            <input type="hidden" class="mainIgd" value="${item}">
        </c:forEach>
        <input type="hidden" class="mainAlone" value="${requestScope.maincon.alone}">
    </form>
    <form id="foodCheckFrm" method="post">
        <div>
            구이류<input type="checkbox" name="f_cookery" value="1">
            국류<input type="checkbox" name="f_cookery" value="2">
            면류<input type="checkbox" name="f_cookery" value="3">
            무침류<input type="checkbox" name="f_cookery" value="4">
            밥류<input type="checkbox" name="f_cookery" value="5">
            볶음류<input type="checkbox" name="f_cookery" value="6">
            전류<input type="checkbox" name="f_cookery" value="7">
            조림류<input type="checkbox" name="f_cookery" value="8">
            죽류<input type="checkbox" name="f_cookery" value="9">
            찌개류<input type="checkbox" name="f_cookery" value="10">
            찜류<input type="checkbox" name="f_cookery" value="11">
            탕류<input type="checkbox" name="f_cookery" value="12">
            튀김류<input type="checkbox" name="f_cookery" value="13">
            빵류<input type="checkbox" name="f_cookery" value="14">
        </div>
        <div>
            한식<input type="checkbox" name="f_worlddiv" value="1">
            양식<input type="checkbox" name="f_worlddiv" value="2">
            일식<input type="checkbox" name="f_worlddiv" value="3">
            중식<input type="checkbox" name="f_worlddiv" value="4">
        </div>
        <div>
            육류<input type="checkbox" name="igd" value="1">
            해산물<input type="checkbox" name="igd" value="2">
            채소<input type="checkbox" name="igd" value="3">
            가공품<input type="checkbox" name="igd" value="4">
        </div>
        <div>
            혼밥<input type="checkbox" name="alone" value="1">
        </div>
        <input type="submit" value="check">
    </form>
    <div>
        <h3>오늘의 음식은?</h3>
        <div id="foodInfo"
            data-fnm="${requestScope.food.f_nm}"
        >
            ${requestScope.food.f_nm}
        </div>
        <img id="foodImg" src="/res/img/defualtFoodImg.jpg">
    </div>
    <div class="map-restbox">
        <div id="map" style="width:500px;height:400px;"></div>
        <div id="restaurant_box" class="restbox">

        </div>
    </div>
</body>
</html>