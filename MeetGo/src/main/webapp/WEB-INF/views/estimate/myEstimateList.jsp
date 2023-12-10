<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .table-hover{
        width: 800px; 
        text-align: center;
        padding: auto;
        border-radius: 5px;
    }
    
    .table-hover thead{
    	border-bottom: 1px solid #2a91f7c0;
    }
    
    .table-hover td{
    	height: 40px;
    }
    
    #pagingArea {width:fit-content; margin:auto;}
    
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }
    
    #pagingBtn-area{margin-top: 80px;}
    .pagingBtn{
        border: 0;
        border-radius: 5px;
        width: 80px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .pageBtn{
        border: 0;
        border-radius: 5px;
        width: 40px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .none{
    	background-color: none;
    }
    
</style> 
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<br>	
	
    <div style="width: 80%; margin: auto; min-height: 400px;">
        
            <br>
            
            <table style="width: 70%; margin: auto; text-align:center;" id="type">
                <tr>
					<td class="type" style="width:20%; border-bottom: 3px solid #2A8FF7"><h4><b>진행중인 계약</b></h4></td>                
					<td class="type" style="width:20%;"><h4><b>완료된 계약</b></h4> </td>
					<td class="type" style="text-align: right; float:right; margin-top:15px;"><a href="myReview.me?cPage=1" class="">내 리뷰 보러가기</a></td>                
                </tr>
            </table>
            

            <br><br><br>
        	<div id="inCom">
	            <table class="table-hover" align="center">
	                <thead style="height: 35px;">
	                    <tr >
	                        <th style="width: 10%;">계약번호</th>
	                        <th style="width: 35%;">내용</th>
	                        <th style="width: 10%;">고수번호</th>
	                        <th style="width: 20%;">시작일</th>
	                        <th style="width: 15%;">현재상태</th>
	                        <th style="width: 10%;">채팅</th>
	                    </tr>
	                </thead>
	                <c:choose>
	                
		                <c:when test="${ not empty requestScope.incomList }">
			                <tbody>
			                    <c:forEach var="b" items="${ requestScope.incomList }">
				                    <tr>
				                        <td class="eno">${ b.estNo }</td>
				                        <td>${ b.estContent }</td>
				                        <td>${ b.gosuNo }</td>
				                        <td>${ b.startDate }</td>
				                        <td>
				                        	<c:choose>
					                        	<c:when test="${ b.status eq 2 }">
					                        		대기
					                        	</c:when>
					                        	<c:when test="${ b.status eq 3 }">
					                        		결제 대기
					                        	</c:when>
					                        	<c:otherwise>
					                        		결제 완료
					                        	</c:otherwise>
				                        	</c:choose>
				                        </td>
				                        <td>채팅</td>
				                    </tr>
				            	</c:forEach>
			                </tbody>
		                </c:when>
	                	
	                	<c:otherwise>
	                		<tbody>
	                			<tr>
	                				<td colspan="6" class="none">현재 진행중인 견적서가 없습니다.</td>
	                			</tr>
	                		</tbody>
	                	</c:otherwise>
	                </c:choose>
	            </table>
	            
	            <br><br><br><br>
	             <c:if test="${ not empty requestScope.incomList }">
		            <div id="pagingArea">
	                	<c:choose>
			        		<c:when test="${ requestScope.pi1.currentPage eq 1 }">
			        			<button class="pagingBtn" disabled style="display:none;">prev</button>
			        		</c:when>
			        		<c:otherwise>
			        			<button class="pagingBtn" onclick="location.href='estimate.me?cPage=${ requestScope.pi1.currentPage - 1 }'">prev</button>
			        		</c:otherwise>
			        	</c:choose>            
			             <c:forEach var="p" begin="${ requestScope.pi1.startPage }" 
			                    					end="${ requestScope.pi1.endPage }"
			                    					step="1">
						<button class="pageBtn" onclick="location.href='estimate.me?cPage=${ p }'">${ p }</button>
			            </c:forEach>          
			            <!-- 마지막 페이지면 다음페이지로 이동 불가 -->
			            <c:choose>
				       		<c:when test="${ requestScope.pi1.currentPage eq requestScope.pi1.endPage }">
				       			<button class="pagingBtn" disabled style="display:none;">next</button>
				       		</c:when>
				       		<c:otherwise>
				       			<button class="pagingBtn" onclick="location.href='estimate.me?cPage=${ requestScope.pi1.currentPage + 1 }'">next</button>
				       		</c:otherwise>
			       		</c:choose> 
	            	</div>
	             </c:if>
        	</div>
            
        	<div id="com" style="display: none;">
	            <table class="table-hover" align="center">
	                <thead  style="height: 35px;">
	                    <tr>
	                        <th style="width: 10%;">계약번호</th>
	                        <th style="width: 35%;">내용</th>
	                        <th style="width: 10%;">고수번호</th>
	                        <th style="width: 20%;">시작일</th>
	                        <th style="width: 15%;">현재상태</th>
	                        <th style="width: 10%;">리뷰</th>
	                    </tr>
	                </thead>
	                <c:choose>
	                	
		                <c:when test="${ not empty requestScope.comList }">
			                <tbody>
			                    <c:forEach var="b" items="${ requestScope.comList }">
				                    <tr>
				                        <td class="eno">${ b.estimate.estNo }</td>
				                        <td>${ b.estimate.estContent }</td>
				                        <td>${ b.estimate.gosuNo }</td>
				                        <td>${ b.estimate.startDate}</td>
				                        <td>완료</td>
			                        	<c:choose>
											<c:when test="${ b.reviewCnt > 0 }">
					                        	<td>
						                        	<a type="button" class="btn btn-secondary btn-sm">
						                        		작성완료
						                        	</a>
					                        	</td>
											</c:when>
											<c:otherwise>
												<td id="review">
						                        	<a type="button" class="btn btn-success btn-sm">
						                        		작성하기						                        	</a>
						                        	<input type="hidden" id="estNo" value="${ b.estimate.estNo }">
						                        </td>
											</c:otherwise>
			                        	</c:choose>
				                        
				                    </tr>
				            	</c:forEach>
			                </tbody>
		                </c:when>
	                	<c:otherwise>
	                		<tbody>
	                			<tr>
	                				<td colspan="6" class="none">완료된 견적서가 없습니다.</td>
	                			</tr>
	                		</tbody>
	                	</c:otherwise>
	                </c:choose>
	            </table>
	            
	            <br><br><br><br>
	            
	             <c:if test="${ not empty requestScope.comList }">
		            <div id="pagingArea">
	                	<c:choose>
			        		<c:when test="${ requestScope.pi2.currentPage eq 1 }">
			        			<button class="pagingBtn" disabled style="display:none;">prev</button>
			        		</c:when>
			        		<c:otherwise>
			        			<button class="pagingBtn" onclick="location.href='estimate.me?cPage=${ requestScope.pi2.currentPage - 1 }'">prev</button>
			        		</c:otherwise>
			        	</c:choose>            
			             <c:forEach var="p" begin="${ requestScope.pi2.startPage }" 
			                    					end="${ requestScope.pi2.endPage }"
			                    					step="1">
						<button class="pageBtn" onclick="location.href='estimate.me?cPage=${ p }'">${ p }</button>
			            </c:forEach>          
			            <!-- 마지막 페이지면 다음페이지로 이동 불가 -->
			            <c:choose>
				       		<c:when test="${ requestScope.pi2.currentPage eq requestScope.pi2.endPage }">
				       			<button class="pagingBtn" disabled style="display:none;">next</button>
				       		</c:when>
				       		<c:otherwise>
				       			<button class="pagingBtn" onclick="location.href='estimate.me?cPage=${ requestScope.pi2.currentPage + 1 }'">next</button>
				       		</c:otherwise>
			       		</c:choose> 
	            	</div>
	             </c:if>
	            
	            
        	</div>
    </div>
    
    <script>
    	$(function(){
    		
    		let $inCom = $("#type").find(".type").eq(0);
    		let $com = $("#type").find(".type").eq(1);
    		
    		$inCom.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$com.css("border-bottom", "none");
    			
    			$("#inCom").show();
    			$("#com").hide();
    		});
    		
    		$com.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$inCom.css("border-bottom", "none");
    			
    			$("#com").show();
    			$("#inCom").hide();
    		});
    	});
    	
    	$(function() {
    		
    		$(".table-hover>tbody>tr td:not(:last-child)").click(function() {
    			
    			let eno = $(this).siblings(".eno").text();
    			// console.log(eno);
    			location.href = "estimateDetail.me?eno=" + eno;
    		});
    		
    		
    		$("#review").click(function(){
    			let eno = $("#estNo").val();
    			// console.log(eno);
    			
    			location.href = "reviewWrite.me?eno=" + eno;
    		});
    	});
    	
    </script>
	<br><br><br><br>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>