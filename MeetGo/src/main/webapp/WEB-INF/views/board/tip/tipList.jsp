<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


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
    * { font-family: 'Pretendard-Regular'; 
    
    } 
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

    div{
       /*border : 1px solid red; */  
    }
    .wrap{
   	
    width: 1000px;
    height: 1000px;
    margin: auto;
    }

    .content_1{
        height: 1000px;
        width: 1000px;
        float: right;
        box-sizing: border-box;

    }
    .content_title{
        width: 1000px;
        height: 100px;
        box-sizing: border-box;

    }
    .content_1_1{
        box-sizing: border-box;
        width: 1000px;
        height: 800px;
    }
    .content_1_2{
        box-sizing: border-box;
        height: 50px;
        width: 1000px;

    }
  	.content_1_3{
        box-sizing: border-box;
  		width: 1000px;
  		height: 200px;
  				
  		}
  	.content_1_title{
  		border : 1px solid hotpink;
  		box-sizing: border-box;
  		width: 1000px;
  		height: 50px;
  		
  		
  	
  	}		
  		
  
    .content_main3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
    }
    .content_main4_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;
        
    }
    .content_main4_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
    }
    
    .content_1_3_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;      
    }
    .content_1_3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
        display: flex;
        justify-content: center;
        align-items: center;

    }
    
    .tipmain{
    width: 1000px;
    height: 800px;
    	}
    .title{
    width: 1000px;
  	height: 70px;
    
    
    }
    
    .content{
    width: 1000px;
    height: 170px;
    
    }
    .tip_content{
  	cursor : pointer;
    }
    
    
   </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="../../common/side.jsp"/>

	  <div class="wrap">
       
        <div class="content_1">
            
            <div class="content_title" style="text-align: center; font-size: 28px;">        
                <p>팁과 노하우</p>               
                <hr>
            </div>
     
        <div class="tipmain">
     
       <table class="tipList">
   
    <c:forEach var="m" items="${requestScope.dtoList}">
        <tr>
            <th class="bno">
                <b style="font-size:30px;"> ${m.boardNo}</b>
            </th>

            <th class="tip_content" style=" height:40%; width:250px; ">
                <b style="font-size:25px;">
                    &nbsp; &nbsp; &nbsp;  ${m.boardTitle}
                </b>
            </th>

            <th style="width: 30%; height:200px;  font-size:20px; width:450px;">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${fn:substring(m.boardContent, 0, 10)}
                <c:if test="${fn:length(m.boardContent) > 10}">...</c:if>
            </th>

            <th>
                <img src="${m.bfilePath}" style="width: 200px; height: 250px;">
            </th>
		        </tr>
		    </c:forEach>
		</table>
		   			 </div>
		         
         
         
         
         
         
           
            <a href="tipWrite.bo">
             <button type="submit" class="btn btn-primary">글작성</button>
            </a>
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
	                    		<a class="page-link" href="tipList.bo?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
	                    	</li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                    					 end="${ requestScope.pi.endPage }"
                    					step="1">
                    	<li class="page-item">
                    		<a class="page-link" href="tipList.bo?cpage=${ p }">${ p }</a>
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
		                    	<a class="page-link" href="tipList.bo?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
		                    </li>
		                </c:otherwise>
                	</c:choose>
                
                </ul>
            </div>
             
             
      	 </div>
        

	    	<jsp:include page="../../common/footer.jsp"/>
    
    
    <script>
		$(".tipList tr").click(function() {
		    let bno = $(this).children(".bno").text();
		    location.href = "tipDetail.bo?bno=" + bno;
		});
		

		
       
    </script>
    
</body>
</html>