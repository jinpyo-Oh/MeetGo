<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>side</title>
</head>
<style>

     @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; } 
    .sidebar {
	   	width : 200px;
	   	height:100%;
	   	position: fixed;
	   	margin-top: 5%;
    } 
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");
  

	.side{
	    width: 250px;
	    height: 1000px;
	}
	li a {
	    text-decoration: none;
	    display: block;
	    color: #000;
	    padding: 8px 15px 8px 15px;
	    font-weight: bold;
	}


li a:hover{
    background-color: #333;
    color: #fff;
}
</style>
<body>
	<div class="sidebar">
	    <div class="side">
	        <ul>
	           <b style="font-size: 35px; text-align: center;">커뮤니티</b>
	           <br><br><br>
	            <li><a href="#" style="font-size: 25px;">고수찾아요</a></li>
	            <br>
	            <li><a href="#" style="font-size: 25px;">팁 노하우</a></li>
	            <br>
	            <li><a href="#" style="font-size: 25px;">포트폴리오</a></li>
	        </ul>
	    </div>
	</div>
</body>
</html>