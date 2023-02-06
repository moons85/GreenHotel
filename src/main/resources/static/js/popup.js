
function setCookie(name, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
function closePop() {
	if (document.pop_form.pop_check.checked) {
		console.log('닫기 check')
		setCookie("maindiv", "done", 1);
	}
	$('.layerPopup').hide();
	console.log('닫기')
}

function clickPop(){
	location.href='#eventsection'
		$('.layerPopup').hide();

}



cookiedata = document.cookie;
if (cookiedata.indexOf("maindiv=done") < 0) {
	$('.layerPopup').show();
}
else {
	console.log("aaa");
	$('.layerPopup').hide();
	console.log("하루지났음");
}
