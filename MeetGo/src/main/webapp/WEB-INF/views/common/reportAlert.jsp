<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>신고 Alert창</title>
    <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
    #modalWrapReport {
        position: fixed; /* Stay in place */
        z-index: 99; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        display: none;
        justify-content: center;
        align-items:center;
        flex-wrap:wrap;
        padding:0;
        margin:0;
        font-family: sans-serif;
    }

    .report_content {
        width: 1000px;
        height: 800px;
        margin: 2% auto 0 auto;
        padding: 50px 100px 0 100px;
        border: 1px solid black;
        border-radius: 20px;
        background-color: #fff;
        box-shadow: 5px 5px 20px 5px #313131;
    }



    .estimate_content p {
        margin: 0;
    }
    .reportCategory {
        display:flex;
        flex-direction: column;
        position:relative;
        width:400px;
        height:40px;
        color: black;
    }

    .reportOption {
        padding:0 30px 0 10px;
        margin: 0;
        min-height:40px;
        display:flex;
        align-items:center;
        background: #ffffff;
        border: 1px solid black !important;
        position:absolute;
        top:0;
        width: 100%;
        pointer-events:none;
        order:2;
        z-index:1;
        transition:background .4s ease-in-out;
        box-sizing:border-box;
        overflow:hidden;
        white-space:nowrap;

    }

    .reportOption:hover {
        background:#666;
        color: white;
    }

    .reportCategory:focus .reportOption {
        position:relative;
        pointer-events:all;
    }

    .reportCategory input {
        opacity:0;
        position:absolute;
        left:-99999px;
    }

    .reportCategory input:checked + label {
        order: 1;
        z-index:2;
        background: #ffffff;
        color: black;
        border-top:none;
        position:relative;
    }

    .reportCategory input:checked + label:after {
        content:'';
        width: 0;
        height: 0;
        border-left: 5px solid black;
        border-right: 5px solid black;
        border-top: 5px solid black;
        position:absolute;
        right:10px;
        top:calc(50% - 2.5px);
        pointer-events:none;
        z-index:3;
    }

    .reportCategory  input:checked + label:before {
        position:absolute;
        right:0;
        height: 40px;
        width: 40px;
        content: '';
        background:white;
        color: black;
    }
    .report-item-box {
        width: 600px;
        height: 50px;
        margin: 20px auto;
        display: flex;
        text-align: center;
        font-size: 20px;
        box-sizing:border-box;

    }
    .report-title {
        width: 180px;
        font-weight: 900;
    }
    #report-content {
        width: 100%;
        height: 250px;
        resize: none;
    }
    #report-cancel{
        width: 30px;
        height: 30px;
        cursor: pointer;
    }
</style>
<body>
<script>
    $(function (){
        $('#modalWrapReport').css("display", "none");
    });
    $('.dropdown-el').click(function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).toggleClass('expanded');
        $('#'+$(e.target).attr('for')).prop('checked',true);
    });
    $(document).click(function() {
        $('.dropdown-el').removeClass('expanded');
    });
</script>
<div id="modalWrapReport">
    <div class="report_content">
        <div style="width:870px; display: flex; text-align: center; align-items: center">
            <h1 style="margin-left: 5%;">신고</h1>
            <img style="margin-left: 70%" id="report-cancel" onclick="displayNoneReport()"
                 src="https://cdn.icon-icons.com/icons2/1524/PNG/512/x_106506.png">
        </div>
        <br><br>
        <div style="border:1px solid black; width: 750px; height: 500px; border-radius: 10px; margin: auto">
            <div class="report-item-box">
                <div class="report-title">신고자</div>
                <div>${sessionScope.loginUser.userName}</div>
            </div>
            <div class="report-item-box">
                <div class="report-title">신고 받은 사람</div>
                <div id="reported-user"></div>
                <input type="hidden" id="reported-userNo" value="">
            </div>
            <div class="report-item-box">
                <div class="report-title">신고 카테고리</div>
                <div class="reportCategory" tabindex="1">
                    <input class="selectopt" name="test" type="radio" id="opt1" value="타인 비방 또는 음해" checked>
                    <label for="opt1" class="reportOption">타인 비방 또는 음해</label>
                    <input class="selectopt" name="test" type="radio" id="opt2" value="동일한 글 여러번 작성">
                    <label for="opt2" class="reportOption">동일한 글 여러번 작성</label>
                    <input class="selectopt" name="test" type="radio" id="opt3" value="허위사실 유포">
                    <label for="opt3" class="reportOption">허위사실 유포</label>
                    <input class="selectopt" name="test" type="radio" id="opt4" value="권리 침해">
                    <label for="opt4" class="reportOption">권리침해</label>
                    <input class="selectopt" name="test" type="radio" id="opt5" value="개인정보 유출">
                    <label for="opt5" class="reportOption">개인정보 유출</label>
                    <input class="selectopt" name="test" type="radio" id="opt6" value="게시판에 맞지 않는 게시글">
                    <label for="opt6" class="reportOption">게시판에 맞지 않는 게시글</label>
                    <input class="selectopt" name="test" type="radio" id="opt7" value="성적 수치심이나 불쾌감 유발">
                    <label for="opt7" class="reportOption">성적 수치심이나 불쾌감 유발</label>
                    <input class="selectopt" name="test" type="radio" id="opt8" value="계약 불이행">
                    <label for="opt8" class="reportOption">계약 불이행</label>
                    <input class="selectopt" name="test" type="radio" id="opt9" value="기타">
                    <label for="opt9" class="reportOption">기타</label>
                </div>
            </div>
            <div class="report-item-box">
                <div class="report-title">신고 내용</div>
                <div style="width: 400px">
                    <textarea id="report-content"></textarea>
                </div>
            </div>
        </div>
        <div style="width: 80%; margin:30px auto; align-items: center; text-align: center">
            <button class="meetgo-btn" onclick="sendReport()" style="width: 200px; height: 40px;">신고하기</button>
            <button class="meetgo-btn meetgo-red" style="width: 200px; height: 40px;" onclick="displayNoneReport()">취소하기</button>
        </div>
    </div>
</div>

<script>
    function showReportModal(reportedMember){
        $('#modalWrapReport').css("display", "block");
        $('#reported-user').text(reportedMember);
    }
    function displayNoneReport() {
        $('#modalWrapReport').css("display", "none");
    }
    let modal = document.getElementById('modalWrapReport');
    window.addEventListener('click', (e) => {
        e.target == modal ? $('#modalWrapReport').css("display", "none") : false;
    });
    
    function sendReport(){
        if(${sessionScope.loginUser eq null}){
            alert("로그인 후 이용 가능합니다.");
            return;
        }
        if (!confirm("정말 신고하시겠습니까?")) return;
        let reportUser = ${sessionScope.loginUser.userNo};
        let reportCategory = $('.selectopt').val();
        let reportedUser = $('#reported-userNo').val();
        let reportContent = $('#report-content').val();
        $.ajax({
            url : "insertReport",
            method : "post",
            dataType:"json",
            headers: {
                "Content-Type":"application/json"  //전달하는 데이터가 JSON형태임을 알려줌
            },
            data : JSON.stringify({
                reportUser : reportUser,
                reportCategory : reportCategory,
                reportedUser : reportedUser,
                reportContent : reportContent
            }),
            success : function (result){
                alert("신고 완료!");
                $('#modalWrapReport').css("display", "none");
            },
            error : function (){
                console.log("신고 실패");
            }
        })
    }
</script>
</body>
</html>
