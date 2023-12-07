<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오</title>

    <style>
        /* 전체 div 영역 */
       .outer{
        width: 1000px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }

    /* 폰트 */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    .outer { font-family: 'Pretendard-Regular'; }

    .boardTitleText{
        text-align: center;
        font-size: 30px;
        letter-spacing: 3px;
    }
    #pofol-view-option{
        width: 100px;
    }
	#btn-write{
		width: 100px;
        height: 40px;
        font-size: 20px;
        border: 0px;
        border-radius: 5px;
        color: white;
        background-color: darkgray;
    }
    #btn-write:hover{ background-color : rgb(136, 136, 136); }

    .btn-cateMain{
        width: 120px;
        height: 30px;
        margin-top: 10px;
        margin-left: 5px;
        margin-right: 5px;
        border: 0px;
        border-radius: 5px;
        color: white;
        background-color: #2a91f7c0;
    }

    /* 게시글 영역 */
    .pofol-line{ margin: auto; margin-bottom: 80px;}
    .pofol-obj { margin: 0 auto; }
    .view-count{ display: inline-block; width: 20%; margin-left: 2px;}
    .pofol-title{ display: inline-block; width: 80%; text-align: center;}

    #pagingBtn-area{margin-top: 80px;}
    .pagingBtn{
        border: 0;
        border-radius: 5px;
        width: 80px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .pageBtn{
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
		function sendWrite() {
			let userStatus = ${ sessionScope.loginUser.userStatus }
			if(userStatus == 1){
				alert("고수 회원만 글 작성이 가능합니다.");
			} else {
				location.href="sendPofolWrite.po";
			}
		}
	</script>
	
    <div class="outer">
		<a href="pofolDetail.po">ㅇㅇ</a>
        <p class="boardTitleText">포트폴리오</p>
        <div style="display:flex;">
        <div align="left" style="width:50%; margin-left:50px;">
        	<!-- 로그인 시 보여짐 / 일반회원이 클릭시 alert -->
        	<c:if test="${ not empty sessionScope.loginUser }">
        		<button type="button" id="btn-write" onclick="sendWrite();" >글작성</button>
        	</c:if>
        </div>
        <div align="right" style="width:50%;">
            <select id="pofol-view-option" class="form-control">
                <option>최신순</option>
                <option>조회순</option>
            </select>
        </div>
        </div>
        <hr>

        <!-- 카테고리 선택 블럭 -->
        <div id="category-main-select" align="center">
            <!--1-->
            <button class="btn-cateMain" type="button">전체</button>
            <button class="btn-cateMain" type="button">홈 / 리빙</button>
            <button class="btn-cateMain" type="button">취미/교육</button>
            <button class="btn-cateMain" type="button">건강 / 미용</button>
            <button class="btn-cateMain" type="button">디자인</button>
            <br>
            <!--2-->
            <button class="btn-cateMain" type="button">이벤트</button>
            <button class="btn-cateMain" type="button">IT / 개발</button>
            <button class="btn-cateMain" type="button">비즈니스</button>
            <button class="btn-cateMain" type="button">법률 / 행정</button>
            <button class="btn-cateMain" type="button">기타</button>            
        </div>

        <br><br>
        <!-- 포트폴리오 게시글 테이블 -->
        <!-- 첫째 줄 -->
        <div class="pofol-line">
        <div style="display: flex;">
            <div class="pofol-obj">
                <img src="" width="250px" height="250px"><br>
                <div style="display: flex;">
                    <span class="view-count">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg>
                        21
                    </span>
                    <span class="pofol-title">Title</span>
                </div>    
            </div>
            <div class="pofol-obj">
                <img src="" width="250px" height="250px"><br>
                <div style="display: flex;">
                    <span class="view-count">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg>
                        21
                    </span>
                    <span class="pofol-title">Title</span>
                </div>    
            </div>
            <div class="pofol-obj">
                <img src="" width="250px" height="250px"><br>
                <div style="display: flex;">
                    <span class="view-count">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                        </svg>
                        21
                    </span>
                    <span class="pofol-title">Title</span>
                </div>    
            </div>
        </div>
        </div>

        <!-- 두번째 줄 -->
        <div class="pofol-line">
            <div style="display: flex;">
                <div class="pofol-obj">
                    <img src="" width="250px" height="250px"><br>
                    <div style="display: flex;">
                        <span class="view-count">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                            </svg>
                            21
                        </span>
                        <span class="pofol-title">Title</span>
                    </div>    
                </div>
                <div class="pofol-obj">
                    <img src="" width="250px" height="250px"><br>
                    <div style="display: flex;">
                        <span class="view-count">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                            </svg>
                            21
                        </span>
                        <span class="pofol-title">Title</span>
                    </div>    
                </div>
                <div class="pofol-obj">
                    <img src="" width="250px" height="250px"><br>
                    <div style="display: flex;">
                        <span class="view-count">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                            </svg>
                            21
                        </span>
                        <span class="pofol-title">Title</span>
                    </div>    
                </div>
            </div>
            </div>

            <!-- 세번째 줄 -->
            <div class="pofol-line">
                <div style="display: flex;">
                    <div class="pofol-obj">
                        <img src="" width="250px" height="250px"><br>
                        <div style="display: flex;">
                            <span class="view-count">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                </svg>
                                21
                            </span>
                            <span class="pofol-title">Title</span>
                        </div>
                    </div>
                    <div class="pofol-obj">
                        <img src="" width="250px" height="250px"><br>
                        <div style="display: flex;">
                            <span class="view-count">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                </svg>
                                21
                            </span>
                            <span class="pofol-title">Title</span>
                        </div>    
                    </div>
                    <div class="pofol-obj">
                        <img src="" width="250px" height="250px"><br>
                        <div style="display: flex;">
                            <span class="view-count">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#2a91f7c0" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
                                <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
                                </svg>
                                21
                            </span>
                            <span class="pofol-title">Title</span>
                        </div>    
                    </div>
                </div>
                </div>

            <!-- 페이징바 -->    
            <div align="center" id="pagingBtn-area">
                <button class="pagingBtn">prev</button>
                <button class="pageBtn">1</button>
                <button class="pageBtn">2</button>
                <button class="pagingBtn">next</button>
            </div>

    </div>		
	
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>