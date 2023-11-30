<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .table-striped{
        width: 800px; 
        text-align: center;
        padding: auto;
    }
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }
</style> 
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<br>	
	
    <div style="width: 80%; margin: auto;">
        
            
            <br>
            <div style="width: 70%; margin: auto;">
                <h4><b>진행중인 계약</b></h4>
            </div>
            

            <br>
        
            <table class="table-striped table-hover" align="center">
                <thead style="height: 35px;">
                    <tr>
                        <th style="width: 15%;">계약번호</th>
                        <th style="width: 45%;">내용</th>
                        <th style="width: 10%;">고수번호</th>
                        <th style="width: 20%;">시작일</th>
                        <th style="width: 10%;"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><button class="btn btn-primary btn-sm">채팅</button></td>
                    </tr>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><button class="btn btn-primary btn-sm">채팅</button></td>
                    </tr>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><button class="btn btn-primary btn-sm">채팅</button></td>
                    </tr>
                </tbody>
            </table>

            <br><br>
            <hr width="75%" color="lightgray">
            <br><br>
            
            <div style="width: 70%; margin: auto;">
            
	            <span style="float:left;">
	                <h4><b>완료된 계약</b></h4> 
	            </span>
	            <span style="float:right;">
	            	<a href="myReview.me" type="button" class="btn btn-success btn-sm">내 리뷰</a>
	            </span>
	            
            </div>
            
            <br><br><br>
            
            <table class="table-striped table-hover" align="center">
                <thead>
                    <tr>
                        <th style="width: 15%;">계약번호</th>
                        <th style="width: 45%;">내용</th>
                        <th style="width: 10%;">고수번호</th>
                        <th style="width: 20%;">시작일</th>
                        <th style="width: 10%;"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><a type="button" href="reviewWrite.me" class="btn btn-success btn-sm">리뷰</a></td>
                    </tr>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><button class="btn btn-secondary btn-sm">리뷰</button></td>
                    </tr>
                    <tr>
                        <td>a-119</td>
                        <td>명함인쇄 500매</td>
                        <td>1303</td>
                        <td>2023-12-05</td>
                        <td><button class="btn btn-secondary btn-sm">리뷰</button></td>
                    </tr>
                </tbody>
            </table>
            
            
    </div>
	<br><br><br><br>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>