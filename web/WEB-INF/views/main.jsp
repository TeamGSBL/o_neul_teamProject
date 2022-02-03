<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <div class="main-container">
        <section class="banner">
            <div class="wrap_center">
                <div class="container">
                    <div class="img_wrap">
                        <ul class="rollimgs">
                            <li><img src="/res/img/banner1.png"></img></li>
                            <li><img src="/res/img/banner2.png"></img></li>
                            <li><img src="/res/img/banner3.png"></img></li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="foodrd">
            <div class="line">음식추천</div>
            <div class="rdfood-main ">
                <form class="rdfood-frm" id="foodCheckFrm" method="post" action="/food/main">
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
            </div>
        </section>
        <section class="jmt">
            <div class="line">맛집추천</div>
            <div class="gridlist-box">
                <ul class="rcrest-list">
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집1</strong>
                        </div>
                    </li>
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집2</strong>
                        </div>
                    </li>
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집3</strong>
                        </div>
                    </li>
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집4</strong>
                        </div>
                    </li>
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집5</strong>
                        </div>
                    </li>
                    <li class="rcrest-item">
                        <div class="rcrest-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>맛집6</strong>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <section class="broad">
            <div class="line">방송별 맛집</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide"><img src="/res/img/back3.jpg"/></div>
                    <div class="swiper-slide"><img src="/res/img/tasty.png"/></div>
                    <div class="swiper-slide"><img src="/res/img/sangsang.jpg"/></div>
                    <div class="swiper-slide"><img src="/res/img/matguys.jpg"/></div>
                    <div class="swiper-slide"><img src="/res/img/wed.png"/></div>
                    <div class="swiper-slide"><img src="/res/img/defualtFoodImg.jpg"/></div>
                </div>
                <!-- 네비게이션 -->
                <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
                <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

                <!-- 페이징 -->
                <div class="swiper-pagination"></div>
            </div>
        </section>
        <section class="season">
            <div class="line">Season & Alcohol</div>
            <div class="gridlist-box">
                <ul class="s-a-list">
                    <li class="s-a-item">
                        <div class="s-a-img"
                             style="background-image:url('/res/img/defualtFoodImg.jpg')">
                        </div>
                        <div>
                            <strong>season</strong>
                        </div>
                    </li>
                    <li class="s-a-item">
                        <div class="s-a-img"
                             style="background-image:url('/res/img/alc.png')">
                        </div>
                        <div>
                            <strong>alcohol pairing</strong>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
    </div>
</body>
