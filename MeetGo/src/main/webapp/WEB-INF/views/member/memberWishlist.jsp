<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
    <style>
      .Wishlist-main {
        width: 600px;
        height: 1000px;
        margin: 0px auto;
      }
      .Wishlist-content {
        border: 1px solid gray;
        width: 100%;
        height: 120px;
        border-radius: 10px;
        cursor: pointer;
        transition: border 0.3s;
      }
      .Wishlist-content.clicked {
        border: 2px solid limegreen;
      }
      .Wishlist-img {
        width: 80px;
        height: 80px;
        border-radius: 20px;
      }
      .Wishlist-propile {
        float: right;
        margin-top: -100px;
      }
      .Wishlist-header {
        background-color: #F0F0F0;
        border-radius: 10px 10px 0 0;
      }
      .Wishlist-btn{
        margin-top: 30px;
        width: 100%;
        height: 60px;
        border-radius: 20px;
        border-style: none;
        background-color: aqua;
        color: white;
      }
    </style>
</head>
<body>
    <div class="Wishlist-main">
        <div class="Wishlist-title">
            <h1>찜한 고수</h1>
        </div>
        <form action="myWishlist">
        <div class="Wishlist-content" name="wishlist">
            <div class="Wishlist-header">
                <h3>${ sessionScope.loginUser.userName}고수님</h3>
            </div>
            <div class="Wishlist-qw">
                <p>편의점 개잘합니다</p>
                <p>경력5년 * 평균 5분내 응답</p>
            </div>
            <div class="Wishlist-propile">
                <img src="${ sessionScope.loginUser.userProFile }" class="Wishlist-img">
            </div>
        </div>
   </form>
    </div>
    <script>
        // JavaScript로 클릭 시 테두리 색상 변경
        var wishlistContents = document.querySelectorAll('.Wishlist-content');
        function completeSelection() {
            wishlistContents.forEach(function(content) {
                content.classList.remove('clicked');
            });
        }
        wishlistContents.forEach(function(content) {
            content.addEventListener('click', function() {
                this.classList.toggle('clicked');
            });
        });
    </script>
</body>
</html>