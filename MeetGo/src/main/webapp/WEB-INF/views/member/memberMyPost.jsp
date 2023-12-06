<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .mypost-main {
            padding: 50px;
            margin: 0 auto;
            width: 1000px;
            height: 1000px;
        }
        .mypost-mode li{
            list-style: none;
            
        }
        .mypost-context {
            text-align: center;
            margin-top: 300px;
        }
        #myPostLink.underline {
        text-decoration: underline;
         }
       
         #myPostLink {
        text-decoration: none;
        position: relative;
        color: gray;
        transition: color 0.3s ease, border-bottom 0.3s ease;
        }
         #myPostLink.underline {
         color: black; /* 변경된 색상 */
         border-bottom: 2px solid black;
        }

       
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="mypost-main">
        <div class="mypost-title">
            <h1>커뮤니티 작성글/ 댓글</h1>
        </div>
        <div class="mypost-mode">
            <HR>
            <a href="myPost.me" id="myPostLink" onclick="toggleUnderline()">작성 글</a>
            <a href="comment.me" id="myPostLink" onclick="toggleUnderline()">작성 댓글</a>    
        </div>
        <hr>
        <div class="mypost-context">
            <img src="https://assets.cdn.soomgo.com/icons/icon-coupon-empty.svg">
            <h3>작성글이 없습니다</h3>
            <p>생활서비스에 대한 정보와 질문을 올려보세요!</p>
        </div>
    </div>
    <hr>
    <jsp:include page="../common/footer.jsp"/>
<script>
      function toggleUnderline() {
            var myPostLink = document.getElementById("myPostLink");
            myPostLink.classList.toggle("underline");
        }
</script>
</body>
</html>