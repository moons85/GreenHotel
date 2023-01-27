let index = {
    init: function() {
        $(".btn-primary").on("click", () => {
            this.test();
        });
    },
    test : function() {
        var p1 = document.getElementById("password").value;
        var p2 = document.getElementById("passwordck").value;
        var username = document.querySelector("#name").value;
        var email = document.querySelector("#email").value;
        var phonenumber = document.querySelector("#phone").value;
        if( p1 != p2 ) {
            alert("비밀번호가 일치하지 않습니다");
            return false;
        }
        else if(username===null || username.trim()===''){
            alert("이름을 입력해주세요");
            return false;
        }
        else if(email===null || email.trim()===''){
            alert("이메일을 입력해주세요");
            return false;
        }
        else if(phonenumber===null || phonenumber.trim()===''){
            alert("휴대폰번호를 입력해주세요");
            return false;
        }
        else{
            this.update();
        };
    },
    update: function() {
        let data = {
            id : $("#uId").val(),
            name : $("#name").val(),
            email : $("#email").val(),
            phonenumber : $("#phone").val(),
            password : $("#password").val()
        };
        $.ajax({
            type : "put",
            url : "/api/updateuser",
            data : JSON.stringify(data),
            contentType : "application/json; charset=utf-8",
            datatype : "json"
        }).done(function(resp) {
            alert("회원수정이 완료되었습니다.")
            location.replace("/")
        }).fail(function(error) {
            alert("실패");
        })
    }
}
index.init();