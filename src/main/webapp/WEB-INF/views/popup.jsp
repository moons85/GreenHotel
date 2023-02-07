<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup">
    <div class="layerBox">
        <h4 class="title text-center">EVENT PAGE</h4>
        <div class="cont">
            <img src="/images/popup.png" width=500 height=500 usemap="#popup" alt="event page" onclick="clickPop()">
        </div>
        <form name="pop_form">
            <div id="pop_check" ><input type="checkbox" name="pop_check" value="pop_checkbox" id="pop_checkbox" >
                <label for="pop_checkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
            <div id="close_pop" ><a href="javascript:closePop();">닫기</a></div>
        </form>
    </div>
</div>