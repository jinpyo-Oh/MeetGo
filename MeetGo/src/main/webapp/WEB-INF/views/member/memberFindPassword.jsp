<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        
        .main {
            background-color: #FFFFFF;
            width: 600px;
            height: 550px;
            margin: 5em auto;
            box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .pass {
            width: 76%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px 20px;
            border: none;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border-radius: 5px;
            margin-top: 10px;
        }

        .text {
            color: grey;
            margin-bottom: 20px;
        }

        .email {
            background-color: #00C7AE;
            color: white;
            border: none;
            height: 50px;
            width: 76%;
            max-width: 500px;
            margin: 10px auto;
            border-radius: 5px;
        }

        .center-content {
            text-align: center;
        }

        .check {
            background-color: #00C7AE;
            color: white;
            border: none;
            height: 50px;
            width: 76%;
            max-width: 500px;
            text-align: center;
            align-items: center;
            border-radius: 5px;
            margin-top: 10px;
        }
        .checkinput {
        	width: 76%;
            color: rgb(38, 50, 56);
            font-size: 14px;
            letter-spacing: 1px;
            background: white;
            padding: 10px 20px;
            border: none;
            outline: none;
            box-sizing: border-box;
            border: 2px solid rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            border-radius: 5px;
            margin-top: 10px;
            
        }
        #checkinput {
        	display:none;
        }
        .back-btn {
        	padding : 10px 120px;
        	background-color: #00C7AE;
        	border-style: none;
        	border-radius: 10px;
        	color: white;
        	
        }
    </style>
</head>
<body>
    <h1 style="text-align: center;">비밀번호 찾기</h1>

    <div class="main">
        <div class="main-info">
            <h3 class="text2">가입한 이메일 주소를 입력해주시요.</h3>
        </div>
        <input type="email" id="email" name="email" placeholder="example@Meetgo" class="pass">
        <p class="text">가입하신 이메일 주소를 입력해주시면<br>
            새로운 비밀번호를 설정 가능한 링크를 보내드립니다.</p>
        <div class="center-content">
            <button class="email" id="cert" onclick="cert();">이메일 전송하기</button>
        </div>
		
		<div class="backhome">
			<a class="back-btn" href="loginForm.me">홈으로</a>
		</div>
       
    </div>
    
    <script>
        function cert() {
            $.ajax({ 
                url : "cert.do",
                type : "post",
                data : {email : $("#email").val()},
                success: function(result) {
                    alert(result);
                    // 인증번호 발급 후 인증 이메일 입력창 요소를 비활성화
                    $("#email").attr("readonly", true);
                    $("#cert").attr("disabled", true);
         
                },
                error : function() {
                    console.log("인증번호 발급 실패");
                }
            });
         
        }
    </script>
</body>
</html>
