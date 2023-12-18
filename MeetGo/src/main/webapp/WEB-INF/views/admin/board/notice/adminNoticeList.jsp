<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<style>
        #list-area {
            width: 1000px;
            height: 700px;
            align-items: center;
            text-align: center;
            margin: auto;
            margin-bottom: 20px;
        }
        .pageTitleArea{
            margin-top: 20px;
        }
        .pageTitleArea hr {
            width: 1000px;
            border: 1px solid black;
        }
        .pageTitle{
            font-size: 30px;
        }
	</style>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp"/>
<script>
	selectBoard(3, 1);

	function selectBoard(status , cPage){
		$('#chatList > tbody').empty();
		$('#button-area').empty();
		$.ajax({
			url : "selectBoardList",
			method : "get",
			data : {
				status : status,
				cPage : cPage
			},
			success : function (data){
				let list = data.list;
				let pi = data.pi;
				for (let i = 0; i < list.length; i++) {
					let content =
							'<tr>' +
								'<td width="10%">'+list[i].boardNo+'</td>' +
								'<td width="20%">'+list[i].boardTitle+'</td>' +
								'<td width="15%">'+list[i].boardContent+'</td>' +
								'<td width="15%">'+list[i].createDate+'</td>' +
								'<td width="10%">'+list[i].boardCount+'</td>' +
							'</tr>';
					$('#chatList > tbody').append(content);
				}
				let paging = '';
				if (pi.currentPage == 1) {
					paging += '<button class="pagingBtn" disabled style="background-color: ">이전</button>'
				} else {
					paging += '<button class="pagingBtn" onclick="selectBoard(3, ' + (pi.currentPage - 1) + ')">이전</button>'
				}
				for (let i = pi.startPage; i <= pi.endPage; i++) {
					paging += '<button class="pageBtn" onclick="selectBoard(3, ' + i + ')">' + i + '</button>'
				}
				if (pi.currentPage == pi.endPage) {
					paging += '<button class="pagingBtn" disabled style="background-color: ">다음</button>'
				} else {
					paging += '<button class="pagingBtn" onclick="selectBoard(3, ' + (pi.currentPage + 1) + ')">다음</button>'
				}
				$('#button-area').append(paging);

			},
			error : function (){
				console.log("공지사항 리스트 조회 실패");
			}
		})
	}
</script>
<div class="pageTitleArea" align="center">
	<p class="pageTitle">
		<img style="width: 40px; height: 40px" src="<%=request.getContextPath()%>/resources/images/chat/notice-icon.png">
		공지사항 관리
	</p>
	<hr>
</div>
<div align="center" id="list-area" class="table table-borderless table-hover">
	<div class="search-box" style="display: flex; align-items: center; justify-content: flex-end;">
		<select id="searchType" style="box-sizing: border-box; height: 30px; ">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="number">글 번호</option>
		</select>
		<input type="text" class="" id="searchInput" placeholder="검색어 입력">
		<button class="btn meetgo-btn"  style="height: 30px; box-sizing: border-box" type="button" onclick="">
			<i class="fas fa-search fa-sm"></i>
		</button>
	</div>
	<table class="chatTable" id="chatList">
		<thead>
			<tr>
				<td width="10%">게시글 번호</td>
				<td width="20%">제목</td>
				<td width="15%">게시글 등록일</td>
				<td width="15%">게시글 수정일</td>
				<td width="10%">게시글 조회수</td>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
</div>
<div align="center" id="button-area">
</div>
</body>
</html>
