<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>계약서</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
    #modalWrapDetail {
        position: fixed; /* Stay in place */
        z-index: 99; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        display: none;
    }

    .estimate_content {
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

    #est-cancel {
        width: 25px;
        height: 25px;
        cursor: pointer;
    }

    .estimate_content::-webkit-scrollbar {
        width: 10px;
    }

    .estimate_content::-webkit-scrollbar-thumb {
        background-color: #808080;
        border-radius: 10px;
        background-clip: padding-box;
        border: 2px solid transparent;
    }

    .estimate_content::-webkit-scrollbar-track {
        background-color: #fdfdfd;
        border-radius: 10px;
        box-shadow: inset 0px 0px 5px white;
    }

    .estimate_content p {
        margin: 0;
    }

    .form__group {
        position: relative;
        padding: 20px 0 0;
        width: 80%;
        margin: auto;
        margin-bottom: 20px;
    }

    .form__field {
        font-family: inherit;
        width: 100%;
        height: 50px;
        border: none;
        border-bottom: 2px solid #9b9b9b;
        outline: 0;
        font-size: 20px;
        color: black;
        padding: 7px 0 2px 0;
        background: transparent;
        transition: border-color 0.2s;
    }

    .form__field::placeholder {
        color: transparent;
    }

    .form__field:placeholder-shown ~ .form__label {
        font-size: 20px;
        cursor: text;
        top: 20px;
    }

    .form__label {
        position: absolute;
        top: 0;
        display: block;
        transition: 0.2s;
        font-size: 20px;
        color: black;
        pointer-events: none;
    }

    .form__field:focus {
        padding-bottom: 6px;
        font-weight: 700;
        border-width: 3px;
        border-image: linear-gradient(to right, #116399, #38caef);
        border-image-slice: 1;
    }

    .form__field:focus ~ .form__label {
        position: absolute;
        top: 0;
        display: block;
        transition: 0.2s;
        font-size: 20px;
        color: black;
        font-weight: 700;
    }

    /* reset input */
    .form__field:required, .form__field:invalid {
        box-shadow: none;
    }

    .est-header {
        width: 95%;
        margin-left: 5%;
        height: 100px;
        text-align: center;
        display: flex;
        justify-content: space-between;
    }

    #search-addr {
        width: 30%;
        height: 50px;
        margin-top: 20px;
    }

    #modalWrap hr {
        width: 95%;
        border: 1px solid lightgray;
        margin-top: 50px;
    }

    #modalWrap h4 {
        margin-top: 30px;
        margin-left: 5%;
    }

    #estContent {
        resize: none;
    }

    .est-button {
        width: 80%;
        margin: auto;
        text-align: center;
        align-items: center;
        margin-top: 50px;
    }

    .est-button button {
        width: 40%;
        box-sizing: border-box;
        height: 50px;
    }

    .contract_user {
        display: flex;
        width: 80%;
        margin: auto;
        align-items: center;
    }

    .est-card {
        margin: auto;
    }

    .est-card-img img {
        width: 120px;
        height: 120px;
        border-radius: 60px;
    }

    .est-card-info {
        text-align: center;
        color: black;
        font-size: 20px;
    }

    #deal-icon {
        width: 80px;
        height: 80px;
    }

    .card-style {
        border: 1px solid lightgray;
        border-radius: 10px;
        background-color: whitesmoke;
        margin-bottom: 20px;
    }

    .selected-category {
        position: relative;
        display: flex;
        flex-wrap: wrap;
        pointer-events: none;
        border-radius: 0.5rem;
        background-color: #EEE;
        margin: auto;
        box-sizing: border-box;
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.06);
        padding: 0.25rem;
        width: 90%;
        font-size: 20px;
    }

    .selected-category .est-category {
        flex: 1 1 auto;
        text-align: center;
    }

    .est-category {
        margin: 0;
    }
    .est-detail-button {
        width: 80%;
        margin: auto;
        text-align: center;
        align-items: center;
        margin-top: 50px;
    }
    .est-detail-button button {
        width: 40%;
        box-sizing: border-box;
        height: 50px;
    }
    .selected-category .est-category input {
        display: none;
    }

    .selected-category .est-category .category-name {
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 0.5rem;
        border: none;
        padding: .5rem 0;
        color: rgba(51, 65, 85, 1);
        transition: all .15s ease-in-out;
    }

    .selected-category .est-category input:checked + .category-name {
        background-color: #fff;
        font-weight: 600;
    }
	.event-block {
        pointer-events: none;
	}
	#modalWrapDetail h4 {
		margin : 30px 0 0 30px;
	}
</style>
<body>
<script>
    function estDetailInfo(estNo) {
        $.ajax({
            url: "selectEst",
            data: {
                estNo: estNo
            },
            success: function (data) {
                let gosuNo = data.gosuNo;
                let estService = data.estService;
                selectAllCategory(gosuNo, estService);
                $('#confirmEstPrice').val(data.estPrice);
                $('#confirmStartDate').val(data.startDate);
                $('#confirmEndDate').val(data.endDate);
                $('#confirmAddress').val(data.estAddress);
                $('#confirmEstContent').val(data.estContent);
                $('#confirmEstNo').val(data.estNo);
                $('#confirmTitle').val(data.estTitle);
                $('#confirmUserNo').val(data.userNo);
                insertEstBtn(data.status, data.estNo);
            },
            error: function () {
                console.log("견적서 상세조회 실패")
            }
        })
    }


    function selectAllCategory(gosuNo, selectedCategory) {
        $.ajax({
            url: "selectAllCategory",
            data: {
                gosuNo: gosuNo
            },
            success: function (data) {
                $(".selected-category").empty();
                for (let i = 0; i < data.length; i++) {
                    let estCategory =
                        '<label class="est-category">' +
                        '<input type="radio" name="est-category" class="est-service" value="' + data[i].categorySmallNo + '" ' +
                        (data[i].categorySmallNo == selectedCategory ? 'checked=""' : '') + '>' +
                        '<span class="category-name">' + data[i].categorySmallName + '</span>' +
                        '</label>';
                    $('.selected-category').append(estCategory);
                }
            },
            error: function () {

            }
        })
    }
</script>
<input type="hidden" id="confirmTitle" value="">
<input type="hidden" id="confirmUserNo" value="">
<input type="hidden" id="confirmEstNo" value="">
<div id="modalWrapDetail">
	<div class="estimate_content">
		<div class="est-header">
			<h1>계약서 상세보기</h1>
			<img id="est-cancel" onclick="displayNone()"
				 src="https://cdn.icon-icons.com/icons2/1524/PNG/512/x_106506.png">
		</div>
		<div class="card-style">
			<h4>서비스 종류</h4><br>
			<div class="selected-category">
			</div>
			<br>
		</div>
		<div class="card-style event-block">
			<h4>금액</h4>
			<div class="form__group field">
				<input type="text" class="form__field" id="confirmEstPrice" name="estPrice" placeholder="Name"
					   oninput="formatNumber()" required>
				<label for="confirmEstPrice" class="form__label">책정 금액</label>
			</div>
		</div>
		<div class="card-style event-block">
			<h4>계약 날짜</h4>
			<div class="form__group field">
				<input type="text" class="form__field" id="confirmStartDate" name="startDate" required>
				<label for="confirmStartDate" class="form__label"></label>
			</div>
			<div class="form__group field">
				<input type="text" class="form__field" id="confirmEndDate" name="endDate" placeholder="Name" required>
				<label for="confirmEndDate" class="form__label">계약 이행일</label>
			</div>
		</div>
		<div class="card-style event-block">
			<h4>주소</h4>
			<div class="form__group field" style="display: flex">
				<input type="text" class="form__field" id="confirmAddress" placeholder="주소" disabled required>
				<label for="confirmAddress" class="form__label">주소</label>
			</div>
			<br>
		</div>
		<div class="card-style event-block">
			<h4>상세 설명</h4>
			<div class="form__group field">
				<textarea type="text" class="form__field" id="confirmEstContent" name="estContent"
						  placeholder="상세 설명"></textarea>
				<p>서비스 설명, 수행 지역, 시간 등을 설명해 주세요</p>
			</div>
			<script>
                const DEFAULT_HEIGHT1 = 5; // textarea 기본 height
                const $textarea1 = document.querySelector('#estContent');
                $textarea1.oninput = (event) => {
                    const $target = event.target;

                    $target.style.height = 0;
                    $target.style.height = DEFAULT_HEIGHT1 + $target.scrollHeight + 'px';
                };
			</script>
		</div>
		<div class="est-detail-button">
			<script>
				function insertEstBtn(status, estNo){
                    $('.est-detail-button').empty();
                    let estBtn = "";
                    if (status == 2) {
                        estBtn += '<button class="meetgo-btn" id="confirm-btn" value="" onClick="changeEstStatus('+estNo +', 3); displayNone()">확정하기</button>';
					} else if (status == 3) {
                        estBtn += '<button class="meetgo-btn" value="" onClick="EstPayment('+estNo+'); displayNone()">결제하기</button>'
					}
                    estBtn += '<button class="meetgo-btn meetgo-red"  onClick="displayNone()">닫기</button>';
                    $('.est-detail-button').append(estBtn);
				}
			</script>
			
		</div>
	</div>
</div>

<script>
    function EstPayment(estNo) {
        $.ajax({
            url: 'kakaopay.me',
            method : 'post',
            dataType: 'json',
            data : {
                userNo : $('#confirmUserNo').val(),
                estTitle : $('#confirmTitle').val(),
                estPrice : $('#confirmEstPrice').val(),
                estNo : estNo
            },
            success: function(data){
                console.log(data);
            },
            error: function(){
                alert("카카오페이 ajax 실패");
            }
        });
    }

    function displayNone() {
        $('#modalWrapEstEnroll').css("display", "none");
        $('#modalWrapDetail').css("display", "none");
    }

    let modalWrapDetail = document.getElementById('modalWrapDetail');

    window.addEventListener('click', (e) => {
        e.target == modalWrapDetail ? $('#modalWrapDetail').css("display", "none") : false;
    });

</script>
</body>
</html>
