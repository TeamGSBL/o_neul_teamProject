<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
    <div class="bn">
        <div class="bn-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img class="w100" src="/res/img/con1.png"/></div>
                <div class="swiper-slide"><img src="/res/img/b2.png"/></div>
                <div class="swiper-slide"><img src="/res/img/b3.png"/></div>
                <div class="swiper-slide bg-lightpink"><img src="/res/img/b1.png"/></div>
                <div class="swiper-slide"><img src="/res/img/b4.png"/></div>
                <div class="swiper-slide"><img src="/res/img/b5.png"/></div>
                <div class="swiper-slide bg-light"><img src="/res/img/b6.png"/></div>
            </div>
            <!-- 페이징 -->
            <div class="swiper-pagination"></div>
            <!-- 네비게이션 -->




        </div>
    </div>
    <div class="main-container">
        <section class="foodrd ">
            <i id="foodImg" class="fas fa-hamburger flex-c-c f-s-40 cc"></i>
            <div class="line">오늘의 음식</div>
            <div class="flex-c-r mt20">: 뭐 먹을지 고민될 때 :</div>
            <div class="rdfood-main mt60">
                <ul class="rdfood-list">
                    <li class="rdfood-item">
                        <div class="rdfood-img">
                            <div class="rdfood-info"></div>
                        </div>
                    </li>
                    <li class="rdfood-item">
                        <div class="rdfood-img">
                            <div class="rdfood-info"></div>
                        </div>
                    </li>
                    <li class="rdfood-item">
                        <div class="rdfood-img">
                            <div class="rdfood-info"></div>
                        </div>
                    </li>
                    <li class="rdfood-item">
                        <div class="rdfood-img">
                            <div class="rdfood-info"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="flex-c-r">
                <div class="main-btn-box">
                    <div class="flex-c-c">
                        <i id="foodRe" class="f-s-30 fas fa-redo-alt pointer"></i>
                        <span class="f-s-10">다시 검색</span>
                    </div>
                    <div class="flex-c-c">
                        <i id="foodGo" class="f-s-30 far fa-arrow-alt-circle-right pointer"></i>
                        <span class="f-s-10">상세 검색</span>
                    </div>
                </div>
            </div>
        </section>
        <section class="jmt">
            <div class="flex-c-r"><i class="f-s-40 fas fa-utensils cc"></i></div>
            <div class="line">오늘의 맛집</div>
            <div class="flex-c-r mt20">: 내 주변 맛집들 :</div>
            <div class="gridlist-box mt60">
                <ul id="jmtList" class="rcrest-list g50"></ul>
            </div>
            <div class="flex-c-r">
                <div class="jmt-btn-box ">
                    <i id="jmtGo" class="f-s-40 fas fa-angle-double-right pointer"></i>
                    <span class="f-s-20">더보기</span>
                </div>
            </div>
        </section>
        <section class="broad">
            <div class="flex-c-r"><i class="fas fa-tv f-s-40 cc"></i></div>
            <div class="line">방송별 맛집</div>
            <div class="flex-c-r mt20 mb20">: 방송에 나온 맛집들 :</div>
            <div class="swiper-container mt60">
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
        <section class="ss-ak">
            <div class="line">Season & Alcohol</div>
            <div class="flex-c-r w100 mt60">
                <ul class="sa-list">
                    <div class="flex-c-c">
                        <div id="s_today" class="s-today flex-c-r mb20"></div>
                        <li class="ss-list" id="ss_list"></li>
                        <div class="jmt-btn-box ">
                            <i id="seasonGo" class="f-s-40 fas fa-snowflake pointer"></i>
                            <span class="f-s-20">더보기</span>
                        </div>
                    </div>
                    <div class="flex-c-c">
                        <div>
                            <fieldset class="flex-c-r g30 mb20 ">
                                <label class="a-chk">소주<input  type="radio" name="alk" value="1" checked></label>
                                <label>맥주<input type="radio" name="alk" value="2"></label>
                                <label>막걸리<input type="radio" name="alk" value="3"></label>
                                <label>양주<input type="radio" name="alk" value="4"></label>
                            </fieldset>
                        </div>
                        <li class="ac-list" id="ac_list"></li>
                        <div class="jmt-btn-box ">
                            <i id="alkGo" class="f-s-40 fas fa-wine-glass-alt pointer"></i>
                            <span class="f-s-20">더보기</span>
                        </div>
                    </div>
                </ul>
            </div>
        </section>
    </div>
</body>