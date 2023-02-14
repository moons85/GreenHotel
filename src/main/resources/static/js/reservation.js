let index = {
    init: function() {
        $(".btn-primary").on("click", () => {
            this.submit();
        });
    },
    submit : function() {
	 	var id = document.getElementById("id").value;
	 	var reservedate = document.getElementById("reservedate").value;
	 	var room = document.getElementById("room").value;
	 	var checkin = document.getElementById("checkin").value;
	 	var checkout = document.getElementById("checkout").value;
	 	$("#adult").val();
	 	$("#kid").val();
	 	$("#service").val();
	 	$("#pay"),val();
	 	var other = document.getElementById("other").value;
	if(room === null){
		alert("방을 선택해 주세요");
		return false;
	}
	else if(checkin === null){
		alert("체크인 날짜를 선택해주세요");
		return false;
	}
	else if(checkout === null){
		alert("체크아웃 날짜를 선택해주세요");
	 	return false;
	}
	else if(adult === null){
		alert("성인 인원수를 선택해주세요");
		return false;
	}
	else if(kid === null){
		alert("아이 인원수를 선택해주세요");
		return false;
	}
	else if(service === null){
		alert("최소 한개 이상의 서비스를 선택해주세요");
		return false;
	}
	else if(pay === null){
		alert("결제 수단을 선택해주세요");
		return false;
	}
	else{
	 	this.save();
	};
	},
	save: function(){
		let data = {
			id : $("#id").val(),
			reservedate : $("#reservedate").val(),
			room : $("#room").val(),
			checkin : $("#checkin").val(),
			checkout : $("#checkout").val(),
			adult : $("#adult").val(),
			kid : $("#kid").val(),
			service : $("#service").val(),
			pay : $("#pay").val(),
			other : $("#other").val(),
		};
		  $.ajax({
            type : "POST",
            url : "/auth/reservation",
            data : JSON.stringify(data),
            contentType : "application/json; charset=utf-8",
            datatype : "json"
        }).done(function(resp) {
            alert("예약이 완료되었습니다")
            location.replace("/auth/login")
        }).fail(function(error) {
            alert("예약에 실패했습니다");
        })	
	}
}
index.init();