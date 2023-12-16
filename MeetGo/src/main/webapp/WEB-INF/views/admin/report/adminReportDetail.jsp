<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 내역</title>
    <style>
        .outer{
        width: 800px;
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

    #report-pageTitle{ font-size: 30px; font-weight: bolder;}
    #report-pageTitle>svg{margin-bottom: 5px;}
    .outer p{font-size: 18px;}

    #reportStatus-text{ color: lightgray;}

    #status-option{
        width: 120px;
        height: 40px;
        border: 0px;
        font-size: 18px;
        text-align: center;
        border-bottom: 2px solid #2a91f7c0;
    }
    #status-option:hover{cursor: pointer;}
    #status-update{ margin-top: 20px;}
    #status-update button{
        border: 0px;
        border-radius: 10px;
        margin-left: 10px;
        width: 100px;
        height: 40px;
        color: white;
    }
    #status-update button:hover{opacity: 0.8; cursor:pointer;}
    #status-update button[type="submit"]{ background-color: #2a91f7c0;}
    #status-update button[type="button"]{ background-color: rgba(128, 128, 128, 0.71);}
    </style>
</head>
<body>

	<jsp:include page="../common/adminHeader.jsp"/>
	
    <div class="outer">
        <div align="center">
            <span id="report-pageTitle">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                   <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                   <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                </svg>
                신고 내역
            </span>
            <br><br>
                <div align="left">
                    <p>[ 신고번호 : ${requestScope.list[0].reportNo} ]</p>
                </div>
            <hr>

            <div align="left">
                <p>신고한 회원 : ${requestScope.list[0].reportUser}</p>
                <p>신고된 회원 : ${requestScope.list[0].reportedUser}</p>
                <p>신고 유형 : <b>${requestScope.list[0].reportCategory}</b></p>
                <p>상태 : 
                <c:choose>
                	<c:when test="${requestScope.list[0].reportStatus eq 0}">
                		<span style="color:red;" id="reportStatus-text"><b>미확인</b></span>
                	</c:when>
                	<c:when test="${requestScope.list[0].reportStatus eq 1}">
                		<span style="color:#2a91f7c0;" id="reportStatus-text"><b>처리대기</b></span>
                	</c:when>
                	<c:otherwise>
                		<span style="color:green;" id="reportStatus-text"><b>처리완료</b></span>
                	</c:otherwise>
                </c:choose>
                    
                </p>
            </div>

            <div>
                <textarea class="form-control" style="resize: none;" rows="10" readonly>${requestScope.list[0].reportContent}</textarea>
            </div>

            <div align="right">
                <form id="status-update" action="changeReportStatus.ad" method="post">
                    <select id="status-option">
                    	<option value="0">미확인</option>
                        <option value="1">처리대기</option>
                        <option value="2">처리완료</option>
                    </select>
                    <button type="submit">변경하기</button>
                    <button type="button" onclick="history.back();">목록으로</button>
                </form>
            </div>

        </div>

    </div>
</body>
</html>