<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>견적서</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
    #modalWrap {
        position: fixed; /* Stay in place */
        z-index: 99; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        /*display: none;*/
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
        width: 100%;
        height: 100px;
        text-align: center;
    }
	#search-addr {
		width: 30%;
		height: 40px;
	}
	#modalWrap hr {
		width: 90%;
		border: 1px solid lightgray;
	}
</style>
<body>

<div id="modalWrap">
	
	<div class="estimate_content">
		<div class="est-header">
			<h2>견적서</h2>
		</div>
		
		<div class="form__group field">
			<input type="text" class="form__field" id="estPrice" name="estPrice" placeholder="Name" oninput="formatNumber()" required>
			<label for="estPrice" class="form__label">책정 금액</label>
		</div>
		<hr>
		<div class="form__group field">
			<input type="date" class="form__field" id="startDate" name="startDate">
			<label for="startDate" class="form__label">계약 이행일</label>
		</div>
		<hr>
		<div class="form__group field" style="display: flex">
			<input type="text" class="form__field" id="sample6_address" placeholder="주소" disabled>
			<label for="sample6_address" class="form__label">주소</label>
		</div>
		<div style="display: flex; width: 80%; margin: auto">
			<div class="form__group field" style="display: flex">
				<input type="text" class="form__field" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" >
				<label for="sample6_detailAddress" class="form__label">상세주소</label>
			</div>
			<input type="button" class="meetgo-btn" id="search-addr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</div>
		<hr>
		
		
		
		
		<div class="est-button">
			<button class="meetgo-btn" onclick="displayNone()">작성하기</button>
			<button class="meetgo-btn" onclick="displayNone()">취소하기</button>
		
		</div>
	
	</div>
</div>

<script>
    function displayNone() {
        $('#modalWrap').css("display", "none");
    }

    let modal = document.getElementById('modalWrap');

    window.addEventListener('click', (e) => {
        e.target == modal ? $('#modalWrap').css("display", "none") : false;
    });

    function formatNumber() {
        // Get the input element
        let inputElement = document.getElementById('estPrice');

        // Remove non-numeric characters
        let inputValue = inputElement.value.replace(/[^0-9]/g, '');

        // Format the number with commas every 3 digits
        let formattedValue = inputValue.replace(/\B(?=(\d{3})+(?!\d))/g, ',');

        // Update the input value with the formatted number
        inputElement.value = formattedValue;

        // Add "원" at the end
        if (formattedValue !== '') {
            inputElement.value += '원';
        }
    }
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }


                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                
            }
        }).open();
    }
</script>
</body>
</html>
