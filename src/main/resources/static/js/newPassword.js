$("#send_code").click(function () {
    const email = $("#email").val();
    const username = $("#username").val();
    const sendEmail = document.forms["sendEmail"];
    $.ajax({
        type: 'post',
        url: '/auth/sendEmail',
        data: {
            'email': email,
            'username': username
        },
        dataType: "text",
        success: function (data) {
            if(data == 0){
                alert("회원 정보를 확인해주세요!");
                return false;
            } else {
                alert('임시비밀번호를 전송 했습니다.');
            }

        },error: function () {
            console.log('에러 체크!!')
        }
    })
});