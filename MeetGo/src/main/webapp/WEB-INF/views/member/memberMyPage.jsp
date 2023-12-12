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
        #uploadImage {
        
            width: 75px;
            height: 75px;
            float: left;
            border-radius: 10px;
            margin-right:10px;
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
            <a href="myPageInfo.me"class="">
               <img src="${ sessionScope.loginUser.userProFile }" id="uploadImage">
                <h2 class="name">${ sessionScope.loginUser.userName}고객님</h2> <br>
                <p><img src="https://assets.cdn.soomgo.com/icons/icon-mypage-kakaotalk-signin.svg">tomy2213@naver.com</p>
                <a class="btn" href="myPageInfo.me">계정설정</button>
            </a>
        </div>e
        <hr>
        <div class="body">
            <ul>
                <li class="mypage">결제내역</li>
                <a href="">
                    <li class="mypage-mini">결제 내역 바로가기  <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"></li>
                </a>  
            </ul>
            <hr>
             <ul>
                <li class="mypage">찜 목록</li>
                <a href="">
                    <li class="mypage-mini">고수 찜 목록<img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow"></li>
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
            	<li class="mypage">커뮤니티</li>
                	<a href="myPost.me">
                    	<li class="mypage-mini">커뮤니티 작성글/댓글 <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow" ></li>
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
