<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 마이페이지</title>
    <style>
        .mypage-main {
            width: 652px;
            margin: 0 auto; /* Add this line to center the main div horizontally */
        }
        .mypage-main a {
            text-decoration: none;
        }
        .profile {
            width: 75px;
            height: 75px;
            float: left;
            border-radius: 10px;
            margin-right:10px;
        }
 

        .name {
            margin-bottom: -9px;
        }
        .btn {
            border-radius: 10px;
            border: none;
            padding: 4px 10px;
            color: #737373;
            background-color: #f2f2f2;
            float: right;
            margin-top: -60px;
            
        }
        .s {

            width: 600px;
            height: 70px;
        }
       
        .body{
            margin:0px 0px 20px;
            padding: 16px 0px;
            
        }

        .mypage-main ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .mypage-mini{
            align-items: center;
            padding: 0.75rem 0;
            font-size: 1.125rem;
            font-weight: 700;
            color: slategrey;
        }
        .mypage-main li {
            text-align: -webkit-match-parent;
        }
        .mypage{
            display: flex;
            align-items: center;
            padding: 0.75rem 0;
            font-size: 1.125rem;
            font-weight: 900;
            color: #323232;
            font-size: 25px;
        }
        .arrow{
            float: right;
            
        }
        
        
    </style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>

<form>
    <div class="mypage-main" style="margin-top: 40px;">
        <h1>마이페이지</h1>
        <br>
        <br>
        <div class="header">
            <a href=""class="">
                <img src="https://pbs.twimg.com/media/FRRFdEZaAAACoLr.jpg:large" class="profile">
                <h2 class="name">김찬영 고객님</h2> <br>
                <p><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-kakaotalk-signin.svg">tomy2213@naver.com</p>
                <a class="btn" href="mypageInfo.me">계정설정</button>
            </a>
        </div>
        <hr>
        <div class="body">
            <ul>
                <li class="mypage">믿고페이</li>
                <a href="">
                    <li class="mypage-mini"> 믿고 페이 내역  <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"></li>
                </a>  
            </ul>
            <hr>
            <ul>
                <li class="mypage">고수</li>
                <a href="gosuEnrollForm.go">
                    <li class="mypage-mini">고수 등록하기 <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"> </li>
               </a>
            </ul>
            <hr>
            <ul>
               
            	<li class="mypage">게시판</li>
                	<a href="">
                  	  	<li class="mypage-mini">게시판 보러가기<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"> </li>
               		 </a>
            </ul>     
            <hr>
            <ul>
            	<li class="mypage">커뮤니티</li>
                	<a href="">
                    	<li class="mypage-mini">작성글/댓글 <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow" ></li>
                	</a>
            </ul>
            <hr>
            <ul>
            	<li class="mypage">신고</li>
                	<a href="">
                    	<li class="mypage-mini">신고 내역 <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"></li>
                	</a>
            </ul>
            <hr>
            	<ul>
                	<a href="">
                    	<li class="mypage">설정</li>
                	</a>
                	<a href="">
                    	<li class="mypage-mini">알림 <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"></li>
                	</a>
                	<a href="">
                   	 <li class="mypage-mini">공지사항<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"> </li>
                	</a>
                	<a href="">
                    	<li class="mypage-mini">믿고 안내<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"> </li>
                	</a>
            </ul>
            <hr> 
        </div>   
    </div>

</form>
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>
