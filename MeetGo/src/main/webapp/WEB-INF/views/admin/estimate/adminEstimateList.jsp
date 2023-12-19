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
        width: 1400px; 
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
	<br>	
	
    <div style="width: 80%; margin: auto; min-height: 400px;">
        	
        	<br>
        	<div align="center">
                <h2><b><img id="revImg" src="<%= request.getContextPath() %>/resources/images/common/contractImg.png"> 계약 관리</b></h2></td>                
 			</div> 
        	<br>
            <table style="width: 750px; margin: auto; text-align:center;" id="type">
                <tr>
					<td class="type" style="width:250px; border-bottom: 3px solid #2A8FF7"><h4><b>진행중인 계약</b></h4></td>                
					<td class="type" style="width:250px;"><h4><b>완료된 계약</b></h4> </td>
					<td class="type" style="width:250px;"><h4><b>검색된 계약</b></h4> </td>
               </tr>
            </table>
			
            <br><br>
        	<div id="inCom">
	            <table class="table-hover" align="center">
	                <thead style="height: 35px;">
	                    <tr >
	                        <th style="width: 140px;">계약번호</th>
	                        <th style="width: 350px;">계약명</th>
	                        <th style="width: 140px;">고수번호</th>
	                        <th style="width: 140px;">고객번호</th>
	                        <th style="width: 280px;">시작일</th>
	                        <th style="width: 210px;;">현재상태</th>
	                    </tr>
	                </thead>
	                
	                <tbody id="listBody">
		                    
	                </tbody>
	            </table>
	            
	            <br><br>
	            <div id="pagingArea">
                	
            	</div>
            	
            	<br>
            	
	            <div style="width: 1500px;">
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
            <br>
    </div>
    
    <script>
    	$(function(){
    		
    		inComEst(1);
    		
    		let $inCom = $("#type").find(".type").eq(0);
    		let $com = $("#type").find(".type").eq(1);
    		let $search = $("#type").find(".type").eq(2);
    		
    		$inCom.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$com.css("border-bottom", "none");
    			$search.css("border-bottom", "none");
    			
    			inComEst(1);
    			
    		});
    		
    		$com.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$inCom.css("border-bottom", "none");
    			$search.css("border-bottom", "none");
    			
    			comEst(1);
    		});
    		
    	});
    	
    	// 진행중인 계약용 ajax
    	function inComEst(page){
    		
    		$('#listBody').empty();
    		$('#pagingArea').empty();
    		
    		$.ajax({
    		    url: "adminInComEst.ad",
    		    dataType: "json",
    		    data: {
    		        cPage: page
    		    },
    		    success: function (data) {
    		    	let list = data.list2;
    		    	// console.log(data.pi2);
	    		    for(let i = 0; i < list.length; i++){
	    		    	let content =
	    		    		'<tr>'+
		                    '<td class="eno">'+list[i].estNo+'</td>' +
		                    '<td class="truncate">'+list[i].estTitle+'</td>' +
		                    '<td>'+list[i].gosuNo+'</td>' +
		                    '<td>'+list[i].userNo+'</td>' +
		                    '<td>'+list[i].startDate+'</td>' +
		                    '<td>';
	                    	if(list[i].status == 3){
	                    		content += '결제 대기';
	                    	} else {
	                    		content += '결제 완료';
	                    	}
	                        
	                    content += '</td>' +
	                '</tr>';
						// console.log(content);
	                	$('#listBody').append(content);
	    		    }
	    		    
	    		    let paging = '';
	    		    	
	    		    if(data.pi2.currentPage == 1){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&lt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="inComEst(' + (data.pi2.currentPage - 1) + ')">&lt;</button>';
	    		    }
	    		    
	    		    for(let i = data.pi2.startPage; i <= data.pi2.endPage; i++){
	    		    	
	    		    	if(data.pi2.currentPage == i){
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:rgb(32, 93, 154);" onclick="inComEst('+ i +')">' + i + '</button>'	    		    	
	    		    	} else{
	    		    		
							paging += '<button class="pageBtn" onclick="inComEst('+ i +')">' + i + '</button>'	    		    	
	    		    	}
	    		    	
	    		    }
	    		    
	    		    if(data.pi2.currentPage == data.pi2.endPage){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&gt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="inComEst(' + (data.pi2.currentPage + 1) + ')">&gt;</button>'
	    		    }
	    		    
	    		    $('#pagingArea').append(paging);
	    		    
	    		    $(".table-hover>tbody>tr td:not(:last-child)").click(function() {
	        			
	        			let eno = $(this).siblings(".eno").text();
	        			// console.log(eno);
	        			location.href = "adminEstimateDetail.ad?eno=" + eno;
	        		});
	        		
	    		    
    		    },
    		    error: function () {
    		        console.log("실패");
    		    }
    		});
    	}
    	
    	// 완료된 계약용 ajax
    	function comEst(page){
    		
    		$('#listBody').empty();
    		$('#pagingArea').empty();
    		
    		$.ajax({
    		    url: "adminComEst.ad",
    		    dataType: "json",
    		    data: {
    		        cPage: page
    		    },
    		    success: function (data) {
    		    	let list = data.list1;
    		    	console.log(data);
	    		    for(let i = 0; i < list.length; i++){
	    		    	let content =
    		    		'<tr>'+
	                    '<td class="eno">'+list[i].estimate.estNo+'</td>' +
	                    '<td class="truncate">'+list[i].estimate.estTitle+'</td>' +
	                    '<td>'+list[i].estimate.gosuNo+'</td>' +
	                    '<td>'+list[i].estimate.userNo+'</td>' +
	                    '<td>'+list[i].estimate.startDate+'</td>' +
	                    '<td>서비스 완료</td>' +
	                	'</tr>';
	                	
						// console.log(content);
	                	$('#listBody').append(content);
	    		    }
	    		    
	    		    let paging = '';
	    		    	
	    		    if(data.pi1.currentPage == 1){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&lt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="comEst(' + (data.pi1.currentPage - 1) + ')">&lt;</button>';
	    		    }
	    		    
	    		    for(let i = data.pi1.startPage; i <= data.pi1.endPage; i++){
	    		    	
	    		    	if(data.pi1.currentPage == i){
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:rgb(32, 93, 154);" onclick="comEst('+ i +')">' + i + '</button>';	    		    	
	    		    	} else{
	    		    		
							paging += '<button class="pageBtn" onclick="comEst('+ i +')">' + i + '</button>';	    		    	
	    		    	}
	    		    	
	    		    }
	    		    
	    		    if(data.pi1.currentPage == data.pi1.endPage){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&gt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="comEst(' + (data.pi1.currentPage + 1) + ')">&gt;</button>';
	    		    }
	    		    
	    		    $('#pagingArea').append(paging);
	    		    
	    		    $(".table-hover>tbody>tr td:not(:last-child)").click(function() {
	        			
	        			let eno = $(this).siblings(".eno").text();
	        			// console.log(eno);
	        			location.href = "adminEstimateDetail.ad?eno=" + eno;
	        		});
	    		    
    		    },
    		    error: function () {
    		        console.log("실패");
    		    }
    		});
    	}
    	
    	// 검색된 계약용 ajax
    	$("#searchForm").submit(function(event) {
	        event.preventDefault();
	        let keyword = $("#keyword").val();
	        let condition = $("#condition").val();
	        search(1, keyword, condition);
	        
	        let $inCom = $("#type").find(".type").eq(0);
    		let $com = $("#type").find(".type").eq(1);
	        let $search = $("#type").find(".type").eq(2);
    		
   			$search.css("border-bottom", "3px solid #2A8FF7");
   			$inCom.css("border-bottom", "none");
   			$com.css("border-bottom", "none");
    	
	    });
    	
		function search(page, keyword, condition){
    		
    		$('#listBody').empty();
    		$('#pagingArea').empty();
    		
    		$.ajax({
    			url: "adminEstimateSearch.ad",
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
                            '<td class="eno">' + list[i].estimate.estNo + '</td>' + 
                            '<td class="truncate">' + list[i].estimate.estTitle + '</td>' + 
                            '<td>' + list[i].gosuName + '(' + list[i].estimate.gosuNo + ')' + '</td>' +
                            '<td>' + list[i].userName + '(' + list[i].estimate.userNo + ')' + '</td>' +
		                	'<td>' + list[i].estimate.startDate + '</td>' +
		                	'<td>';
		    		    	if(list[i].estimate.status == 3){
	                    		content += '결제 대기';
	                    	} else if (list[i].estimate.status == 4)  {
	                    		content += '결제 완료';
	                    	} else {
	                    		content += '서비스 완료';
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
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:rgb(32, 93, 154);" onclick="search('+ i + ', ' + keyword + ', ' + condition + ')">' + i + '</button>'	    		    	
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
	    		    
					$(".table-hover>tbody>tr td:not(:last-child)").click(function() {
	        			
	        			let eno = $(this).siblings(".eno").text();
	        			console.log(eno);
	        			location.href = "adminEstimateDetail.ad?eno=" + eno;
	        		});
                	
    			},
    			error: function(){
    				console.log("실패");
    			}
    		});
    		
    	}
    	
    	
    	$(function() {
    		
    		$(".table-hover>tbody>tr td:not(:last-child)").click(function() {
    			
    			let eno = $(this).siblings(".eno").text();
    			// console.log(eno);
    			location.href = "adminEstimateDetail.ad?eno=" + eno;
    		});
    		
    		
    		$("#review").click(function(){
    			let eno = $("#estNo").val();
    			// console.log(eno);
    			
    			location.href = "reviewWrite.me?eno=" + eno;
    		});

    		$(".review-info").click(function(){
    			
    			let rno = $(this).closest('tr').find(".revNo").val();

    			// console.log(rno);
    			
    			location.href = "reviewDetail.me?rno=" + rno;
    		});
    	
    	});
		    	
    </script>
	<br><br><br><br>
</body>
</html>