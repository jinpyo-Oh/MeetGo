<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <style>
       

        
        .main {
            background-color: #FFFFFF;
            width: 600px;
            margin: 7em auto;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            padding: 50px;
            text-align: center; 
        }

       
        .name,
        .pass,
        .awqs,
        .awqss,
        .awqs + .awq,
        .awqs + .awq + .awq,
        .awqss + .awq,
        .awqss + .awq + .awq 
        {
            width: 76%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 5px 20px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            margin: 10px auto; 
        }

        .name1 {
            font-size: 15px;
            margin-left: 46px;
            font-weight: bolder;
            text-align: left; 
            
        }

       
        .awq {
            width: 76%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;
            margin: 10px 10px 0px 10px;
            
        }

        .awqs {
            width: 25%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;

        }

        .awqss {
            width: 25%;
            padding: 10px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            box-sizing: border-box;
            color: #737373;
            margin-bottom: 10px;
            background-color: rgb(230, 230, 230);
        }
        .wqq {
            background-color: skyblue;
            border-radius: 5px;
            box-sizing: border-box;
            border:none;
            margin: 30px;
            padding: 10px 40px;
            color: #FFFFFF;
        }
        .wqq1 {
            background-color: bisque;
            border-radius: 5px;
            box-sizing: border-box;
            border:none;
            margin: 30px;
            padding: 10px 40px;
            color: #FFFFFF;
            
        }
        input[type="radio"] {
            width: 20px;

        }
        .select {
        padding: 15px 10px;
        }
        .select input[type=radio]{
            display: none;
        }
        .select input[type=radio]+label{
            display: inline-block;
            cursor: pointer;
            height: 24px;
            width: 200px;
            border: 1px solid #333;
            line-height: 24px;
            text-align: center;
            font-weight:bold;
            font-size:13px;
        }
        .select input[type=radio]+label{
            background-color: #fff;
            color: #333;
        }
        .select input[type=radio]:checked+label{
            background-color: #333;
            color: #fff;
        }
        .address-btn {
            border-style: none;
            background-color: rgba(0, 0, 0, 0.1) ;
            color:#FFFFFF;
            padding :  10px 20px;
            border-radius: 10px;

        }
        .address-input {
            width: 49%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 5px 20px;
            border: 2px solid rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            height: 50px;
            margin: 10px auto; 
        }

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<script>
        function emailCheck(){
            $.ajax({
                url: "emailCheck.me",
                type: "get",
                data: {
                    userEmail:  $('#email-id').val() ,
                    userEmail2: $('#manualEmailInput').val()
                },
                success: function (result) {
                    if (result === "NNNNN") {
                        $("#checkResult3").show();
                        $("#checkResult3").css("color", "red").text("중복된 이메일이 존재합니다. 다시 입력해주세요.");
                        $("#submitBtn").prop("disabled", true);
                    } else {
                        $("#checkResult3").show();
                        $("#checkResult3").css("color", "green").text("사용 가능한 이메일입니다.");
                        $("#submitBtn").prop("disabled", false);
                    }
                },
                error: function () {
                    console.log("이메일 중복 체크용 AJAX 통신 실패!");
                }
            });
        }
	</script>
    <form action="insert.me" method="post">
        <div class="main">
	        <h1>회원가입</h1>
	        <h3>믿고회원이 되어 다양한 혜택을 경험해보세요!!</h3>

	        <p class="name1">아이디*</p>
	        <input class="name" name="userId" type="text" id="userId" align="center" placeholder="아이디를 입력해주세요." required> 
	        <div id="checkResult" style="font-size : 0.8em; display : none;">
	         </div>
	
	        <p class="name1">비밀번호*</p>
	        <input class="pass" type="password" name="userPwd" id="userPwd" placeholder="영문+숫자 조합 6자리 이상 입력해주세요." required>
	  		 <div id="checkResult1" style="font-size : 0.8em; display : none;">
	         </div>
	
	         <p class="name1">비밀번호 확인*</p>
	         <input class="pass" type="password" name="checkPwd" id="checkPwd" placeholder="비밀번호재입력" required>
	     	 <div id="checkResult2" style="font-size: 0.8em; display: none;"></div>

	
	        <p class="name1">이름*</p>
	        <input class="name" type="text" name="userName" id="userName" placeholder="이름(실명)을 입력해주세요." required>
	        <p class="name1">닉네임*</p>
	        <input class="name" type="text" name="userNickname" id="userNickname" placeholder="별명을 입력해주세요." required>
	        <div id="checkResult4" style="font-size: 0.8em; display: none;"></div>
	        
	        <p class="name1">성별*</p>
	        <div class="select">
                <input type="radio" id="select" name="userGender" value="M"required><label for="select">남자</label>
                <input type="radio" id="select2" name="userGender" value="F" required><label for="select2">여자</label>
	        </div>

            <p class="name1">위치*</p>
            <div class="address">
                <input class="name"type="text" id="sample6_address" name="address1" placeholder="주소"><br>
                <input class="address-input"type="text" id="sample6_detailAddress" placeholder="상세주소" name="address2">
                <input class="address-btn"type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>

            </div>

	        <p class="name1">전화번호*</p>
	        <input class="name" type="text" id="phone" name="userPhone" placeholder="전화번호 입력('-'제외 11자리 입력)">
	
	        <p class="name1">이메일*</p>
                <input class="awqs" type="text" placeholder="이메일주소" id="email-id" name="userEmail" required>@
                <input class="awqss" type="text" id="manualEmailInput"  name="userEmail2" required>
                <select class="awqs" id="manualEmail" name="domain" required>
                    <option id="emailDomain" value="" disabled selected>선택</option>
                    <option value="meetgo.com">meetgo.com</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
	        </select>
			<div id="checkResult3" style="font-size: 0.8em; display: none;"></div>
			
	        <div class="tq">
	            <button type="submit" class="wqq">가입완료</button>
	            <button class="wqq1" onclick="goBack()">가입취소</button>
	        </div>
    	</div>
</form>
<script>
function goBack() {
  window.history.back();
}
</script>
<script>

     $(document).ready(function() {
        $("#manualEmailInput").prop("disabled", true);

        $("#manualEmail").change(function() {
            if ($(this).val() === "직접입력") {
                $("#manualEmailInput").prop("disabled", false);
                
            } else {
                $("#manualEmailInput").prop("disabled", true);
                $("#manualEmailInput").val($(this).val());
            }
            emailCheck();
        });

        $(".awqs").on("input", function() {
            var emailInput = $(this).val();
            var isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput);
            
            if (!isValidEmail) {

            } else {
                $(this).css("border-color", "rgba(0, 0, 0, 0.1)");
            }
        });
    });
     
    
     
     
     
     
     $(function() {
 		
 		// 아이디를 입력받는 input 요소 객체를 변수에 담아두기
 		// (jQuery 방식으로 선택해서 담을 것)
 		// => 관례 상 변수명 앞에 $ 를 붙임
 		let $idInput = $(".main input[name=userId]");
 		
 		$idInput.keyup(function() {
 			// 단, 우선 최소 5글자 이상으로 입력되어 있을 경우에만
 			console.log($idInput);
 			// ajax 를 요청해서 중복체크를 하도록 해보자
 			if($idInput.val().length >= 3) {
 				
 				// 중복 체크 요청 보내기
 				$.ajax({
 					url : "idCheck.me",
 					type : "get",
 					data : {checkId : $idInput.val()},
 					success : function(result) {
 						
 						// console.log(result);
 						
 						if(result == "NNNNN") { // 사용 불가능
 							
 							// 빨간색 메세지 출력
 							$("#checkResult").show();
 							$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 다시 입력해 주세요.");
 							
 							// 회원가입 버튼 비활성화
 							$(".main button[type=submit]").attr("disabled", true);
 							
 						} else { // 사용 가능
 							
 							// 초록색 메세지 출력
 							$("#checkResult").show();
 							$("#checkResult").css("color", "green").text("사용 가능한 아이디입니다!");
 						
 							// 회원가입 버튼 활성화
 							$(".main button[type=submit]").attr("disabled", false);
 							
 						}
 					},
 					error : function() {
 						console.log("아이디 중복 체크용 ajax 통신 실패!");
 					}
 				});
 				
 			} else { // 5글자 미만일 때
 				
 				// 회원가입버튼 비활성화
 				$(".main button[type=submit]").attr("disabled", true);
 			
 				// 메세지 숨기기
 				$("#checkResult").hide();
 			}
 		});
 		
 	});
     
     $(function() {
    	    let $pwdInput = $(".main input[name=userPwd]");

    	    $pwdInput.keyup(function() {
    	        console.log($pwdInput.val());
    	        if ($pwdInput.val().length < 6) {
    	            // 비밀번호가 6자리 미만이면 빨간색 메시지 출력
    	            $("#checkResult1").show();
    	            $("#checkResult1").css("color", "red").text("비밀번호는 6자리 이상이어야 합니다.");

    	            // 회원가입 버튼 비활성화
    	            $(".main button[type=submit]").attr("disabled", true);
    	        } else {
    	            // 비밀번호가 6자리 이상이면 메시지 숨기고 회원가입 버튼 활성화
    	            $("#checkResult1").show();
					$("#checkResult1").css("color", "green").text("사용 가능한 비밀번호입니다!");

    	            $(".main button[type=submit]").attr("disabled", false);
    	            
    	        }
    	    });
    	});
     $(document).ready(function () {
    	    // ... (기존 코드 생략)

    	    // 비밀번호 확인 체크
    	    $("#checkPwd").on("input", function () {
    	        var password = $(".pass[name=userPwd]").val();
    	        var confirmPassword = $(this).val();

    	        if (password === confirmPassword) {
    	            // 비밀번호 일치 시 메시지 숨기고 에이젝스로 일치 여부 전송
    	            $("#checkResult2").show();
					$("#checkResult2").css("color", "green").text("비밀번호가 일치합니다!!.");

    	            // 여기에 Ajax 요청을 직접 추가하거나 필요한 동작 수행
    	            // 예시: 비밀번호 일치 시의 동작
    	            console.log("비밀번호 일치");

    	        } else {
    	            // 비밀번호 불일치 시 빨간색 메시지 출력하고 에이젝스로 불일치 여부 전송
    	            $("#checkResult2").show();
    	            $("#checkResult2").css("color", "red").text("비밀번호가 일치하지 않습니다.");

    	            // 여기에 Ajax 요청을 직접 추가하거나 필요한 동작 수행
    	            // 예시: 비밀번호 불일치 시의 동작
    	            console.log("비밀번호 불일치");

    	        }
    	    });
    	});

     $(document).ready(function () {
         $('#email-id').on('input', function () {
             emailCheck();
         });

         $('#manualEmailInput').on('input', function () {
             emailCheck();
         });
		 
        
			
		});

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

                // // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                // if(data.userSelectedType === 'R'){
                //     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                //     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                //     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                //         extraAddr += data.bname;
                //     }
                //     // 건물명이 있고, 공동주택일 경우 추가한다.
                //     if(data.buildingName !== '' && data.apartment === 'Y'){
                //         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                //     }
                //     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                //     if(extraAddr !== ''){
                //         extraAddr = ' (' + extraAddr + ')';
                //     }
                //     // 조합된 참고항목을 해당 필드에 넣는다.
                //     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                // } else {
                //     document.getElementById("sample6_extraAddress").value = '';
                // }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                // document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
     
     
     
</script>

<script>
$(function() {
	 let $nickInput = $(".main input[name=userNickname]");
	 
	 $nickInput.keyup(function() {
		
		 if($nickInput.val().length >= 1) {
			 console.log($nickInput)	;
			 $.ajax({
				 url : "nickNameCheck.me",
				 type : "get",
				 data : {nickNameCheck : $nickInput.val()},
				 success : function(result) {
					 if(result ==	 "NNNNN"){    	 							
	 					// 빨간색 메세지 출력
	 					$("#checkResult4").show();
	 					$("#checkResult4").css("color", "red").text("중복된 닉네임이 존재합니다. 다시 입력해 주세요.");
	 							
	 					// 회원가입 버튼 비활성화
	 					$(".main button[type=submit]").attr("disabled", true);
					 }else { // 사용 가능
							
							// 초록색 메세지 출력
							$("#checkResult4").show();
							$("#checkResult4").css("color", "green").text("사용 가능한 닉네임입니다!");
							
							// 회원가입 버튼 활성화
							$(".main button[type=submit]").attr("disabled", false);
							
						}
				 },
				 error : function() {
						console.log("닉네임 중복 체크용 ajax 통신 실패!");
					}
				 
			 });
		 } else { // 3글자 미만일 때
				
				// 회원가입버튼 비활성화
				$(".main button[type=submit]").attr("disabled", true);
			
				// 메세지 숨기기
				$("#checkResult4").hide();
			}
	 });
	 
});
</script>
</body>
</html>