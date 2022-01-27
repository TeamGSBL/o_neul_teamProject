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
    <form id="foodCheckFrm" method="post">
        <div>
            구이류<input type="checkbox" name="icook" value="구이류">
            국류<input type="checkbox" name="icook" value="국류">
            면류<input type="checkbox" name="icook" value="면류">
            무침류<input type="checkbox" name="icook" value="무침류">
            볶음류<input type="checkbox" name="icook" value="볶음류">
            전류<input type="checkbox" name="icook" value="전류">
            조림류<input type="checkbox" name="icook" value="조림류">
            죽류<input type="checkbox" name="icook" value="죽류">
            찌개류<input type="checkbox" name="icook" value="찌개류">
            찜류<input type="checkbox" name="icook" value="찜류">
            탕류<input type="checkbox" name="icook" value="탕류">
            튀김류<input type="checkbox" name="icook" value="튀김류">
            빵류<input type="checkbox" name="icook" value="빵류">
            무침<input type="checkbox" name="icook" value="무침">
            조림<input type="checkbox" name="icook" value="조림">
            구이<input type="checkbox" name="icook" value="구이">
        </div>
        <div>
            한식<input type="checkbox" name="dining" value="한식">
            양식<input type="checkbox" name="dining" value="양식">
            일식<input type="checkbox" name="dining" value="일식">
            중식<input type="checkbox" name="dining" value="중식">
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
</body>
</html>