<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>계약서</title>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
    #modalWrapEstEnroll {
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
	#est-cancel{
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
		margin-top : 30px;
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
	.contract_user{
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
	
	#deal-icon{
		width: 80px;
		height: 80px;
	}
	.card-style {
		border: 1px solid lightgray;
		border-radius: 10px;
		background-color: whitesmoke;
		margin-bottom: 20px;
	}
	.category-input {
		position: relative;
		display: flex;
		flex-wrap: wrap;
		border-radius: 0.5rem;
		background-color: #EEE;
		margin: auto;
		box-sizing: border-box;
		box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.06);
		padding: 0.25rem;
		width: 90%;
		font-size: 20px;
	}

	.category-input .est-category {
		flex: 1 1 auto;
		text-align: center;
	}
	.est-category {
		margin: 0;
	}
	.category-input .est-category input {
		display: none;
	}

	.category-input .est-category .category-name {
		display: flex;
		cursor: pointer;
		align-items: center;
		justify-content: center;
		border-radius: 0.5rem;
		border: none;
		padding: .5rem 0;
		color: rgba(51, 65, 85, 1);
		transition: all .15s ease-in-out;
	}

	.category-input .est-category input:checked + .category-name {
		background-color: #fff;
		font-weight: 600;
	}
	
</style>
<body>

<div id="modalWrapEstEnroll">
	
	<div class="estimate_content">
		<div class="est-header">
			<h1>계약서</h1>
			<img id="est-cancel" onclick="displayNone()" src="https://cdn.icon-icons.com/icons2/1524/PNG/512/x_106506.png">
		</div>
		<script>
			$(function (){
				$.ajax({
					url : "selectAllCategory",
					data : {
						gosuNo : ${sessionScope.loginUser.userNo}
					},
					success : function (data) {
						console.log(data);
						for (let i = 0; i < data.length; i++) {
							let estCategory =
									'<label class="est-category">' +
										'<input type="radio" name="est-category" class="est-service" value="'+data[i].categorySmallNo+'" checked="">' +
										'<span class="category-name">'+data[i].categorySmallName+'</span>' +
									'</label>';
							$('.category-input').append(estCategory);
						}
					},
					error : function () {

					}
				})
			});
		</script>
		<div class="card-style">
			<h4>서비스 종류</h4><br>
			<div class="category-input">
			</div>
			<br>
		</div>
		<div class="card-style">
			<h4>금액</h4>
			<div class="form__group field">
				<input type="text" class="form__field" id="estPrice" name="estPrice" placeholder="Name" oninput="formatNumber()" required>
				<label for="estPrice" class="form__label">책정 금액</label>
			</div>
		</div>
		<div class="card-style">
			<h4>계약 날짜</h4>
			<div class="form__group field">
				<input type="date" class="form__field" id="startDate" name="startDate" required>
				<label for="startDate" class="form__label"></label>
			</div>
			<div class="form__group field">
				<input type="text" class="form__field" id="endDate" name="endDate" placeholder="Name" required>
				<label for="endDate"  class="form__label">계약 이행일</label>
				<p>ex) 계약일로부터 x일</p>
			</div>
		</div>
		<div class="card-style">
			<h4>주소</h4>
			<div class="form__group field" style="display: flex">
				<input type="text" class="form__field" id="address" placeholder="주소" disabled required>
				<label for="address" class="form__label">주소</label>
			</div>
			<div style="display: flex; width: 80%; margin: auto">
				<div class="form__group field" style="display: flex; margin: auto; text-align: center;align-items: center">
					<input type="text" class="form__field" id="detailAddress" name="detailAddress" placeholder="상세주소" >
					<label for="detailAddress" class="form__label">상세주소</label>
				</div>
				<input type="button" class="meetgo-btn" id="search-addr" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			</div>
			<br>
		</div>
		<div class="card-style">
			<h4>상세 설명</h4>
			<div class="form__group field" >
				<textarea type="text" class="form__field" id="estContent" name="estContent" placeholder="상세 설명"></textarea>
				<p>서비스 설명, 수행 지역, 시간 등을 설명해 주세요</p>
			</div>
			<script>
				const DEFAULT_HEIGHT = 5; // textarea 기본 height
				const $textarea = document.querySelector('#estContent');
				$textarea.oninput = (event) => {
					const $target = event.target;
	
					$target.style.height = 0;
					$target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
				};
			</script>
		</div>
		<div class="est-button">
			<button class="meetgo-btn" onclick="insertEstimate()">작성하기</button>
			<button class="meetgo-btn" onclick="displayNone()">취소하기</button>
		</div>
	</div>
</div>

<script>
	function insertEstimate(){
        let estService = $('.est-service').val();
        let estPrice = $('#estPrice').val();
        let startDate = $('#startDate').val();
        let endDate = $('#endDate').val();
        let estAddress = $('#address').val() + " " + $('#detailAddress').val();
        let estContent = $('#estContent').val();

        $.ajax({
			url : "insertEstimate",
			method : "post",
            dataType:"json",
            headers: {
                "Content-Type":"application/json"  //전달하는 데이터가 JSON형태임을 알려줌
            },
			data : JSON.stringify({
                chatroomNo : chatroomNo,
                estService : estService,
                estPrice : estPrice,
                startDate :  startDate,
                endDate :  endDate,
                estAddress :  estAddress,
                estContent :  estContent,
                gosuNo : ${sessionScope.loginUser.userNo},
				userNo : userNo
			}),
			success:function (data){
                console.log(data);
                estNo = data;
                displayNone();
                sendMessage('E');
			},
			error : function (){
                console.log("계약서 저장 실패");
			}
		});
	}
    function displayNone() {
        $('#modalWrapDetail').css("display", "none");
        $('#modalWrapEstEnroll').css("display", "none");
    }

    let modal = document.getElementById('modalWrapEstEnroll');

    window.addEventListener('click', (e) => {
        e.target == modal ? $('#modalWrapEstEnroll').css("display", "none") : false;
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
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>
