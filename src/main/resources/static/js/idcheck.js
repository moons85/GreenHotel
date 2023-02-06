

$('#idcheckbtn').on("click", function() {
	let data = {
		username: $("#id").val()
	};
	// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'

	var re = /^[a-zA-Z0-9]{4,12}$/;
				var idcheckbtnvalue = document.querySelector("#idcheckbtnvalue").value;


	if (re.test(data.username) == false) {
		alert("아이디는 영문 또는 숫자를 4자 이상 입력해주세요.");
		username.focus();
		return false;

	} else {
		$.ajax({
			type: "POST",
			url: "/auth/idcheck",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "JSON"

		}).done(function(data) {

			if (data.data > 0) {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				$('#id').focus();
			} else {
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
$('input[name=checked_id]').attr('value',"value");			}
		}).error(function(request, status, error) {
			console.log(request);
			});
			}
			});;