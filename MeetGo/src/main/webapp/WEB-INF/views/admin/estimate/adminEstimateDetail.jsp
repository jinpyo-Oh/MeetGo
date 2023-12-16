<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<style>
    .detail{
        width: 100%;
        border-style: hidden;
        border-radius: 10px;
        margin: center;
    }
    
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }
    
    .cons{
        text-align: center;
        height: 35px;
    }
    
    .btn {
        float: right;
        margin: 5px;
    }
    .fix{
        background-color: #2a91f7c4;
        color: white;
    }
    .back{
        float: left;
        height: 35px;
        color: black;
        margin-top: 5px;
    }
</style>
</head>
<body>
    
    <jsp:include page="../common/adminHeader.jsp" />

    <div style="width: 80%; margin: auto;">
        
        <div style="text-align: center; width: 60%; margin: auto;">
            <br>
            <a class="back" href="adminEstimateList.ad" style="text-decoration: none;"><i class="fas fa-chevron-left"></i>&nbsp; 목록으로</a>
              <c:choose>
                   <c:when test="${ requestScope.est.estimate.status eq 4 }">
                       <button class="btn btn-danger btn-sm" id="combtn">강제 서비스 완료</button> 
                       <br>
                   </c:when>
				</c:choose>	
            <br><br>
			<div align="center">
	            <h2><b>계약서</b></h2>
			</div>
       
    		<br>

                <div style="border: 1px solid black; border-radius: 10px;">
                    <table class="detail" border="1px" style="border-color: black;" >
                            <tr class="cons">
                                <td class="fix" style="width: 15%; border-top-left-radius: 10px;">계약번호</td>
                                <td>${ requestScope.est.estimate.estNo }</td>
                                <td class="fix" style="width: 15%;">진행상태</td>
                                <td style="color: red;" id="stat">
                                	<c:choose>
			                        	<c:when test="${ requestScope.est.estimate.status eq 3 }">
			                        		결제 대기
			                        	</c:when>
			                        	<c:when test="${ requestScope.est.estimate.status eq 4 }">
			                        		결제 완료
			                        	</c:when>
			                        	<c:otherwise>
			                        		완료
			                        	</c:otherwise>
		                        	</c:choose>
                                </td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" style="width: 15%;" >고수명</td>
                                <td style="width: 35%;">${ requestScope.est.gosuName }</td>
                                <td class="fix"  style="width: 15%;">고객명</td>
                                <td style="width: 35%;">${ requestScope.est.userName }</td>
                            </tr>
                            <tr class="cons">
                                <td class="fix"  style="width: 15%;">가격</td>
                                <td style="width: 35%;">${ requestScope.est.estimate.estPrice }</td>
                                <td class="fix"  style="width: 15%;">계약이행일</td>
                                <td style="width: 35%;">${ requestScope.est.estimate.startDate }</td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" >주소</td>
                                <td colspan="3">${ requestScope.est.estimate.estAddress } </td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" >제목</td>
                                <td colspan="3">${ requestScope.est.estimate.estTitle } </td>
                            </tr>
                            <tr></tr>
                            <tr class="cons">
                                <td colspan="4" class="fix">설명</td>
                            </tr>
                            <tr style="height: 320px; text-align: left;">
                                <td colspan="4" style="padding: 3%;">
                                    ${ requestScope.est.estimate.estContent }
                                </td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" style="border-bottom-left-radius: 10px;" >소요기간</td>
                                <td colspan="3">계약이행일로부터 ${ requestScope.est.estimate.endDate }일</td>
                            </tr>
                            
                    </table>
                    
                </div>
                
                <br>
                
        </div>
        
        <script>
        	$(function(){
        		
        		$("#combtn").click(function(){
        			
        			$.ajax({
						url: "complete.me",
						type: 'get',
						data : {
							estNo : '${ requestScope.est.estimate.estNo }'
						}, success : function(){
							location.reload(true);
							alertify.alert('Alert', '${ sessionScope.alertMsg }', function(){ alertify.success('Ok'); });
						}, error : function(){
							alert("서비스 완료에 실패하였습니다! 관리자에게 문의하세요.");
						}
        			});
        		});
        	});
        	
        	
        </script>
        
        <br><br><br><br>
        
    </div>


</body>
</html>