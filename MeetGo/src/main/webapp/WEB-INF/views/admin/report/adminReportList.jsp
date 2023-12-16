<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>신고 목록</title>
	<style>
        .outer {
            width: 1000px;
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
            width: 100%;
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
        #pagingBtn-area {
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
			<option selected>전체</option>
			<option>미확인</option>
			<option>처리대기</option>
			<option>처리완료</option>
		</select>
	</div>
	
	<div align="center" id="list-area" class="table table-borderless table-hover">
		<table id="report-list">
			<thead>
				<tr>
					<th>신고 번호</th>
					<th>신고된 회원</th>
					<th>신고한 회원</th>
					<th style="width: 30%;">신고 유형</th>
					<th>신고일</th>
					<th>처리상태</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>000001</td>
				<td>jongD97</td>
				<td>js_Lee21</td>
				<td>저작권 침해</td>
				<td>2023.11.29</td>
				<td>처리대기</td>
			</tr>
			</tbody>
		</table>
	</div>
	
	<div align="center" id="pagingBtn-area">
		<button class="pagingBtn">prev</button>
		<button class="pageBtn">1</button>
		<button class="pageBtn">2</button>
		<button class="pagingBtn">next</button>
	</div>

</div>
</body>
</html>