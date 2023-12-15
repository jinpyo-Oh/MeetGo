<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 작성글/댓글</title>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        body {
            font-family: 'Pretendard-Regular', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        header {
            /* Add your header styling here */
        }

        .comment-main {
            padding: 20px;
            margin: 20px auto;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .comment-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .comment-mode {
            text-align: center;
            margin-bottom: 20px;
        }

        .comment-mode a {
            margin: 0 10px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        .comment-mode a:hover {
            color: #0066cc;
        }

        .boardList {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .boardList th, .boardList td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
              border: none;
        }

        .boardList th {
            background-color: #f2f2f2;
        }
         .boardList tbody tr:hover {
            background-color: #e6f7ff; /* 호버 시 배경색 변경 */
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
<script>
	$(function(){
		selectReplyList();
	})
</script>
    <div class="comment-main">
        <div class="comment-title">
            <h1>커뮤니티 작성글/댓글</h1>
        </div>
        <div class="comment-mode">
            <a href="myPost.me">작성 글</a>
            <a href="comment.me">작성 댓글</a>
        </div>
        <hr>
        <div class="gosu_main">
           <table id="replyList" class="table" align="center" class="boardList">
                <thead>
                    <tr>
                        <th>댓글 번호</th>
                        <th>댓글</th>
                        <th>작성일</th>
                        <th>게시글 번호</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 댓글 작성 내역이 동적으로 추가될 자리 -->
                </tbody>
            </table>
        </div>
    </div>
        <jsp:include page="../common/footer.jsp"/>
        
<script>
	function selectReplyList() {
    		
    		// 해당 게시글에 딸린 댓글 조회 요청용 ajax 요청
		 $.ajax({
 			url : "rlist.bo",
 			type : "get",
 			data : {
 				userNo : '${ sessionScope.loginUser.userNo }'
		 	},
 			success : function(result) {
 				
 				 console.log(result);
 				
 				let resultStr = "";
 				
 				for(let i = 0; i < result.length; i++) {
 					
 					resultStr += "<tr>"
 							   + 	"<th>" + result[i].replyNo + "</th>"
 							   + 	"<td>" + result[i].replyContent + "</td>"
 							   +	"<td>" + result[i].replyDate + "</td>"
 							   +	"<td>" + result[i].boardNo + "</td>"
 							   + "</tr>";
 				}
 				
 				$("#replyList>tbody").html(resultStr);
 				
 			},
 			error : function() {
 				console.log("댓글리스트 조회용 ajax 통신 실패!");
 			}
 		});
  	}
</script>

</body>
</html>
