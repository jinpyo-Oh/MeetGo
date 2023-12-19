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
    
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

    .wrap{
   	
   	font-family: 'Pretendard-Regular'; 
    width: 1000px;
    height: 1000px;
    margin: auto;
    }
	#tipListTable th{ height: 100px; padding-left:40px; padding-right:40px;}
	
    .content_1{
        width: 1000px;
        float: right;
        box-sizing: border-box;

    }
    .content_title{
        width: 1000px;
        box-sizing: border-box;

    }
    .content_1_1{
        box-sizing: border-box;
        width: 1000px;
    }
    .content_1_2{
        box-sizing: border-box;
        width: 1000px;

    }
  	.content_1_3{
        box-sizing: border-box;
  		width: 1000px;
  				
  		}
  	.content_1_title{
  		border : 1px solid hotpink;
  		box-sizing: border-box;
  		width: 1000px;
  	}		
    .content_main3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
    }
    .content_main4_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        
    }
    .content_main4_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
    }
    .content_1_3_1{
        width: 70%;
        box-sizing: border-box;
        float: left;      
    }
    .content_1_3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .tipmain{
	    width: 1000px;
    	}
    .content{
   	 width: 1000px;
    
    }
    .tip_content{
  		cursor : pointer;
    }
  
    .tip_content:hover {
  		text-decoration : underline;
  		cursor : pointer;
    }    
    
   </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="../../common/side.jsp"/>

	  <div class="wrap">
       
        <div class="content_1">
            <br><br><br>
            <div class="content_title" style="text-align: center; font-size: 28px;">        
                <p>팁과 노하우</p>               
                <hr>
            </div>
     
        <div class="tipmain" align="center">
     
       <table class="tipList" id="tipListTable" >
   
    	<c:forEach var="m" items="${requestScope.dtoList}">
        <tr>
            <th class="bno" >
                <b style="font-size:30px;"> ${m.boardNo}</b>
            </th>

            <th class="tip_content">
                <b style="font-size:25px;">
                     ${m.boardTitle}
                </b>
            </th>

            <th style="font-size:20px; ">
                ${fn:substring(m.boardContent, 0, 10)}
                <c:if test="${fn:length(m.boardContent) > 10}">...</c:if>
            </th>

            <th>
                <img src="${m.bfilePath}" style="width:200px; height:200px;">
            </th>
		        </tr>
		    </c:forEach>
		</table>
		   			 </div>
        	
        	<div class="footer">
            <a href="tipWrite.bo">
            <c:choose>
            	<c:when test="${  not empty sessionScope.loginUser }">
		            <button type="submit" class="btn btn-primary" align="right">글작성</button>            
            	</c:when>
            </c:choose>
            </a>
            
            <br><br><br>
            
               <div id="pagingArea" style="" >
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