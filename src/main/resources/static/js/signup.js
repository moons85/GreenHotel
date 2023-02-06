// let index = {
//     init: function() {
//         $(".btn-primary").on("click", () => {
//             this.test();
//         });
//     },
//     test : function() {
//         var p1 = document.getElementById("password").value;
//         var p2 = document.getElementById("passwordck").value;
//         var userid = document.querySelector("#id").value;
//         var username = document.querySelector("#name").value;
//         var email = document.querySelector("#email").value;
//         var phonenumber = document.querySelector("#phone").value;
//         if( p1 != p2 ) {
//             alert("비밀번호가 일치하지 않습니다");
//             console.log(username);
//             console.log(email);
//             return false;
//         }
//         else if(p1===null || p1.trim()===''){
//             alert("비밀번호를 입력해주세요");
//             return false;
//         }
//         else if(userid===null || userid.trim()===''){
//             alert("아이디를 입력해주세요");
//             return false;
//         }
//         else if(username===null || username.trim()===''){
//             alert("아이디를 입력해주세요");
//             return false;
//         }
//         else if(email===null || email.trim()===''){
//             alert("이메일을 입력해주세요");
//             return false;
//         }
//         else if(phonenumber===null || phonenumber.trim()===''){
//             alert("휴대폰번호를 입력해주세요");
//             return false;
//         }
//         else{
//             this.save();
//         };
//     },
//     save: function() {
//         let data = {
//             username : $("#id").val(),
//             name : $("#name").val(),
//             email : $("#email").val(),
//             phonenumber : $("#phone").val(),
//             password : $("#password").val()
//         };
//         $.ajax({
//             type : "POST",
//             url : "/auth/api/user",
//             data : JSON.stringify(data),
//             contentType : "application/json; charset=utf-8",
//             datatype : "json"
//         }).done(function(resp) {
//             alert("회원가입이 완료되었습니다. 회원가입 축하 포인트 1000포인트 적립!")
//             location.replace("/auth/login")
//         }).fail(function(error) {
//             alert("존재하는 아이디입니다.");
//         })
//     }
// }
// index.init();
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
		if (p1 != p2) {
			alert("비밀번호가 일치하지 않습니다");
			console.log(username);
			console.log(email);
			return false;
		}
		else if (p1 === null || p1.trim() === '') {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		else if (userid === null || userid.trim() === '') {
			alert("아이디를 입력해주세요");
			return false;
		}
		else if (idcheckbtnvalue === null || idcheckbtnvalue.trim() === '') {
			alert("아이디 중복 체크를 해주세요.");
			return false;
		}
		else if (username === null || username.trim() === '') {
			alert("이름을 입력해주세요");
			return false;
		}
		else if (email === null || email.trim() === '') {
			alert("이메일을 입력해주세요");
			return false;
		}
		else if (phonenumber === null || phonenumber.trim() === '') {
			alert("휴대폰번호를 입력해주세요");
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