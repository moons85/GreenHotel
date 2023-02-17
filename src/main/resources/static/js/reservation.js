
function room(){
    var startDate = document.getElementById("checkin").value;
    var endDate = document.getElementById("checkout").value;
    var adult=$("#adult").val();
    var kid=$("#kid").val();

    if(startDate == ""){
        alert("체크인 날짜를 선택하세요");
        return false;
    } else if(endDate == ""){
        alert("체크아웃 날짜를 선택하세요");
        return false;
    } else if(adult == ""){
        alert("성인 인원 수를 선택 해 주세요");
        return false;
    } else if(kid == ""){
        alert("아동 인원 수를 선택 해 주세요");
        return false;
    }

    $.ajax({
        type : "GET",
        url : "/booklist/"+startDate+"/"+endDate+"/"+adult+"/"+kid,

    }).done(function(resp) {
        location.replace("/booklist/"+startDate+"/"+endDate+"/"+adult+"/"+kid)
    }).fail(function(error) {
        console.log(startDate, endDate)
    })
}





function reserve(id){
    var startDate = document.getElementById("checkin").value;
    var endDate = document.getElementById("checkout").value;
    var adult=$("#adult").val();
    var kid=$("#kid").val();


    if(startDate == null){
        alert("체크인 날짜를 선택하세요");
        return false;
    } else if(endDate == null){
        alert("체크아웃 날짜를 선택하세요");
        return false;
    } else if(adult == null){
        alert("성인 인원 수를 선택 해 주세요");
        return false;
    } else if(kid == null){
        alert("아동 인원 수를 선택 해 주세요");
        return false;
    }


    $.ajax({
        type : "GET",
        url : "/reservationform/"+startDate+"/"+endDate+"/"+adult+"/"+kid+"/"+id,
    }).done(function(resp) {
        location.replace("/reservationform/"+startDate+"/"+endDate+"/"+adult+"/"+kid+"/"+id)
    }).fail(function(error) {
        alert("오류가 발생했습니다");
    })
}




function selectroom(){
    var startDate = document.getElementById("checkin").value;
    var endDate = document.getElementById("checkout").value;
    var adult=$("#adult").val();
    var kid=$("#kid").val();

    if(startDate == ""){
        return false;
    } else if(endDate == ""){
        return false;
    } else if(adult == ""){
        return false;
    } else if(kid == ""){
        return false;
    }

    else{
        $.ajax({
            type : "POST",
            url : "/booklist/"+startDate+"/"+endDate+"/"+adult+"/"+kid,

        }).done(function(resp) {
            if(resp.roomlist[0] == null){
                $("#subject").show();
                $("#subject").val("해당하는 방이 없습니다.");
                $(".roomlist").hide();
            }
            else{
                let room = [resp.roomlist[i].id];
                prices = [resp.roomlist[i].price];
                let selectRoom = $("<select class='room' name='room'>");
                for(i in room){
                    selectRoom.append($("<option val="+i+">"+room[i]+"</option>"));
                }
                /*var str = "<select class='list' onchange='changePrice()'>";*/
                /*for(var i in resp.roomlist){
                    str += "<option value='"+resp.roomlist[i].id+"'>"+resp.roomlist[i].roomname+"</option> "
                    prices.push(resp.roomlist[i].price);
                }*/
                $("#price").html(prices[0]);
                $("#box").html(selectRoom);
                str += "<select>";
                $(".roomlist").html(str);
                str = ""
                $(".roomlist").show();
                $("#total").html("price : "+resp.roomlist[0].price)
                $("#subject").hide();
            }
        }).fail(function(error) {
            alert("오류가 발생했습니다");
        })
    }

}
$("#pay").click(function () {
    var price = parseInt($("#price").val())

    const IMP = window.IMP; // 생략가능
    IMP.init('imp78777388');
    IMP.request_pay({
        pg: 'kakaopay',
        pay_method: 'card',
        merchant_uid: 'privateHotel' + new Date().getTime(),
        name : $("#roomname").val(),
        amount : price,
    }, function (rsp) {
        console.log(rsp);
        if (rsp.success) {
            reservesucces()
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
    });
});


function reservesucces(){
    // const Id = $("#uId").val();
    // const startDate = $("#checkin").val()
    // const endDate = $("#checkout").val()
    // const roomname = $("#roomname").val()
    // const adult=$("#adult").val();
    // const kid=$("#kid").val();
    // const price = $("#price").val()

    let data = {
        userId : $("#Id").val(),
        startDate : $("#checkin").val(),
        endDate : $("#checkout").val(),
        roomname : $("#roomname").val(),
        adult : $("#adult").val(),
        kid : $("#kid").val(),
        price : $("#price").val()
    };
    $.ajax({
        type : "POST",
        url : "/reservation",
        data : JSON.stringify(data),
        contentType : "application/json; charset=utf-8",
        datatype : "json"
    }).done(function(resp) {
        alert("예약 완료되었습니다.")
        location.replace("/")
    }).fail(function(error) {
        alert("예약 실패");
    })
}

