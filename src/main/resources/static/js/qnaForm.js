let index = {
    init: function() {
        $(".btn-primary").on("click", () => {
            this.test();
        });
    },
    test : function() {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value;
        var category = document.getElementById("category").value;
        if(title===null || title.trim()===''){
            alert("제목을 입력해주세요");
            return false;
        }
        else if(content===null || content.trim()===''){
            alert("내용을 입력해주세요");
            return false;
        }
        else if(category===null || category.trim()===''){
            alert("문의 종류를 입력해주세요");
            return false;
        }
        else{
            this.save();
        };
    },
    save: function() {
        let data = {
            userId : $("#userId").val(),
            title : $("#title").val(),
            content : $("#content").val(),
            category : $("#category").val()
        };
        $.ajax({
            type : "POST",
            url : "/api/qna",
            data : JSON.stringify(data),
            contentType : "application/json; charset=utf-8",
            datatype : "json"
        }).done(function(resp) {
            alert("문의가 완료되었습니다.")
            location.replace("/")
        }).fail(function(error) {
            alert("실패");
        })
    }
}
index.init();