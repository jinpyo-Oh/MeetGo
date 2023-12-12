<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <meta charset="UTF-8">
  <title>내가 작성한 커뮤니티 게시글</title>
  <style>
    @font-face {
      font-family: 'Pretendard-Regular';
      src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
      font-weight: 400;
      font-style: normal;
    }

    body {
      font-family: 'Pretendard-Regular';
      margin: 0;
      padding: 0;
    }

    .wrap {
      margin: auto;
      width: 1000px;
      
      height: 1000px;
      
    }

    .gosu_header {
      text-align: center;
      padding: 20px 0;
    }

    h2 {
      margin: 0;
    }

    hr {
      border: 1px solid #ddd;
    }

    .gosu_body_1 {
      display: flex;
      border-bottom: 1px solid #ddd;
    }

    .gosu_body_1 div {
      box-sizing: border-box;
      padding: 10px;
    }

    .gosu_body_1_1, .gosu_body_1_3 {
      width: 20%;
    }

    .gosu_body_1_2 {
      width: 60%;
      text-align: center;
    }

    .gosu_main {
      width: 1000px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 15px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }

    .boardList tr:hover {
      background-color: #f5f5f5;
    }

    .boardList tr td.gosu_content_2 {
      max-width: 500px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      text-align: left;
    }
  </style>
</head>
<body>
  <jsp:include page="../common/header.jsp"/>

  <div class="wrap">
    <div class="gosu_header">
      <h2>내가 작성한 커뮤니티 게시글</h2>
      
      <a href="comment.me">내가 작성한 댓글창으로 가기</a>
      <hr>
    </div>

    <div class="gosu_body_1">
      <div class="gosu_body_1_1"><b>No</b></div>
      <div class="gosu_body_1_2"><b>제목</b></div>
    </div>

    <div class="gosu_main">
      <table class="boardList">
        <c:forEach var="m" items="${ requestScope.list }">
          <tr>
            <td class="bno">${m.boardNo}</td>
            <td class="gosu_content_2">${m.boardTitle}</td>
            <td class="gosu_content_4">${m.createDate}</td>
          </tr>
        </c:forEach>
      </table>
    </div>
    
  </div>

  <jsp:include page="../common/footer.jsp"/>

  <script>
    $(".boardList tr").click(function() {
      let bno = $(this).children(".bno").text();
      location.href = "detail.bo?bno=" + bno;
    });
  </script>
</body>
</html>
