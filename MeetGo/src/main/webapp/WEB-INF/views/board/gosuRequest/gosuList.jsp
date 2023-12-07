<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    .wrap { font-family: 'Pretendard-Regular'; 
    
    } 
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

.wrap{
    margin: auto;
    height: 1000px;
    width: 1000px;
    box-sizing: border-box;
}
.gosu_header{
    height: 100px;
    width: 1000px;
    box-sizing: border-box;
    text-align: center;
}
.gosu_body_1{
    height: 40px;
    box-sizing: border-box;
    width: 1000px;
    display: flex;
     
}
.gosu_body_1_1{

    height: 40px;
    box-sizing: border-box;
    width: 10%;
    float: left;
}
.gosu_body_1_2{
    
    height: 40px;
    box-sizing: border-box;
    width: 70%;
    float: center;
    text-align: center;
}
.gosu_body_1_3{
    height: 40px;
    box-sizing: border-box;
    width: 20%;
    float: right;
}
.gosu_main{

    width: 1000px;
    box-sizing: border-box;
    height: 630px;
    
}
table, th, td {

  border-collapse: collapse;
  width: 1000px;
}
.gosu_notice{
    box-sizing: border-box;

    width: 70%;
}
.gosu_first{
    background-color: #e8f6ff;

}
.gosu_content{
    box-sizing: border-box;

    width: 1000px;
    height: 630px;
}
.gosu_content_1{
    width: 80px;
    height: 10px;
    box-sizing: border-box;

}
.gosu_content_2{
    width: 850px;
    box-sizing: border-box;

}
.gosu_content_3{
    width: 100px;
    box-sizing: border-box;

}
.gosu_content_4{
    width: 130px;
    box-sizing: border-box;

}
.gosu_footer{
    float: center;
    width: 1000px;
    height: 100px;
    box-sizing: border-box;

}
.list-bar {
  text-align: center;
  margin-top: 20px; /* You can adjust the margin-top value as needed */
}

.pagination {
  display: inline-block;
  margin: 0;
  padding: 0;
}

.pagination li {
  display: inline;
  margin-right: 5px; /* Adjust the spacing between pagination items as needed */
}

.pagination a {
  text-decoration: none;
  color: #007bff; /* You can set the color to your preference */
  padding: 8px 12px;
  border: 1px solid #007bff; /* You can set the border color to your preference */
  border-radius: 5px;
}

.pagination a:hover {
  background-color: #007bff; /* You can set the hover background color to your preference */
  color: #fff; /* You can set the hover text color to your preference */
}
      
</style>
</head>
<body>
    	<jsp:include page="../../common/header.jsp"/>
    		
		 <jsp:include page="../../common/side.jsp"/>
		
		 <div class="wrap">

        
        <div class="gosu_header">
        
            <br>
            <h2>고수찾아요</h2>
            <hr>
        </div>
        <div class="gosu_body_1">
            <div class="gosu_body_1_1">
                &nbsp;&nbsp; &nbsp;&nbsp; <b>No</b>
                <hr>
            </div>
            <div class="gosu_body_1_2">
                <b>제목</b>
                <hr>
            </div>
            <div class="gosu_body_1_3">
                &nbsp;&nbsp;  &nbsp;
                <b>글쓴이</b> &nbsp;&nbsp; &nbsp;&nbsp;
                &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                <b>작성일</b>
                <hr>
         </div>
        </div>
       
       <div class="gosu_main">
        
            <table class="gosu_first">
                <tr>
                    <th> &nbsp; &nbsp; &nbsp;
                        <i class="bi bi-megaphone-fill"></i>
                    </th>
                    <th class="gosu_notice">게시판 이용안내 및 주의사항 </th>
                    <th style="text-align: center; padding-left: 9px;">관리자</th>
                    <th style="text-align: center;">2023-11-28</th>
                    
                    
                </tr>       
                        
            </table>
           <table class="gosu_content">
                <tr>
                    <td class="gosu_content_1">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        ${ m.boardNo }
                    </td>
                    <td class="gosu_content_2">
                        &nbsp;&nbsp;
                        ${ m.boardTitle } </td>
                    <td class="gosu_content_3"style="text-align: center;">
                       
                    </td>
                    <td class="gosu_content_4"
                    style="text-align: center;"
                    > ${ m.createDate }
                    </td>            
               </tr>
            </table>   
            <a href="gosuWrite.bo">
                <button type="submit" class="btn btn-primary" >글작성</button>
            </a>
             <a href="tipList.go">
                <button type="submit" class="btn btn-primary" >팁노하우게시판이동</button>
            </a>
            <a href="noticeList.go">
                <button type="submit" class="btn btn-primary" >공지시항게시판이동</button>
            </a>
       </div>
       <div class="gosu_footer" >
    
		</div>
   		   <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                		<c:when test="${ requestScope.pi.currentPage eq 1 }">
	                    	<li class="page-item disabled">
	                    		<a class="page-link" href="#">Previous</a>
	                    	</li>
                    	</c:when>
                    	<c:otherwise>
	                    	<li class="page-item">
	                    		<a class="page-link" href="gosuList.go?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
	                    	</li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                    					 end="${ requestScope.pi.endPage }"
                    					step="1">
                    	<li class="page-item">
                    		<a class="page-link" href="gosuList.go?cpage=${ p }">${ p }</a>
                    	</li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
		                    <li class="page-item disabled">
		                    	<a class="page-link" href="#">Next</a>
		                    </li>
		                </c:when>
		                <c:otherwise>
		                    <li class="page-item">
		                    	<a class="page-link" href="gosuList.go?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
		                    </li>
		                </c:otherwise>
                	</c:choose>
                
                </ul>
            </div>
       </div>
      
	    	<jsp:include page="../../common/footer.jsp"/>
	
	
	<script>
	$(function() {
		
		$("#baordList > tr").click(function() {
			
			let mno = $(this).children(".mno").text();
			
			
			
			location.href = "detail.bo?mno=" + bno;
		});
	});
	</script>
	
</body>
</html>