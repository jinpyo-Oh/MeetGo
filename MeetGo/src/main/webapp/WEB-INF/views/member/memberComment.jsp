<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .comment-main {
            padding: 50px;
            margin: 0 auto;
            width: 1000px;
            height: 1000px;
        }
        .comment-mode li{
            list-style: none;
            
        }
        .comment-context {
            text-align: center;
            margin-top: 300px;
        }
        .comment-text {
            color:gray
        }
        .comment-title {
            
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

    .comment-mode {
        color: gray;
    }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="comment-main">
        <div class="comment-title">
            <h1>커뮤니티 작성글/ 댓글</h1>
        </div>
        <div class="comment-mode">
            <HR>
            <a id="myPostLink" href="myPost.me" onclick="toggleUnderline()">작성 글</a>
            <a  id="myPostLink"  onclick="toggleUnderline()"  href="comment.me">작성 댓글</a>    
        </div>
        <hr>
        <div class="comment-context">
            <img src="https://assets.cdn.soomgo.com/icons/icon-coupon-empty.svg">
            <h3 class="comment-title">작성댓글이 없습니다</h3>
            <p class="comment-text">숨고생활에 올려진 정보와 질문에 <br>댓글을 작성해보세요!</p>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>

    <script>
        // JavaScript 함수: 링크에 클래스를 토글합니다.
        function toggleUnderline() {
            var myPostLink = document.getElementById("myPostLink");
            myPostLink.classList.toggle("underline");
        }
</script>
</body>
</html>