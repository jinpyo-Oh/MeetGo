<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 목록</title>
<style>
	.outer {
	     width: 1400px;
	     margin: 50px auto 100px;
	     box-sizing: border-box;
	     font-family: 'Pretendard-Regular';
 	 }
    /* 폰트 */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    
    #titleText{
    	font-size: 30px;
		font-weight: bolder;
    }
    .bi-postcard{
    	vertical-align: text-bottom;
    }
    .searchBtn{
    	width:100px;
    	height:40px;
    	border:0px;
    	border-radius:5px;
    	background-color:#2a91f7c0;
    	color:white;
    	font-size:18px;
    	box-sizing: border-box;
    }
    .searchBtn:hover{ cursor:pointer; }
    #adminPofol-list{
	    width: 100%;
	    margin:auto;	
	    margin-top:50px;
	    text-align: center;
    }

</style>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp"/>

	<input type="hidden" id="currentPage" name="currentPage" value="1">
	
	<div class="outer">
		<div align="center" style="margin-bottom:30px;">
		<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="#2a91f7" class="bi bi-postcard" viewBox="0 0 16 16">
		<path fill-rule="evenodd" d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4Zm7.5.5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7ZM2 5.5a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5Zm0 2a.5.5 0 0 1 .5-.5H6a.5.5 0 0 1 0 1H2.5a.5.5 0 0 1-.5-.5ZM10.5 5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3ZM13 8h-2V6h2v2Z"/>
		</svg>&nbsp;
		<span id="titleText">포트폴리오 관리</span>
		<br>
		</div>
		<div align="center">
		<input type="text" id="searchKeyword" style="width:500px; display:inline;" class="form-control">
		<button class="searchBtn" type="button">검색하기</button>
		</div>
		<div align="center" id="list-area" class="table table-borderless table-hover">
			<table id="adminPofol-list">
			<thead>
				<tr>
					<th>포트폴리오 번호</th>
					<th>포트폴리오 제목</th>
					<th>포트폴리오 작성자</th>
					<th>포트폴리오 작성일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody id="report-list-content">
			</tbody>
			</table>
		</div>
	
		<div align="center" id="paging-area">
		</div>

	
	</div>
	
	<script> // 페이징처리
	
		let currentPage = 1;
		
      	function paging(num) {
      		currentPage = num;
      		$("#currentPage").val(num);
      		scrollToTop();
      	}
      	
      	function prevPage(num) {
      		$("#currentPage").val(num - 1);
      		scrollToTop();
      	}
      	
      	function nextPage(num) {
      		$("#currentPage").val(num + 1);
      		scrollToTop();
      	}
      	
       // 화면 상단으로 스크롤하는 함수
       function scrollToTop() {
           window.scrollTo({
               top: 0,
               behavior: 'smooth' // 부드럽게
           });
       }
       
       function adminPofolDetail(pno) {
    	   location.href = "reportDetail.ad?pno=" + pno;
       }
      </script>
      
      <script> // 포폴 전체조회 및 검색
	
      
      
      function selectAdminPofolList() {
    	  
    	  let $keyword = $("#searchKeyword").val();
    	  let $currentPage = $("#currentPage").val();
    	  
    	  $.ajax({
    		  url : "selectAdminPofolList.ad",
    		  data : {keyword : $keyword,
    			  	  currentPage : $currentPage},
    		  type : "get",
    		  success : function() {
    			  
    		  },
    		  error : function() {
    			  alert("통신 실패");
    		  }
    			  
    	  })
    	  
      }
      
      </script>
	
</body>
</html>