<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>에러페이지</title>
    <style>
        .error {
            text-align: center;
        }
        h1 {
            font-size: 50px;
            color:#2A8FF7;
        }
        p {
            color: gray;
            text-align: center;
        }
        button{
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            background-color: #2A8FF7;
            color: white;

        }
       .title{
            font-size: 100px;
            color:#2A8FF7;
       }
       .ww{
       width: 200px;
        position: relative;
        top: -200px; /* Adjust this value as needed */
        margin-left: -20px;
    }
    </style>
</head>
<body>
 
    <div class="error">
        <div class="w2">
        <img src="https://i1.ruliweb.com/ori/22/12/21/18533f33f622edef1.gif">
        <img src="img/[믿고] Untitled.png" class="ww">
    </div>
        <h1>페이지를 찾을 수 없습니다.</h1>
        <p>찾으시려는 페이지의 주소가 잘못 입력되었거나,<br>
            주소의 변경 혹은 삭제로 인해 사용하실 수 없습니다.<br>
            입력하신 페이지의 주소가 정확한지 다시 한번 확인해 주세요.
        </p>
        <button type="submit" href="">메인으로</button>
    </div>


</body>
</html>