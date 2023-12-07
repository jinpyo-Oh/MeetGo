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
    .side { font-family: 'Pretendard-Regular'; } 
    .sidebar {
	   	width : 200px;
	   	height:100%;
	   	position: fixed;
	   	margin-top: 5%;
    } 
    
  

	.side{
	    width: 250px;
	    height: 1000px;
	}
	.side li a {
	    display: block;
	    color: black;
	    padding: 8px 15px 8px 15px;
	    font-weight: bold;
	}
	
	.side li a:hover{
	    background-color: #333;
	    color: #fff;
	}
</style>
<body>
	<div class="sidebar">
	    <div class="side" align="center">
	        <ul>
	           <li style="border-bottom:5px solid #2a91f7c0; padding-bottom:10px;"><b style="font-size: 35px; text-align: center; letter-spacing:5px; color:#2a91f7c0;">커뮤니티</b></li>
	           <br><br><br>
	           <li><a href="gosuList.bo" style="font-size: 25px; text-decoration:none;">고수찾아요</a></li>
	           <br>
	           <li><a href="tipList.bo" style="font-size: 25px; text-decoration:none;">팁 노하우</a></li>
	           <br>
	           <li><a href="pofolList.po" style="font-size: 25px; text-decoration:none;">포트폴리오</a></li>
	        </ul>
	    </div>
	</div>
</body>
</html>