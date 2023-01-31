function save(){
    const content = document.querySelector(".add_reply").value
    const faqId= document.querySelector("#fId").value
    const userId= document.querySelector("#uId").value
    if(content.trim() === '' || content===null){
        alert("내용을 입력해주세요")
        return false;
    }
    let data = {
        content,
        faqId,
        userId
    }

    $.ajax({
        type: "POST",
        url: "/auth/faqreply",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json"
    }).done(function(resp){
        alert("댓글 작성이 완료되었습니다.");
        location.href="/auth/qnadetail/"+faqId;
    }).fail(function(error){
        alert("실패");
    });
}

function deleteById() {
    const faqId= document.querySelector("#fId").value
    const id = document.querySelector("#frId").value;

    $.ajax({
        type: "DELETE",
        url: "/auth/faqreply/"+id,
        dataType: "json"
    }).done(function(resp){
        alert("댓글 삭제가 완료되었습니다.");
        location.href="/auth/qnadetail/"+faqId;
    }).fail(function(error){
        alert(JSON.stringify(error));
    });
}

