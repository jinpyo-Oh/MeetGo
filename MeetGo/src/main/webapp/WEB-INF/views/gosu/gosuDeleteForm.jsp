<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고수 비활성화</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }

        .deleteForm {
            margin: 50px auto;
            width: 80%;
            max-width: 500px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .deleteForm p {
            font-size: 18px;
            margin-bottom: 20px;
            color: #555;
        }

        .deleteForm label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            color: #333;
        }

        .deleteForm input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="deleteForm">
        <p>계정을 비활성화합니다!</p>
        <form action="gosudelete" method="post">
            <label for="userPwd">Password:</label>
            <input type="password" id="userPwd" name="userPwd" placeholder="Enter Password">
            <input type="hidden" name="userId" value="${sessionScope.loginUser.userId}">
            
            <button type="submit" class="delete-btn">계정 비활성화</button>
        </form>
    </div>

 

</body>
</html>
