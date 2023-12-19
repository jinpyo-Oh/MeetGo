<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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

    .wrap{
        margin: auto;
        width: 1000px;
        box-sizing: border-box;
    }
    .main_title{
    
        width: 100%;
        height: 50px;
        box-sizing: border-box;
    }
    .main_title_1{
        width: 70%;
        height: 50px;
        box-sizing: border-box;
        float: left;
    }
 
    .main_title_2 {
    width: 30%;
    height: 50px;
    box-sizing: border-box;
    float: right;
    display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    
    }
    
    .main_body{
     width: 1000px;
     height: 950px;
    }

    .main_body_1{
        box-sizing: border-box;
        height: 50px;
        width: 100%;
    }
    .main_body_1_1{
        height: 50px;
        width: 100%;

    }
    
    .main_body_1_2{
        height: 50px;
        float: right;
        width: 50%;
    }

    .main_body_2_1{
        width: 1000px;
        height: 100px;
    }

    .main_body_3_1{
        width: 1000px;
        height: 600px;
        text-align: center;
       
    }
    .main_body_4 {
        width: 1000px;
        height: 165px;    
        }
    .main_body_4_1{
        width: 80%;
        height: 100%;
        float: left;
    }   
    .main_body_4_2{
        width: 20%;
        height: 100%;
        float: right;
    }
    #category{
        height: 30px;
        width: 100px;
        display: flex;
        justify-content: center;
        align-items: center;
    
    }
    #titleImg {
    margin: auto; /* 가운데 정렬 스타일 추가 */
    display: block; /* 이미지를 블록 레벨 요소로 설정하여 가운데 정렬이 적용되도록 합니다. */
    }
    #textarea{
        resize: none;
        width: 800px;
        height: 300px;
        border-radius: 8px;
        margin: auto; /* 가운데 정렬 스타일 추가 */
        display: block; /* 블록 레벨 요소로 설정하여 가운데 정렬이 적용되도록 합니다. */
    }
    
    #tipImg {
    	
    }
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="../../common/side.jsp"/>
	
	<div class="wrap">
        <div class="main_title">
       		
            <div class="main_title_1" style="float: left;">
            <br>
            <h4 style="font-size:40px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         			 ${requestScope.m.board.boardTitle}
            
            
            </h4>
        	</div>
         	
            
        </div>
        <hr>
        <div class="main_body">
          
            <div class="main_body_1">
          
          
            <div class="main_body_1_1" style="">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp; &nbsp;&nbsp;
              &nbsp;&nbsp; &nbsp;&nbsp;
             
				  
            <div class="main_body_1_2" style="text-align:right;">
               작성일 : ${ requestScope.m.board.createDate }
               &nbsp;  &nbsp; 
               <i class="bi bi-eye-fill"></i>  &nbsp; ${ requestScope.m.board.boardCount } 
              
            </div>
				
            </div>
          
           
            </div>
           
         <div class="main_body_2_1" style="text-align:right;">
            
            
            ${ requestScope.m.userNickname } 
                 
         </div>

         <div class="main_body_3_1">
			  
			    
			   <p id="textarea" 
			    style="width:600px; height:250px; text-align:left; font-size:20px; background-color: transparent;" >
				${requestScope.m.board.boardContent}
				</p>
			    
			    <hr>
			</div>
            <br>
         <div class="main_body_4">
            <div class="main_body_4_1">
                <br> &nbsp;&nbsp;
                <button class="btn btn-primary">수정하기</button> 
                &nbsp;&nbsp;
                <button class="btn btn-secondary">삭제하기</button>           
             </div>
            
            <div class="main_body_4_2">
                <br>
                &nbsp;&nbsp; &nbsp;&nbsp;
                &nbsp;&nbsp; &nbsp;&nbsp;
                &nbsp;&nbsp; &nbsp;&nbsp;
                <button class="btn btn-primary">목록으로</button> 


            </div>
        
        </div>
     
        
    </div>
    </div>
    
    <jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>