function menu1() {
    $(".mSales").show();
    $(".reserve").hide();
    $(".roomRegist").hide();
    $(".roomFix").hide();
}
function menu2() {
    $(".mSales").hide();
    $(".reserve").show();
    $(".roomRegist").hide();
    $(".roomFix").hide();

}
function menu3() {
    $(".mSales").hide();
    $(".reserve").hide();
    $(".roomRegist").show();
    $(".roomFix").hide();
}
function menu4() {
    $(".mSales").hide();
    $(".reserve").hide();
    $(".roomRegist").hide();
    $(".roomFix").show();
}
function fixRoom(fixId) {
    $(".col-lg-6").hide();
    $(".fix" + fixId).show();
}
function regist(){
    console.log($("#roomname").val());
    const roomName = $("#roomname").val();
    const roomContent = $("#roomContent").val();
    const maxPeople = $("#maxPeople").val();
    const roomSize = $("#roomSize").val();
    const roomView = $("#roomView").val();
    const roomBed = $("#roomBed").val();
    const roomPrice = $("#roomPrice").val();
    const roomImg1 = $('input[name="img1"]')[0].files[0];
    const roomImg2 = $('input[name="img2"]')[0].files[0];
    const roomImg3 = $('input[name="img3"]')[0].files[0];
    const roomImg4 = $('input[name="img4"]')[0].files[0];
    console.log(roomName,roomContent,maxPeople,roomSize,roomView,roomBed,roomPrice,roomImg1,roomImg2,roomImg3,roomImg4);

    if(roomName.trim()==='' || roomContent.trim()==='' || maxPeople.trim()==='' ||
        roomSize.trim()==='' || roomView.trim()==='' || roomBed.trim()==='' || roomPrice ==='' ||
        roomImg1===''){
        alert("정보를 모두 입력해주세요")
        return false;
    }
    else{
        let formData = new FormData();
        formData.append("roomname",roomName);
        formData.append("roomcontent",roomContent);
        formData.append("maxpeople",maxPeople);
        formData.append("size",roomSize);
        formData.append("view",roomView);
        formData.append("bed",roomBed);
        formData.append("price",roomPrice);
        formData.append("roommainimg",roomImg1);
        formData.append("roomimg1",roomImg2);
        formData.append("roomimg2",roomImg3);
        formData.append("roomimg3",roomImg4);


        $.ajax({
            type:"POST",
            url:"/resRoom",
            data: formData,
            contentType: false,
            processData: false,
            enctype: "multipart/form-data",
            dataType:"text"
        }).done(function(resp) {
            alert("등록이 완료 되었습니다.")
            location.replace("/admin")
        }).fail(function(error) {
            alert("등록에 실패했습니다.");
        })
    }

}
function updateRoom(roomid,inputid){
    console.log($("#roomname"+inputid).val());
    var roomName = $("#roomname"+inputid).val();
    var roomContent = $("#roomContent"+inputid).val();
    var maxPeople = $("#maxPeople"+inputid).val();
    var roomSize = $("#roomSize"+inputid).val();
    var roomView = $("#roomView"+inputid).val();
    var roomBed = $("#roomBed"+inputid).val();
    var roomPrice = $("#roomPrice"+inputid).val();
    const room1 = "room1"+inputid;
    const room2 = "room2"+inputid;
    const room3 = "room3"+inputid;
    const room4 = "room4"+inputid;
    var roomImg1 = $('input[name='+room1+']')[0].files[0];
    var roomImg2 = $('input[name='+room2+']')[0].files[0];
    var roomImg3 = $('input[name='+room3+']')[0].files[0];
    var roomImg4 = $('input[name='+room4+']')[0].files[0];



    let formData = new FormData();
    formData.append("roomname",roomName);
    formData.append("roomcontent",roomContent);
    formData.append("maxpeople",maxPeople);
    formData.append("size",roomSize);
    formData.append("view",roomView);
    formData.append("bed",roomBed);
    formData.append("price",roomPrice);
    formData.append("roommainimg",roomImg1);
    formData.append("roomimg1",roomImg2);
    formData.append("roomimg2",roomImg3);
    formData.append("roomimg3",roomImg4);


    $.ajax({
        type:"POST",
        url:"/updateRoom/"+roomid,
        data: formData,
        contentType: false,
        processData: false,
        enctype: "multipart/form-data",
        dataType:"text"
    }).done(function(resp) {
        alert("수정이 완료 되었습니다.")
        location.replace("/admin")
    }).fail(function(error) {
        alert("수정에 실패했습니다.");
    })



}