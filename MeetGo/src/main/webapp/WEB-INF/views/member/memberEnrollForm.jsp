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

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <form action="insert.me" method"post">
        <div class="main">
        <h1>회원가입</h1>
        <h3>믿고회원이 되어 다양한 혜택을 경험해보세요!!</h3>
        
        

        <p class="name1">아이디*</p>
        <input class="name" type="text" align="center" placeholder="아이디를 입력해주세요." required>

        <p class="name1">비밀번호*</p>
        <input class="pass" type="password" placeholder="영문+숫자 조합 8자리 이상 입력해주세요." required>

        <p class="name1">비밀번호 확인*</p>
        <input class="pass" type="password" placeholder="비밀번호재입력" required>

        <p class="name1">이름*</p>
        <input class="name" type="text" placeholder="이름(실명)을 입력해주세요." required>
        <p class="name1">성별*</p>
        <div class="select">
        <input type="radio" id="select" name="shop" required><label for="select">남자</label>
        <input type="radio" id="select2" name="shop" required><label for="select2">여자</label>
        </div>
        <p class="name1">주소*</p>
        <input class="name" type="text" placeholder="주소를 입력해주세요." required>
        <input class="name" type="text" placeholder="상세주소" required>

        <p class="name1">전화번호</p>
        <input class="name" type="text" placeholder="전화번호 입력('-'제외 11자리 입력)">

        <p class="name1">이메일*</p>
        <input class="awqs" type="text" placeholder="이메일주소" id="email-id" required>@
        <input class="awqss" type="text" id="manualEmailInput" required>
        <select class="awqs" id="manualEmail" required>
            <option id="emailDomain" value="" disabled selected>선택</option>
            <option value="meetgo.com">meetgo.com</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="직접입력">직접입력</option>
        </select>

        <p class="name1">생년월일</p>
        <form>
            <p><input type="date" class="awq"></p>
           
          </form>
        <div class="tq">
        <button type="submit" class="wqq">가입완료</button>
        <button class="wqq1">가입취소</button>
        </div>
        <a class="ee" href="" style="color:#737373;">고수로 가입하시나요?</a>
    </div>
</form>

<script>
     $(document).ready(function() {
        $("#manualEmailInput").prop("disabled", true);

        $("#manualEmail").change(function() {
            console.log($(this).val());
            if ($(this).val() === "직접입력") {
                $("#manualEmailInput").prop("disabled", false);
                
            } else {
                $("#manualEmailInput").prop("disabled", true);
                $("#manualEmailInput").val($(this).val());
            }
        });

        $(".awqs").on("input", function() {
            var emailInput = $(this).val();
            var isValidEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput);
            
            if (!isValidEmail) {
                $(this).css("border-color", "red");
            } else {
                $(this).css("border-color", "rgba(0, 0, 0, 0.1)");
            }
        });
    });
</script>
</body>
</html>