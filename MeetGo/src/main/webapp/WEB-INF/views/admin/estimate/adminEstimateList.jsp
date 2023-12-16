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
	
	<jsp:include page="../../common/header.jsp" />
	<br>	
	
    <div style="width: 80%; margin: auto; min-height: 400px;">
        
            <br>
            <table style="width: 70%; margin: auto; text-align:center;" id="type">
                <tr>
					<td class="type" style="width:20%; border-bottom: 3px solid #2A8FF7"><h4><b>진행중인 계약</b></h4></td>                
					<td class="type" style="width:20%;"><h4><b>완료된 계약</b></h4> </td>
               </tr>
            </table>
			
            <br><br><br>
        	<div id="inCom">
	            <table class="table-hover" align="center">
	                <thead style="height: 35px;">
	                    <tr >
	                        <th style="width: 10%;">계약번호</th>
	                        <th style="width: 25%;">계약명</th>
	                        <th style="width: 10%;">고수번호</th>
	                        <th style="width: 10%;">고객번호</th>
	                        <th style="width: 20%;">시작일</th>
	                        <th style="width: 15%;">현재상태</th>
	                    </tr>
	                </thead>
	                
			                <tbody id="inComTbody">
				                    
			                </tbody>
	                	
	                		<!-- 
	                		<tbody>
	                			<tr>
	                				<td colspan="6" class="none">현재 진행중인 견적서가 없습니다.</td>
	                			</tr>
	                		</tbody> -->
	            </table>
	            
	            <br><br><br><br>
		            <div id="pagingArea">
	                	
	            	</div>
        	</div>
            
    </div>
    
    <script>
    	$(function(){
    		
    		inComEst(1);
    		
    		let $inCom = $("#type").find(".type").eq(0);
    		let $com = $("#type").find(".type").eq(1);
    		
    		$inCom.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$com.css("border-bottom", "none");
    			
    			inComEst(1);
    			
    		});
    		
    		$com.click(function(){
    			$(this).css("border-bottom", "3px solid #2A8FF7");
    			$inCom.css("border-bottom", "none");
    			
    			comEst(1);
    		});
    		
    	});
    	
    	function inComEst(page){
    		
    		$('#inComTbody').empty();
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
	                	$('#inComTbody').append(content);
	    		    }
	    		    
	    		    let paging = '';
	    		    	
	    		    if(data.pi2.currentPage == 1){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&lt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="inComEst(' + (data.pi2.currentPage - 1) + ')">&lt;</button>';
	    		    }
	    		    
	    		    for(let i = data.pi2.startPage; i <= data.pi2.endPage; i++){
	    		    	
	    		    	if(data.pi2.currentPage == i){
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:lightblue;" onclick="inComEst('+ i +')">' + i + '</button>'	    		    	
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
    		
    	function comEst(page){
    		
    		$('#inComTbody').empty();
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
	                	$('#inComTbody').append(content);
	    		    }
	    		    
	    		    let paging = '';
	    		    	
	    		    if(data.pi1.currentPage == 1){
	    		    	paging += '<button class="pagingBtn" disabled style="display:none;">&lt;</button>';
	    		    } else {
	    		    	paging += '<button class="pagingBtn" onclick="comEst(' + (data.pi1.currentPage - 1) + ')">&lt;</button>';
	    		    }
	    		    
	    		    for(let i = data.pi1.startPage; i <= data.pi1.endPage; i++){
	    		    	
	    		    	if(data.pi1.currentPage == i){
	    		    		
							paging += '<button class="pageBtn" disabled style="background-color:lightblue;" onclick="comEst('+ i +')">' + i + '</button>';	    		    	
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
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>