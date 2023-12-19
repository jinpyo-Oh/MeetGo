<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>포트폴리오</title>
	
	<style>
        /* 전체 div 영역 */
        .outer {
            width: 1000px;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
            box-sizing: border-box;
        }
        img {
            object-fit: cover !important;
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

        .boardTitleText {
            text-align: center;
            font-size: 30px;
            letter-spacing: 3px;
        }

        #pofol-view-option {
            width: 100px;
        }

        #btn-write {
            width: 100px;
            height: 40px;
            font-size: 20px;
            border: 0px;
            border-radius: 5px;
            color: white;
            background-color: darkgray;
        }

        #btn-write:hover {
            background-color: rgb(136, 136, 136);
        }

        .btn-cateMain {
            width: 120px;
            height: 30px;
            margin-top: 20px;
            margin-left: 5px;
            margin-right: 5px;
            border: 0px;
            border-radius: 5px;
            color: white;
            background-color: #2a91f7c0;
        }

        /* 게시글 영역 */
        .pofol-line {
            margin: auto;
            margin-bottom: 80px;
            width: 100%;
            min-height: 1000px;
        }

        .pofol-obj {
            width: 300px;
            text-align: center;
            margin-bottom: 80px;
        }

        .pofol-obj img:hover {
            transform: scale(1.05);
            cursor: pointer;
        }

        /* 포폴 제목 / 조회수 / 카테고리명 */
        .pofol-title {
            font-size: 24px;
            margin-top: 10px;
        }

        .view-count {
            display: inline-block;
            margin-left: 2px;
            font-size: 24px;
            margin-top: -5px;
        }

        .ctgrName {
            border: 0px;
            border-radius: 5px;
            margin-top: 20px;
            font-size: 18px;
            background-color: #09a5098a;
            box-sizing: border-box;
            color: white;
            width: 100px;
        }

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
<jsp:include page="../../common/header.jsp"/>
<jsp:include page="../../common/side.jsp"/>

<script>
    function checkUserStatus() {
        let userStatus = ${sessionScope.loginUser.enrollStatus};
        if (userStatus == 1) {
            alert("고수 회원만 글 작성이 가능합니다.");
            return false;
        }
        return true;
    }
</script>

<div class="outer">
	<p class="boardTitleText">포트폴리오</p>
	<div style="display:flex;">
		<div align="left" style="width:50%; margin-left:50px;">
			<!-- 로그인 시 보여짐 / 일반회원이 클릭시 alert -->
			<c:if test="${not empty sessionScope.loginUser}">
				<form action="sendPofolWrite.po" method="post" onsubmit="return checkUserStatus();">
					<input type="hidden" value="${sessionScope.loginUser.userNo}">
					<c:choose>
						<c:when test="${  not empty sessionScope.loginUser }">
							<button type="submit" id="btn-write">글작성</button>
						</c:when>
					</c:choose>
				</form>
			</c:if>
		</div>
		<div align="right" style="width:50%;">
			<select id="pofol-view-option" class="form-control">
				<option selected value="recent">최신순</option>
				<option value="views">조회순</option>
			</select>
		</div>
	</div>
	<hr>
	
	<!-- 카테고리 선택 블럭 -->
	<div id="category-main-select" align="center">
		<!--1-->
		<button class="btn-cateMain" type="button" value="0">전체</button>
		<button class="btn-cateMain" type="button" value="1">홈 / 리빙</button>
		<button class="btn-cateMain" type="button" value="2">취미/교육</button>
		<button class="btn-cateMain" type="button" value="3">건강 / 미용</button>
		<button class="btn-cateMain" type="button" value="4">디자인</button>
		<br>
		<!--2-->
		<button class="btn-cateMain" type="button" value="5">이벤트</button>
		<button class="btn-cateMain" type="button" value="6">IT / 개발</button>
		<button class="btn-cateMain" type="button" value="7">비즈니스</button>
		<button class="btn-cateMain" type="button" value="8">법률 / 행정</button>
		<button class="btn-cateMain" type="button" value="9">기타</button>
	</div>
	
	<br><br>
	
	<div class="pofol-line">
		<div style="display:flex; flex-wrap:wrap; width:900px; margin:auto;" id="wraper">
		</div>
	</div>
	<!-- 현재 페이지번호 -->
	<input type="hidden" id="currentPage" name="currentPage" value="1">
	
	<!-- ajax 통신으로 append해서 출력 -->
	<div id="paging-area" align="center">
	</div>
	
	<!-- 페이징처리 스크립트 -->
	<script>

        let currentPage = 1;

        function paging(num) {
            currentPage = num;
            $("#currentPage").val(num);
            showpofolList(category, standard);
            scrollToTop();
        }

        function prevPage(num) {
            $("#currentPage").val(num - 1);
            showpofolList(category, standard);
            scrollToTop();
        }

        function nextPage(num) {
            $("#currentPage").val(num + 1);
            showpofolList(category, standard);
            scrollToTop();
        }

        // 화면 상단으로 스크롤하는 함수
        function scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth' // 부드럽게
            });
        }
	</script>
	
	<script>

        let category = 0;
        let standard = $("#pofol-view-option").val();

        function sendPofolDetail(pno) {
            location.href = "pofolDetail.po?pno=" + pno;
        }

        $(function () {

            showpofolList(category, standard);
            sendPofolDetail(pno);

        })

        $("#pofol-view-option").on("change", function () {
            $("#currentPage").val(1);
            standard = $(this).val();
            showpofolList(category, standard);
        });

        $(".btn-cateMain").on("click", function () {
            $("#currentPage").val(1);
            category = $(this).val();
            showpofolList(category, standard);

        });

        function showpofolList(num, option) {

            let $category = num; // 대분류 번호
            let $standard = option; // 정렬기준
            let $currentPage = $("#currentPage").val();

            $("#wraper").empty();
            $("#paging-area").empty();

            $.ajax({
                url: "pofolListOrderBy.po",
                type: "get",
                data: {
                    standard: $standard,
                    category: $category,
                    currentPage: $currentPage
                },
                success: function (result) {

                    let list = result.list;
                    let firstImgList = result.firstImgList;
                    let startPage = result.pi.startPage;
                    let endPage = result.pi.endPage;
                    let maxPage = result.pi.maxPage;
                    let currentPage = result.pi.currentPage;

                    for (let i = 0; i < list.length; i++) {
                        let resultStr = '<div class="pofol-obj">'
                            + '<img src="' + list[i].firstImg + '" width="250px" height="250px" onclick="sendPofolDetail(' + list[i].pofol.pofolNo + ');"><br>'
                            + '<div style="width:250px; margin:auto; text-align:left;">'
                            + '<button class="ctgrName" disabled>' + list[i].categorySmallName + '</button>'
                            + '<p class="pofol-title">' + list[i].pofol.pofolTitle + '</p>'
                            + '<span class="view-count">'
                            + '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">'
                            + '<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>'
                            + '<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>'
                            + '</svg>&nbsp;'
                            + list[i].pofol.pofolVisited
                            + '</span>'
                            + '</div>'
                            + '</div>'

                        $("#wraper").append(resultStr);
                    }

                    let prevButton = $('<button type="button" class="pagingBtn" onclick="prevPage(' + currentPage + ')">Prev</button>');

                    // prev버튼 조건에 따른 숨김처리
                    if (startPage > maxPage) {
                        prevButton.css("display", "none");
                    }
                    if (parseInt($("#currentPage").val()) == 1) {
                        prevButton.css("display", "none");
                    }
                    $('#paging-area').append(prevButton);


                    for (let p = startPage; p <= endPage; p++) {

                        let pagingBtn = '';
                        pagingBtn = $('<button type="button" class="pageBtn" onclick="paging(' + p + ');">' + p + '</button>');

                        if (parseInt($("#currentPage").val()) == p) {
                            pagingBtn.attr("disabled", true);
                            pagingBtn.css("background-color", "rgb(32, 93, 154)");
                        }

                        $('#paging-area').append(pagingBtn);
                    }

                    // 다음버튼
                    let nextButton = $('<button type="button" class="pagingBtn" onclick="nextPage(' + currentPage + ')">Next</button>');
                    if (parseInt($("#currentPage").val()) == maxPage) {
                        nextButton.css("display", "none");
                    }
                    $('#paging-area').append(nextButton);

                },
                error: function () {
                    console.log("fail");
                }
            });
        }
	</script>

</div>

<jsp:include page="../../common/footer.jsp"/>

</body>
</html>