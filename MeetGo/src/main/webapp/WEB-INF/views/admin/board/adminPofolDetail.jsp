<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 상세</title>
<style>
 	.outer{
    width: 1200px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 100px;
    box-sizing: border-box;
    }
    /* 폰트 */
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }
    
    #adminPofol-list{
    	width:100%;
    	font-size:24px;
    }
    #statusForm{ margin-top : 100px;}
    #statusForm select { display:inline; }
    #statusForm button { border:0px; width:100px; color:white;}
    #statusForm button[type="button"] { background-color:green; }
    #statusForm button[type="submit"] { background-color:#2a91f7c0; }
    
</style>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp"/>
	<div class="outer">
		<span style="font-size:32px;"><b>${requestScope.list[0].userNickname}</b>님의 포트폴리오 정보</span>
		<br><br>
		<div id="list-area">
			<table id="adminPofol-list">
				<tr>
					<th><br>번호</th>
					<td><br>${requestScope.list[0].pofol.pofolNo }</td>
				</tr>
				<tr>
					<th><br>고수등록번호</th>
					<td><br>${requestScope.list[0].pofol.gosuNo }</td>
				</tr>
				<tr>
					<th><br>제목</th>
					<td><br>${requestScope.list[0].pofol.pofolTitle }</td>
				</tr>
				<tr>
					<th><br>내용</th>
					<td><br>${requestScope.list[0].pofol.pofolContent }</td>
				</tr>
				<tr>
					<th><br>등록일</th>
					<td><br>${requestScope.list[0].pofol.pofolCreateDate }</td>
				</tr>
				<tr>
					<th><br>상태</th>
					<td><br>
					<c:choose>
						<c:when test="${requestScope.list[0].pofol.pofolStatus eq 1 }">
						<span style="color : green;">게시중</span>
						</c:when>
						<c:otherwise>
						<span style="color : red;">게시중지</span>
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</table>
		</div>
		
		<div align="center">
			<form id="statusForm" action="changePofolStatus.ad" method="post">
			<button class="btn" type="button" onclick="location.href='showAdminPofolList.ad'">목록으로</button>
			<button class="btn" type="submit">변경하기</button>
			<select name="pofolStatus" class="form-control" style="width:120px;" id="changeStatus">
				<option value="1">게시중</option>
				<option value="2">게시 중지</option>
			</select>
			<input type="hidden" name="pofolNo" value="${requestScope.list[0].pofol.pofolNo}">
			</form>
		</div>
	</div>
	
</body>
</html>