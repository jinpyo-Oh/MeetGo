<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>서비스 카테고리</title>
</head>
<style>
    #modalServiceCategory {
        position: fixed; /* Stay in place */
        z-index: 99; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
		display: none;
    }

    .service_content {
        width: 40%;
        height: 90%;
        margin: 2% auto 0 auto;
        padding: 30px 30px;
        border: 1px solid black;
        background-color: #fff;
        box-sizing: border-box;
        box-shadow: 5px 5px 20px 5px #313131;
        overflow: auto; /* Enable scroll if needed */
    }

    .service_content::-webkit-scrollbar {
        width: 10px;
    }

    .service_content::-webkit-scrollbar-thumb {
        background-color: #808080;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }

    .service_content::-webkit-scrollbar-track {
        background-color: #fdfdfd;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
    }

    .service_content p {
        margin: 0;
    }

    #modalWrapEstEnroll h4 {
        margin: 30px 0 0 30px;
    }

    .service-list-area {
        padding: 10px 20px;
        width: 90%;
        margin: 50px auto auto;
        box-sizing: border-box;
    }

    .service-big-category {
        width: 100%;
        height: 50px;
        background-color: #2A8FF7;
        box-sizing: border-box;
        border-left: 1px solid #1673d1;
        border-right: 1px solid #1673d1;
        border-bottom: 1px solid #1673d1;
		color: whitesmoke;
		font-size: 20px;
        padding: 10px;
    }
	.service-small-category{
        width: 100%;
        height: 50px;
        background-color: white;
        box-sizing: border-box;
        border-left: 1px solid black;
        border-right: 1px solid black;
        border-bottom: 1px solid black;
        color: black;
        font-size: 20px;
        padding: 10px;
	}
    .service-small-category:hover{
        cursor: pointer;
        background-color: lightgray;
		
	}
    .service-big-category:hover {
        cursor: pointer;
        background-color: #1673d1;
    }
</style>
<body>
<script>
    $(function () {
        selectAllCategory();
        
    })
</script>
<div id="modalServiceCategory">
	<div class="service_content">
		<h2>서비스 추가</h2>
		<div class="service-list-area" role="tablist" aria-multiselectable="true">
		</div>
		<script>
			
            function selectAllCategory() {
                $('.service-list-area').empty();
                $.ajax({
                    url: "selectAllServiceCategory.me",
                    method: "get",
                    data: {},
                    success: function (data) {
                        console.log(data);
                       
                        for (let i = 0; i < data.length; i++) {
                            let big = data[i].categoryBig;
                            if (big.categoryBigName == "전체") continue;
                            let content = '<div class="service-big-category ' + (i == 1 ? 'border-top' : '') + '" data-toggle="collapse" href="#collapse' + big.categoryBigNo + '" aria-expanded="false">' + big.categoryBigName + '</div>';
                            content += '<div id="collapse' + big.categoryBigNo + '" class="collapse" data-parent=".service-list-area">';
                            for (let j = 0; j < data[i].categorySmalls.length; j++) {
                                let small = data[i].categorySmalls[j];
                                content += '<div class="service-small-category" onclick="insertGosuService('+small.categorySmallNo+')">' + small.categorySmallName + '</div>';
                            }
                            content += '</div>';
                            $('.service-list-area').append(content);
                        }
                       
                    },
                    error: function () {
                        console.log("전체 서비스 조회 실패")
                    }
                })
            }
            function insertGosuService(categorySmallNo){
                console.log(categorySmallNo);
                $.ajax({
                    url: "insertGosuService.me",
                    method: "get",
                    data : {
                        categorySmallNo : categorySmallNo
                    },
                    success : function (data) {
                        console.log(data);
                        displayNone();
                        selectAllService();
                    },
                    error : function (){
                        console.log("서비스 추가 실패");
                    }
                })
            }
		</script>
	</div>
</div>

<script>
    function displayNone() {
        $('#modalServiceCategory').css("display", "none");
    }

    let serviceModal = document.getElementById('modalServiceCategory');

    window.addEventListener('click', (e) => {
        e.target == serviceModal ? $('#modalServiceCategory').css("display", "none") : false;
    });
</script>
</body>
</html>