<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!-- Footer Start -->

<div class="container-fluid bg-dark footer pt-5">
    <div id="footer">
            <div class="footer_in">
                <div><img src="${path}/resources/image/common/logo_ft.png" style="cursor:pointer"></div>
                <div class="footerIn_txt">
                    <div>
                        <a href="${path }/intro">회사소개</a>
                        <a href="${path }/map">오시는길</a>
                        <a href="${path }/policy">이용약관</a>
                    </div>
                    <dl>
                        <dt>(주)스마트해법 </dt>
                        <dd>대표자 : 이슬비</dd>
                        <dd>사업자등록번호 : 1004-8282-1004</dd>
                        <dd>부가통신사업 신고 번호 : 54321</dd>
                        <dd>통신판매신고서 : 제2023-서울금천-1501호</dd>
                        <dd>주소 : 서울 금천구 가산로9길 54 (가산동)</dd>
                        <dd>대표번호 :&nbsp;1577-1004</dd>
                        <p class="copy">Copyright ⓒ HAEBEOP Corp. All Rights Reserved</p>
                    </dl>
                </div>


                <div class="foot-side">
                    <div class="foot-cont cs">
                        <div class="foot-cscenter">
                            <p class="tel">고객센터</p>
                            <h3>1577-1004</h3>
                            <div class="open-time"><span>운영시간</span> <span class="time">오전 10시 ~ 오후 5시 (주말, 공휴일 휴무)</span></div>
                            <div class="open-time lunch"><span>점심시간</span> <span class="time">오후 11시 00분 ~ 오후 1시 00분</span></div>
                        </div>
                    </div>
                    <div class="foot-sns">
                        <a href="https://www.instagram.com/genia.academy/"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_instagram.png" alt="insta"></a>
                        <a href="#"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_facebook.png" alt="facebook"></a>
                        <a href="https://www.youtube.com/channel/UCgJ8iR8g3_7Cx-kqZZAcRrQ"><img src="http://fiximage.10x10.co.kr/web2021/cscenter/icon_sns_you.png" alt="yotube"></a>
                    </div>
                </div>

            </div>
    </div>

</div>

<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path }/resources/lib/wow/wow.min.js"></script>
<script src="${path }/resources/lib/easing/easing.min.js"></script>
<script src="${path }/resources/lib/waypoints/waypoints.min.js"></script>
<script src="${path }/resources/lib/counterup/counterup.min.js"></script>
<script src="${path }/resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="${path }/resources/js/main.js"></script>


<script src="${path }/resources/plugins/common/common.min.js"></script>
<script src="${path }/resources/js/custom.min.js"></script>
<script src="${path }/resources/js/settings.js"></script>
<script src="${path }/resources/js/gleek.js"></script>
<script src="${path }/resources/js/styleSwitcher.js"></script>

<!-- Chartjs -->
<script src="${path }/resources/plugins/chart.js/Chart.bundle.min.js"></script>
<!-- Circle progress -->
<script src="${path }/resources/plugins/circle-progress/circle-progress.min.js"></script>
<!-- Datamap -->
<script src="${path }/resources/plugins/d3v3/index.js"></script>
<script src="${path }/resources/plugins/topojson/topojson.min.js"></script>
<script src="${path }/resources/plugins/datamaps/datamaps.world.min.js"></script>
<!-- Morrisjs -->
<script src="${path }/resources/plugins/raphael/raphael.min.js"></script>
<script src="${path }/resources/plugins/morris/morris.min.js"></script>
<!-- Pignose Calender -->
<script src="${path }/resources/plugins/moment/moment.min.js"></script>
<script src="${path }/resources/plugins/pg-calendar/js/pignose.calendar.min.js"></script>
<!-- ChartistJS -->
<script src="${path }/resources/plugins/chartist/js/chartist.min.js"></script>
<script src="${path }/resources/plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



<script src="${path }/resources/js/dashboard/dashboard-1.js"></script>