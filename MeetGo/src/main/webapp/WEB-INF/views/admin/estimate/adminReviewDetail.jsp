<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/bb1372cd06.js" crossorigin="anonymous"></script><style>
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
        background-color: #059862d1;
        color: white;
    }
    .back{
        margin: 5px;
        float: left;
        height: 30px;
        color: black;
    }
    .delete{
    	margin: 5px;
        float: right;
        height: 30px;
        color: red;
        cursor: pointer;
    }
    #content{
    	background-color: white;
    	border: 0;
    }
    
    
</style>

</head>
<body>
	<jsp:include page="../common/adminHeader.jsp" />
	
	<div style="width: 80%; margin: auto;">
        
        <div style="text-align: center; width: 60%; margin: auto;">
            <br>
            <a class="back" href="adminReviewList.ad" style="text-decoration: none;"><i class="fas fa-chevron-left"></i>&nbsp; 목록으로</a>
			<a class="delete" data-toggle="modal" data-target="#myModal">삭제하기 X</a>
		
            <br>
			<br>
			
            <h2>${ requestScope.list.estTitle }(${ requestScope.list.review.revNo })번 계약에 대한 리뷰</h2>
       
           <br><br>
    		
            <form method="post" action="reviewEnroll.me" enctype="multipart/form-data">
                <div style="border: 1px solid black; border-radius: 10px;">
                    <table class="detail" border="1px" style="border-color: black;" >
	                    <tr class="cons">
	                        <td class="fix" style="width: 15%; border-top-left-radius: 10px;">계약번호</td>
	                        <td style="width: 35%;">${ requestScope.list.review.revNo }</td>
	                        <td class="fix" style="width: 15%;">계약명</td>
	                        <td style="width: 35%;">${ requestScope.list.estTitle }</td>
	                    </tr>
	                    <tr class="cons">
	                        <td class="fix">고수명</td>
	                        <td>${ requestScope.list.gosuName }</td>
	                       	<td class="fix">고객명</td>
	                       	<td>${ requestScope.list.userName }</td>
	                    </tr>
	                    <tr class="cons">    
	                        <td class="fix" >별점</td>
	                        <td>
	                            <c:choose>
									<c:when test="${ requestScope.list.review.revPoint == 0 }">
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ requestScope.list.review.revPoint == 1 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ requestScope.list.review.revPoint == 2 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ requestScope.list.review.revPoint == 3 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ requestScope.list.review.revPoint == 4 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="rating__star far fa-star"></i>
									</c:when>
									<c:when test="${ requestScope.list.review.revPoint == 5 }">
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
										<i class="fa-solid fa-star" style="color: #ffd43b;"></i>
									</c:when>
								</c:choose>
	                        </td>
	                        <td class="fix">작성일</td>
	                        <td>${ requestScope.list.review.revDate }</td>
	                    </tr>
	                
	                    <tr style="height: 320px;">
	                        <td style="background-color: #059862d1; color: white;">내용</td>
	                        <td colspan="3" style="text-align: left;">
	                        	<textarea id="content" name="revContent" class="form-control" rows="10" style="resize: none; height: 320px; width: 100%;" readonly>${ requestScope.list.review.revContent }	
	                            </textarea>
	                        </td>
	                    </tr>
	                    <tr class="cons">
	                    	<div id="insertFile">
	                         <td class="fix" style="border-bottom-left-radius: 10px;" >이미지</td>
	                         <td colspan="3" style="text-align: left; padding-left: 15px;" id="image">
	                         	<c:choose>
	                         	<c:when test="${ not empty requestScope.imgList }">
		                         	<c:forEach var="r" items="${ requestScope.imgList }">
			                         	<img src="${ r.revImgUrl }" style="width: 200px; height: 200px;">
		                         	</c:forEach>
	                         	</c:when>
	                         	<c:otherwise>
	                         		첨부파일이 없습니다.
	                         	</c:otherwise>
	                         	</c:choose>
	                         </td>
	                    	</div>
	                    </tr>
                    </table>
                    
                    
                </div>
                
                
                <br>

                <!-- The Modal -->
				  <div class="modal fade" id="myModal">
				    <div class="modal-dialog modal-dialog-centered">
				      <div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
				          <h5 class="modal-title">* 해당 리뷰를 삭제하시겠습니까?</h5>
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        
				        <!-- Modal body -->
				        <div class="modal-body">
				          리뷰 삭제 후 복구가 불가능합니다.<br><br>
				          정말 삭제하시겠습니까?
				        </div>
				        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				          <a type="button" class="btn btn-danger" id="delete">삭제</a>
				        </div>
				        
				      </div>
				    </div>
				  </div>
  
			</div>
                
			</form>
        </div>
    </div>
    <script>
    
    	$(function(){

			let rno = ${ requestScope.list.review.revNo };
			
			$("#delete").click(function(){
				
				location.href = "deleteReview.me?rno=" + rno;
				
			});
    		
    	});
    </script>	
	
	<br><br><br><br>
	
</body>
</html>