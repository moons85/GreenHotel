let index = {
    init: function() {
        $(".btn-primary").on("click", () => {
            this.test();
        });
        $("#deletebtn").on("click", () => {
            this.delete();
        });
        $("#search_btn").on("click", () => {
            this.search_qna();
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
            location.replace("/auth/qnaForm")
        }).fail(function(error) {
            alert("실패");
        })
    },
    delete: function() {
        const faqId= document.querySelector("#fId").value
        $.ajax({
            type : "delete",
            url : "/api/qna/"+faqId,
            datatype : "json"
        }).done(function(resp) {
            alert("삭제가 완료되었습니다.")
            location.replace("/auth/qnaForm")
        }).fail(function(error) {
            alert("실패");
        })
    },
    search_qna: function (){
        const s_category= $("#search_category").val()
        const s_date = $("#search_data").val()
        console.log(s_category,s_date)

        // $.ajax({
        //     url:"/auth/find_faq",
        //     type:"POST",
        //     success:function(data){
        //         console.dir(data)
        //     },
        //     data:{"s_category":$("#search_category").val(), "s_data":$("#search_data").val()} ,
        //     error:function(){
        //         alert("에러입니다");
        //     }
        // });
    }
}
index.init();