let index = {
    init: function() {
        $("#rcode").on("click", () => {
            this.test();
        });
    },
    test : function() {
        var email = document.querySelector("#email").value;
        var phonenumber = document.querySelector("#phonenumber").value;
        if(phonenumber===null || phonenumber.trim()===''){
            alert("휴대폰번호를 입력해주세요");
            return false;
        }
        else if(email===null || email.trim()===''){
            alert("이메일을 입력해주세요");
            return false;
        }
        else{
            this.findId();
        };
    },
    findId: function() {
        var email=$('#email').val()
        var phonenumber=$('#phonenumber').val()
        console.log(email)
        console.log(phonenumber)

        $.ajax({
            url:"/auth/find_id",
            type:"POST",
            data:{"email":email, "phonenumber":phonenumber} ,
            success:function(data){
                if(data == 0){
                    $('.idvalue').text("회원 정보를 확인해주세요!");
                    $('#email').val('');
                    $('#phonenumber').val('');
                } else {
                    $('.idvalue').text("회원님의 아이디는 "+data+"입니다.");
                    $('#email').val('');
                    $('#phonenumber').val('');

                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
    }
}
index.init();