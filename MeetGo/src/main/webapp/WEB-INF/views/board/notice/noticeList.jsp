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
    * { font-family: 'Pretendard-Regular'; 
    
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
.center-button {
    display: block;
    margin: auto;
}
      
</style>
</head>
<body>
    	<jsp:include page="../../common/header.jsp"/>

 <div class="wrap">
        <div class="gosu_header">
            <br>
            <h2>공지사항</h2>
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
                    <th style> &nbsp; &nbsp; &nbsp;
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
	                        ${ m.userNo }
	                       
	                    </td>
	                    <td class="gosu_content_4"
	                    style="text-align: center;"
	                    > ${ m.createDate }
	                    </td>            
	               </tr>
	            </table>   
            
            
            <a href="noticeWrite.bo">
                <button type="submit" class="btn btn-primary" >글작성</button>
            </a>
       </div>
       <div class="list-bar">
        <nav aria-label="Page navigation example" >
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="t">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
       <div class="gosu_footer" >
   		
   		
       </div>
      
    </div>
	    	<jsp:include page="../../common/footer.jsp"/>
	
	
	<script>
	$(function() {
		
		$("#baordList > tr").click(function() {
			
			let mno = $(this).children(".mno").text();
			
			
			
			location.href = "detail.go?mno=" + bno;
		});
	});
	</script>
	 
</body>
</html>