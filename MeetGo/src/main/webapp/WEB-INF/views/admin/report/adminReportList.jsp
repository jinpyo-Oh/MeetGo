<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 목록</title>
	<style>
        .outer {
            width: 1200px;
            margin: 20px auto 100px;
            box-sizing: border-box;
        }
        /* 폰트 */
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        .outer {
            font-family: 'Pretendard-Regular';
        }

        #report-pageTitle {
            font-size: 30px;
            font-weight: bolder;
        }

        #report-pageTitle > svg {
            margin-bottom: 5px;
        }

        #search-option {
            width: 150px;
            margin-top: 30px;
        }

        /* 리스트 영역 */
        #list-area {
            width: 80%;
            margin: auto;
            margin-top: 30px;
        }

        #report-list {
            width: 960px;
            text-align: center;
        }

        #report-list > thead {
            background-color: #2a91f7c0;
            color: white;
        }

        #report-list > tbody:hover {
            cursor: pointer;
        }

        /* 페이징버튼 영역 */
        #paging-area {
            margin-top: 80px;
        }

        .pagingBtn {
            border: 0;
            border-radius: 5px;
            width: 80px;
            height: 40px;
            font-size: 20px;
            color: white;
            background-color: #2a91f7c0;
        }

        .pageBtn {
            border: 0;
            border-radius: 5px;
            width: 40px;
            height: 40px;
            font-size: 20px;
            color: white;
            background-color: #2a91f7c0;
        }
	</style>
</head>
<body>
<jsp:include page="../common/adminHeader.jsp"/>
<div class="outer">
	<div align="center">
		<p id="report-pageTitle">
			<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="rgba(204, 29, 29)"
				 class="bi bi-person-exclamation" viewBox="0 0 16 16">
				<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z"/>
				<path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0Zm-3.5-2a.5.5 0 0 0-.5.5v1.5a.5.5 0 0 0 1 0V11a.5.5 0 0 0-.5-.5Zm0 4a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1Z"/>
			</svg>
			신고내역 관리
		</p>
		<hr>
	</div>
	
	<div align="right">
		<select id="search-option" class="form-control">
			<option value="9" selected>전체</option>
			<option value="0">미확인</option>
			<option value="1">처리대기</option>
			<option value="2">처리완료</option>
		</select>
	</div>
	
	<!-- 현재 페이지번호 -->
    <input type="hidden" id="currentPage" name="currentPage" value="1">
	
	<div align="center" id="list-area" class="table table-borderless table-hover">
		<table id="report-list">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>신고된 회원</th>
					<th>신고한 회원</th>
					<th style="width: 30%;">신고 유형</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody id="report-list-content">
			
			</tbody>
		</table>
	</div>
	
	<div align="center" id="paging-area">
	</div>
	
	<script>
	
		let currentPage = 1;
		
      	function paging(num) {
      		currentPage = num;
      		$("#currentPage").val(num);
      		selectReportList(option);
      		scrollToTop();
      	}
      	
      	function prevPage() {
      		num = parseInt(currentPage) - 1;
      		$("#currentPage").val(num);
      		selectReportList(option);
      		scrollToTop();
      	}
      	
      	function nextPage() {
      		num = parseInt(currentPage) + 1;
      		$("#currentPage").val(num);
      		selectReportList(option);
      		scrollToTop();
      	}
      	
       // 화면 상단으로 스크롤하는 함수
       function scrollToTop() {
           window.scrollTo({
               top: 0,
               behavior: 'smooth' // 부드럽게
           });
       }
       
       function reportDetail(rno) {
    	   location.href = "reportDetail.ad?rno=" + rno;
       }
      </script>
	
	<script>
	
		let option = $("#search-option").val();
		
		$(function(){
			selectReportList(9);
		})
		
		// 조건 변경 시 실행
		$("#search-option").on("change", function() {
	       option = $(this).val();
	       currentPage = 1;
	       $("#currentPage").val(1);
	       selectReportList(option);
		});
		
		function selectReportList(option){
		
			let $option = option;
			let $currentPage = $("#currentPage").val();
			
			$("#report-list-content").empty();
			$("#paging-area").empty();
			
			$.ajax({
				type : "get",
				url : "selectReportList.ad",
				data : {option : $option,
						currentPage : $currentPage},
				success : function(result){
					
					let list = result.list;
					let startPage = result.pi.startPage;
					let endPage = result.pi.endPage;
					let maxPage = result.pi.maxPage;
					let currentPage = result.pi.currentPage;
					
					for(let i = 0; i < list.length; i++){
						
						let reportStatus = "";
						
						if(list[i].reportStatus == 0){
							reportStatus = '<span style="color:red;">미확인</span>';
						} else if (list[i].reportStatus == 1){
							reportStatus = '<span style="color:#2a91f7c0;">처리대기</span>';
						} else {
							reportStatus = '<span style="color:green;">처리완료</span>';
						}
						
						let resultStr = '<tr onclick="reportDetail(' + list[i].reportNo + ')">'
										+ '<td>' + list[i].reportNo +  '</td>'
										+ '<td>' + list[i].reportedUser +  '</td>'
										+ '<td>' + list[i].reportUser +  '</td>'
										+ '<td>' + list[i].reportCategory +  '</td>'
										+ '<td>' + reportStatus +  '</td>'
										+ '</tr>';
										
						$("#report-list-content").append(resultStr);
					}
					
					let prevButton = $('<button type="button" class="pagingBtn" onclick="prevPage()">Prev</button>');
					
					// prev버튼 조건에 따른 숨김처리
					if(startPage > maxPage){
						prevButton.css("display", "none");
					}
					if(parseInt($("#currentPage").val()) == 1){
						prevButton.css("display", "none");
					}
					
					$('#paging-area').append(prevButton);
					
					for(let p = startPage; p <= endPage; p++){
    					
    					let pagingBtn = '';
    					pagingBtn = $('<button type="button" class="pageBtn" onclick="paging(' + p + ');">' + p + '</button>');
    					
    					if (parseInt($("#currentPage").val()) == p) {
    				        pagingBtn.attr("disabled", true);
    				        pagingBtn.css("background-color", "rgb(32, 93, 154)");
    				    }
    			
    					$('#paging-area').append(pagingBtn);
    				}     
    				
    				// 다음버튼
    				let nextButton = $('<button type="button" class="pagingBtn" onclick="nextPage()">Next</button>');
	    				if(parseInt($("#currentPage").val()) == maxPage){
	    					nextButton.css("display", "none");
	    				}
	    				$('#paging-area').append(nextButton);

				},
				error : function() {
					alert("통신 실패");
				}
			})
			
		}
	</script>

</div>
</body>
</html>