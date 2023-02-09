let index = {

	init: function() {
		$("#btnsignup").on("click", () => {
			this.test();
		});
	},
	test: function() {
		var p1 = document.getElementById("password").value;
		var p2 = document.getElementById("passwordck").value;
		var userid = document.querySelector("#id").value;
		var username = document.querySelector("#name").value;
		var email = document.querySelector("#email").value;
		var phonenumber = document.querySelector("#phone").value;
		var idcheckbtnvalue = document.querySelector("#idcheckbtnvalue").value;

		var num = p1.search(/[0-9]/g);
		var eng = p1.search(/[a-z]/ig);
		var spe = p1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		var regExp = /^[0-9]*$/;

		var idinput = document.getElementById("id");
		var pwinput = document.getElementById("password");
		var pwchkinput = document.getElementById("passwordck");
		var nameinput = document.getElementById("name");
		var emailinput = document.getElementById("email");
		var phoneinput = document.getElementById("phone");

		if (userid === null || userid.trim() === '') {
			alert("아이디를 입력해주세요");
			idinput.focus();
			return false;
		}
		else if (idcheckbtnvalue === null || idcheckbtnvalue.trim() === '') {
			alert("아이디 중복 체크를 해주세요.");
			idinput.focus();
			return false;
		}
		else if (p1 === null || p1.trim() === '') {
			alert("비밀번호를 입력해주세요");
			pwinput.focus();
			return false;
		} else if (p1.length < 8 || p1.length > 20) {
			alert("8자리 ~ 20자리 이내로 입력해주세요.");
			pwinput.focus();

			return false;
		} else if (p1.search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.");
			pwinput.focus();

			return false;
		}  else if (num < 0 || eng < 0 || spe < 0) {
			alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			pwinput.focus();

			return false;
		}else if (p1 != p2) {
			alert("비밀번호가 일치하지 않습니다");
			console.log(username);
			console.log(email);
			pwchkinput.focus();
			return false;
		}

		else if (username === null || username.trim() === '') {
			alert("이름을 입력해주세요");
			nameinput.focus();

			return false;
		}
		else if (email === null || email.trim() === '') {
			alert("이메일을 입력해주세요");
			emailinput.focus();

			return false;
		} else if
			(!emailRegExp.test(email)) {
			alert("이메일 형식을 다시 한 번 확인해주세요.");
			emailinput.focus();

			return false;
		}

		else if (phonenumber === null || phonenumber.trim() === '') {
			alert("휴대폰번호를 입력해주세요");
			phoneinput.focus();

			return false;
		} else if (!regExp.test(phonenumber)) {
			alert("휴대폰번호는 숫자만 입력 가능합니다.");
			phoneinput.focus();

			return false;
		}

		else {
			this.save();
		};
	},
	save: function() {
		let data = {
			username: $("#id").val(),
			name: $("#name").val(),
			email: $("#email").val(),
			phonenumber: $("#phone").val(),
			password: $("#password").val()
		};
		$.ajax({
			type: "POST",
			url: "/auth/api/user",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			datatype: "json"
		}).done(function(resp) {
			alert("회원가입이 완료되었습니다. 회원가입 축하 1,000포인트 적립!")
			location.replace("/auth/login")
		}).fail(function(error) {
			alert("존재하는 아이디입니다.");
		})
	}
}
index.init();