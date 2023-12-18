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
	function selectBoard(status){
 
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
