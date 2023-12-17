<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 승인</title>
<style>
     .approve {
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
    
    #app{
    	width: 500px;
    	height: 450px;
    }
    
    </style>
</head>
<body>
 	<jsp:include page="../common/header.jsp" />
 	
 	<br>
 
 	<div>
	    <div class="approve">
	        <h1>결제 승인이 완료되었습니다.</h1>
	        <img id="app" src="<%= request.getContextPath() %>/resources/images/common/payApprove.jpg">
	    </div>
	    <br>
	    <div align="center">
	        <p>
	            돌아가기 버튼 클릭 시 나의 견적 목록으로 돌아갑니다.
	        </p>
	        <a type="submit" class="btn btn-primary" href="estimate.me">돌아가기</a>
	    </div>
 	</div>
 	
 	<br> <br>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>