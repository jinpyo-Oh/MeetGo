<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; 
    
    } 
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

    .w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
    }

    .w-btn-outline {
        position: relative;
        padding: 15px 30px;
        border-radius: 15px;
        font-family: "paybooc-Light", sans-serif;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-indigo {
        background-color: aliceblue;
        color: #1e6b7b;
    }

    .w-btn-indigo-outline {
        border: 3px solid aliceblue;
        color: #1e6b7b;
    }

    .w-btn-indigo-outline:hover {
        color: #1e6b7b;
        background: aliceblue;
    }

    .w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
    }
    .w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
    }
    .w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
    }
    .w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
    }

    .w-btn-outline:hover {
        letter-spacing: 2px;
        transform: scale(1.2);
        cursor: pointer;
    }

    .w-btn:active {
        transform: scale(1.5);
    }

    .w-btn-outline:active {
        transform: scale(1.5);
    }

    .wrap{

    width: 1000px;
    height: 1000px;
    margin: auto;
    }

    .main1{
    width: 1000px;
    height: 150px;
    box-sizing: border-box;

    }
    .main2{
    width: 1000px;
    height: 600px;
    box-sizing: border-box;

    }
    .main3{
    width: 1000px;
    height: 150px;
    box-sizing: border-box;
    
    }
    .main4{
    width: 1000px;
    height: 100px;
    box-sizing: border-box;

    }

    .main3_1{
    width: 1000px;
    height: 150px;
    box-sizing: border-box;

    }
   
    #textarea{
        resize: none;
        width: 1000px;
        height: 550px;
        border-radius: 8px;
    }


</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>

	<div class="wrap">
      
        <div class="main1">
            <br>
            <div style="display: flex; align-items: center;">
                <h4>&nbsp;&nbsp; 카테고리 &nbsp;&nbsp;</h4>
                <form action="test.do" method="get">             
                    <select name="" style="height: 30px; width: 120px;">
                        <option value="new">&nbsp;&nbsp;게시판</option>
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                    </select>
                </form>    
            </div>
            
            <br>
            
            <div style="display: flex; align-items: center;">
                
                <h4>&nbsp;&nbsp; 제목&nbsp;</h4>
                <input type="text" style="margin-left: 10px; height: 29px; width: 600px;" placeholder="내용을 입력해주세요.">
                <br>
            </div>
            <hr>
        
        </div>
        
        <div class="main2">
            <br>    
            <textarea name="" id="textarea" cols="100" rows="10" placeholder="&nbsp;&nbsp;내용을 입력하세요."></textarea>
        </div>
       
        <div class="main3">

            <div class="main3_1" style="text-align: center;">
               
                <input type="file" id="fileInput" onchange="displayFileName()">
                <button class="w-btn w-btn-blue">찾아보기</button>
                <p id="fileName" style="margin-top: 10px;"></p>
                       
            </div>


        </div>
       
        <div class="main4" style="text-align: right;">
 
            <button class="btn btn-secondary">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button>   
            
            <button class="btn btn-primary" style="margin-left: 15px;">작성하기</button>

        </div>


    </div>
	<jsp:include page="../../common/footer.jsp"/>


    <script>
        function displayFileName() {
            var fileInput = document.getElementById('fileInput');
            var fileNameDisplay = document.getElementById('fileName');
            fileNameDisplay.innerText = fileInput.files[0].name;
        }
    </script>
</body>
</html>