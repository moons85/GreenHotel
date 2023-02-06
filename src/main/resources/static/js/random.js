const body = document.querySelector('body');
const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.btn-open-popup');

btnOpenPopup.addEventListener('click', () => {
    modal.classList.toggle('show');

    if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
    }
});

modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
        }
    }
});

const selectbtn = document.querySelectorAll(".select_btn");
const id = document.querySelector("#uId").value;
let point = document.querySelector("#point").value;
point = parseInt(point)
let coupon;

selectbtn.forEach((target)=>{
    target.addEventListener('click',(e)=>{
        e.preventDefault();
        this.play(target.value)
    });
});


function play(e){
    let n = Math.floor(Math.random() * 25) + 1;
    console.log(e,n,point)
    if(e==n){
        coupon = "호텔 3박 4일 숙박권"
        alert("1등! 호텔 3박 4일 숙박권!")
        save(coupon)
    }
    else if(e==n+1 || e==n-1){
        coupon = "호텔 1박 2일 숙박권"
        alert("2등! 호텔 1박 2일 숙박권!")
        save(coupon)
    }
    else if(e==n+2 || e==n-2){
        coupon = "호텔 30,000원 이용권"
        alert("3등! 호텔 30,000원 이용권!")
        save(coupon)
    }
    else{
        alert("아쉽네요...다음에 도전하세요!")
        // point+=100;
        // pointsave(point)
        return false;
    }

}

function save(coupon){
    let data = {
        coupon: coupon,
        userId : $("#uId").val(),
    }
    console.log(coupon,$("#uId").val())

    $.ajax({
        type: "POST",
        url: "/api/event",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(function(resp){
        console.log("쿠폰 발급");
        location.replace("/")
    }).fail(function(error){
        alert("쿠폰 발급 에러");
    });
}

// function pointsave(point){
//     let data = {
//         point :point,
//         userId : $("#uId").val(),
//     }
//     console.log(point,$("#uId").val())
//
//     $.ajax({
//         type: "post",
//         url: "/api/point",
//         data: JSON.stringify(data),
//         contentType: "application/json; charset=utf-8",
//         dataType: "json"
//     }).done(function(resp){
//         console.log("성공");
//         location.replace("/")
//     }).fail(function(error){
//         alert("포인트 적립 에러");
//     });
// }