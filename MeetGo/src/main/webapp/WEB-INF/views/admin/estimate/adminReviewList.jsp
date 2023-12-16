<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bb1372cd06.js" crossorigin="anonymous"></script><style>
<style>
    .table-hover{
        width: 960px; 
        text-align: center;
        padding: auto;
        border-radius: 5px;
    }
    
    .truncate {
	    max-width: 150px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	}
    
    .table-hover thead{
    	border-bottom: 1px solid #2a91f7c0;
    	text-align:center;
    }
    
    .table-hover td{
    	height: 40px;
    	text-align:center;
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
        width: 30px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
        margin : 0px 3px;
    }
    .pageBtn{
    	
        border: 0;
        border-radius: 5px;
        width: 30px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
        margin : 0px 3px;
    }
    .none{
    	background-color: none;
    }
</style> 
</head>
<body>
	
	<jsp:include page="../common/adminHeader.jsp" />
	
    <div style="width: 100%; margin: auto; min-height: 400px;">
        
            <br>
            
            <br>
 			<div align="center">
                <h2><b>리뷰 관리</b></h2></td>                
 			</div>           
               
			
            <br><br>
        	<div id="inCom">
	            <table class="table-hover" align="center">
	                <thead style="height: 35px;">
	                    <tr>
	                        <th style="width: 100px;">리뷰번호</th>
	                        <th style="width: 225px;">계약명</th>
	                        <th style="width: 135px;">고수명(번호)</th>
	                        <th style="width: 135px;">고객명(번호)</th>
	                        <th style="width: 135px;">작성일</th>
	                        <th style="width: 180px;">별점</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach var="r" items="${ requestScope.list }">
                        <tr>
                            <td>${ r.review.revNo }</td>
                            <td>${ r.estTitle }</td>
                            <td>${ r.gosuName }(${ r.review.gosuNo })</td>
                            <td>${ r.userName }(${ r.review.userNo })</td>
		                	<td>${ r.review.revDate }</td>
		                	<td style="text-align:center;">
		                		<c:choose>
									<c:when test="${ r.review.revPoint == 0 }">
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 1 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 2 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 3 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 4 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
									<c:when test="${ r.review.revPoint == 5 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
								</c:choose>
							</td>
                        </tr>
                    	</c:forEach>
	                </tbody>
	            </table>
	            
	            <br><br><br><br>
	            <div id="pagingArea">
	            	<ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ requestScope.pi.currentPage eq 1 }">
	                    	</c:when>
	                    	<c:otherwise>
		                    	<li class="page-item">
		                    		<a class="page-link" href="adminReviewList.ad?cPage=${ requestScope.pi.currentPage - 1 }">&lt;</a>
		                    	</li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
	                    					 end="${ requestScope.pi.endPage }"
	                    					step="1">
	                    	<li class="page-item">
	                    		<a class="page-link" href="adminReviewList.ad?cPage=${ p }">${ p }</a>
	                    	</li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item">
			                    	<a class="page-link" href="adminReviewList.ad?cPage=${ requestScope.pi.currentPage + 1 }">&gt;</a>
			                    </li>
			                </c:otherwise>
	                	</c:choose>
	                </ul>
            	</div>
        	</div>
            
    </div>
    
    <script>
    	$(function() {
    		
    		$(".table-hover>tbody>tr").click(function() {
    			
    			let rno = $(this).children().eq(0).text();
    			
    			// console.log(rno);
    				
    			location.href = "adminReviewDetail.ad?rno=" + rno;
    		});
    		
    	});
		    	
    </script>
	<br><br><br><br>
</body>
</html>