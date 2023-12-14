<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    }
</style>
</head>
<body>
    
    <jsp:include page="../common/header.jsp" />

    <div style="width: 80%; margin: auto;">
        
        <div style="text-align: center; width: 60%; margin: auto;">
            <br>
            <br>
            <br>
			<div align="center">
	            <h2>계약서</h2>
			</div>
       
    		<br>

                <div style="border: 1px solid black; border-radius: 10px;">
                    <table class="detail" border="1px" style="border-color: black;" >
                            <tr class="cons">
                                <td class="fix" style="width: 15%; border-top-left-radius: 10px;">계약번호</td>
                                <td>${ requestScope.est.estNo }</td>
                                <td class="fix" style="width: 15%;">진행상태</td>
                                <td style="color: red;" id="stat">
                                	<c:choose>
			                        	<c:when test="${ requestScope.est.status eq 2 }">
			                        		대기
			                        	</c:when>
			                        	<c:when test="${ requestScope.est.status eq 3 }">
			                        		결제 대기
			                        	</c:when>
			                        	<c:when test="${ requestScope.est.status eq 4 }">
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
                                <td style="width: 35%;">${ requestScope.gosuName }</td>
                                <td class="fix"  style="width: 15%;">고객명</td>
                                <td style="width: 35%;">${ requestScope.userName }</td>
                            </tr>
                            <tr class="cons">
                                <td class="fix"  style="width: 15%;">가격</td>
                                <td style="width: 35%;">${ requestScope.est.estPrice }</td>
                                <td class="fix"  style="width: 15%;">계약이행일</td>
                                <td style="width: 35%;">${ requestScope.est.startDate }</td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" >주소</td>
                                <td colspan="3">${ requestScope.est.estAddress } </td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" >제목</td>
                                <td colspan="3">${ requestScope.est.estTitle } </td>
                            </tr>
                            <tr></tr>
                            <tr class="cons">
                                <td colspan="4" class="fix">설명</td>
                            </tr>
                            <tr style="height: 320px; text-align: left;">
                                <td colspan="4" style="padding: 3%;">
                                    ${ requestScope.est.estContent }
                                </td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" style="border-bottom-left-radius: 10px;" >소요기간</td>
                                <td colspan="3">계약이행일로부터 ${ requestScope.est.endDate }일</td>
                            </tr>
                            
                    </table>
                    
                </div>
                
                <br>
                
                <a class="btn btn-warning btn-sm" style="float: left;" href="estimate.me?">뒤로가기</a>
            	
            	<c:choose>
            		<c:when test="${ sessionScope.loginUser.userNo ne requestScope.est.gosuNo }">
		                <c:choose>
		                   <c:when test="${ requestScope.est.status eq 3 }">
		                       <button class="btn btn-success btn-sm" id="apibtn">결제</button> 
		                   </c:when>
		                   <c:when test="${ requestScope.est.status eq 4 }">
		                       <button class="btn btn-success btn-sm" id="combtn">서비스 완료</button> 
		                       <br><br>
		                      
						       <div style="float : right;">서비스 완료 시 버튼을 꼭 눌러주세요.</div>
		                   </c:when>
		                   <c:otherwise>
		                       <button class="btn btn-success btn-sm" id="apibtn" style="display: none;">결제</button> 
		                   </c:otherwise>
						</c:choose>	
            		</c:when>
            		<c:otherwise>
            		</c:otherwise>
            	</c:choose>

        </div>
        
        <script>
        	$(function(){
        		$("#apibtn").click(function(){
        			// console.log( '${ requestScope.gosuName }' );
        			$.ajax({
        				url: 'kakaopay.me',
        				method : 'post',
        				dataType: 'json',
        				data : {
        					userNo : '${ requestScope.est.userNo }',
        					estTitle : '${ requestScope.est.estTitle }',
        					estPrice : '${ requestScope.est.estPrice }',
        					estNo : '${ requestScope.est.estNo }'
        				},
        				success: function(data){
        					
        					var box = data;
        					window.open(box);
        				},
        				error: function(){
        					alert("카카오페이 ajax 실패");
        				}
        			});
        		});
        		
        		$("#combtn").click(function(){
        			
        			$.ajax({
						url: "complete.me",
						type: 'get',
						data : {
							estNo : '${ requestScope.est.estNo }'
						}, success : function(){
							alert("서비스가 성공적으로 완료되었습니다!")
							location.reload(true);
							
						}, error : function(){
							alert("서비스 완료에 실패하였습니다! 관리자에게 문의하세요.");
						}
						
        			});
        			
        		});
        		
        	});
        	
        	
        </script>
        
        <br><br><br><br>
        
        <!-- The Modal -->
        <div class="modal fade" id="myModal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">계약 취소 요청을 하시겠습니까?</h4>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body">
                        비밀번호 입력 후 요청 버튼 클릭 시, 취소 요청이 완료됩니다. <br><br>
                        (취소 후에는 변경하실 수 없습니다.) <br><br>
                        비밀번호 &nbsp; <input type="text">
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">요청</button>
                    </div>
                
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>