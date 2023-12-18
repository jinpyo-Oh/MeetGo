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
    #searchForm {
    }
    #searchForm>* {
        float:right;
        margin:5px;
    }
    #revImg{
    	width:50px;
    	height:50px;
    	margin-bottom:3px;
    }
    
</style> 
</head>
<body>
	
	<jsp:include page="../common/adminHeader.jsp" />
	
    <div style="width: 100%; margin: auto; min-height: 400px;">
        
            <br>
            
            <br>
 			<div align="center">
                <h2><b><img id="revImg" src="<%= request.getContextPath() %>/resources/images/common/reviewManage.jpg"> 리뷰 관리</b></h2></td>                
 			</div> 
 			
            <div style="width: 900px; margin: auto;">
 				<a style="float:right; margin-top:10px; color: black;" href="adminReviewList.ad">전체 목록</a>
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
	                <tbody id="listBody">
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
	            
	            <br>
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
        	
 			<br>
        	<div style="width: 900px; margin: auto;">
			    <form id="searchForm" action="" method="get">
			        <button id="search" class="searchBtn btn btn-secondary">검색</button>
			        <div class="text">
			            <input type="text" class="form-control" id="keyword" name="keyword">
			        </div>
			        <div class="select">
			            <select class="custom-select" name="condition" id="condition">
			                <option value="gosuNo">고수번호</option>
			                <option value="userNo">고객번호</option>
			                <option value="estNo">계약번호</option>
			            </select>
			        </div>
			    </form>
			</div>
    </div>
    
    <script>

	    $("#searchForm").submit(function(event) {
	        event.preventDefault();
	        let keyword = $("#keyword").val();
	        let condition = $("#condition").val();
	        search(1, keyword, condition);
	    });
    
    	$(function() {
    		
    		$(".table-hover>tbody>tr").click(function() {
    			
    			let rno = $(this).children().eq(0).text();
    			
    			// console.log(rno);
    				
    			location.href = "adminReviewDetail.ad?rno=" + rno;
    		});
    		
    	});
    	
    	function search(page, keyword, condition){
    		
    		$('#listBody').empty();
    		$('#pagingArea').empty();
    		
    		$.ajax({
    			url: "adminReviewSearch.ad",
    			dataType: "json",
    			data: {
    				cPage: page,
    				keyword: keyword,
    				condition: condition
    			},
    			success: function(data){
    				
    				console.log(data);
    				
    				let list = data.list
    				
    				for(let i = 0; i < list.length; i++){
	    		    	let content =
		                    '<tr>' + 
                            '<td>' + list[i].review.revNo + '</td>' + 
                            '<td>' + list[i].estTitle + '</td>' + 
                            '<td>' + list[i].gosuName + '(' + list[i].review.gosuNo + ')' + '</td>' +
                            '<td>' + list[i].userName + '(' + list[i].review.userNo + ')' + '</td>' +
		                	'<td>' + list[i].review.revDate + '</td>' +
		                	'<td>';
		                	
	                    	if(list[i].review.revPoint == 0){
	                    		content += 
	                    			'<i class="rating__star far fa-star"></i>';
	                    	} else if (list[i].review.revPoint == 1) {
	                    		content += 
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>';
	                    	} else if (list[i].review.revPoint == 2){
	                    		content += 
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>';
	                    	} else if (list[i].review.revPoint == 3){
	                    		content += 
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>';
	                    	} else if (list[i].review.revPoint == 4){
	                    		content += 
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>';
	                    	} else if (list[i].review.revPoint == 5){
	                    		content +=
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>' +
	                    			'<i class="fa-solid fa-star" style="color: #ffd43b;"></i>';
	                    	} 
	                        
	                    content += '</td>' + '</tr>';
						// console.log(content);
	                	$('#listBody').append(content);
	    		    }
	                	
                	let paging = '';
    		    	
	    		    if(data.pi.currentPage == 1){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&lt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="search(' + (data.pi.currentPage - 1) + ', \'' + keyword + '\', \'' + condition + '\')">&lt;</button>';
	    		    }
	    		    
	    		    for(let i = data.pi.startPage; i <= data.pi.endPage; i++){
	    		    	
	    		    	if(data.pi.currentPage == i){
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:lightblue;" onclick="search('+ i + ', ' + keyword + ', ' + condition + ')">' + i + '</button>'	    		    	
	    		    	} else{
	    		    		
	    		    		paging += '<button class="pageBtn" onclick="search(' + i + ', \'' + keyword + '\', \'' + condition + '\')">' + i + '</button>';	    		    	
	    		    	}
	    		    	
	    		    }
	    		    
	    		    if(data.pi.currentPage == data.pi.endPage){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&gt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="search(' + (data.pi.currentPage + 1) + ', \'' + keyword + '\', \'' + condition + '\')">&gt;</button>'
	    		    }
	    		    
	    		    $('#pagingArea').append(paging);
	    		    
	    		    $(".table-hover>tbody>tr").click(function() {
	        			
	        			let rno = $(this).children().eq(0).text();
	        			
	        			// console.log(rno);
	        				
	        			location.href = "adminReviewDetail.ad?rno=" + rno;
	        		});
                	
    			},
    			error: function(){
    				console.log("실패");
    			}
    		});
    		
    	}
		    	
    </script>
	<br><br><br><br>
</body>
</html>