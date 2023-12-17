<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 - 글 작성</title>
<style>
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
    
    .outer>p { font-size: 24px; }
    #form-table{ width: 100%;}
    #form-table>thead th{ width: 10%;}
    #categorySelect{ width: 150px;}
    #pofolTitle{ width: 400px;}
    #pofolPrice{display: inline-block; width: 227px;}
    #priceOption{display: inline-block; width: 150px;}
    .pofolDescription{width: 100%;}
    #form-table>tbody label:hover{cursor: pointer;}

	.originImg{
		width:200px; height:200px;	
	}

    .outer>form button[type="button"], .outer>form button[type="submit"]{
        border: 0px;
        border-radius: 5px;
        background-color: #2a91f7c2;
        color: white;
        width: 150px;
        height: 40px;
        font-size: 20px;
        margin-top: 100px;
        margin-left: 15px;
        margin-right: 15px;
    }
    #btnCancel{
        background-color: rgba(204, 29, 29, 0.699);;
    }
    #btnSubmit:hover{background-color: #2A8FF7;}
    #btnCancel:hover{background-color: rgba(204, 29, 29);}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
    <div class="outer">
        <p>
            포트폴리오 수정
        </p>
        <hr>
        <form action="updatePofol.po" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pno" value="${requestScope.list[0].pofol.pofolNo }">
            <table id="form-table">
                <thead>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <input type="text" class="form-control" id="categorySelect"
                        value="${requestScope.list[0].categorySmallName }" readonly>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" class="form-control" id="pofolTitle"
                        value="${requestScope.list[0].pofol.pofolTitle }" name="pofolTitle" required>
                    </td>
                </tr>
                <tr>
                    <th>
                        가격
                    </th>
                    <td>
                        <input type="text" class="form-control"
                        value="${requestScope.list[0].pofol.pofolPrice}"
                        id="pofolPrice" name="pofolPrice">
                    </td>
                </tr>
                </thead>
                <tr><th colspan="2"><hr></th></tr>
                <tbody>
                <tr>
                    <th>소개글</th>
                    <td colspan="2">
                        <textarea name="pofolIntro" class="form-control pofolIntro" id="pofolIntro" style="resize: none;" rows="5">${requestScope.list[0].pofol.pofolIntro}</textarea>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="pofolContent" class="form-control pofolDescription" id="pofolContent" style="resize: none;" rows="10">${requestScope.list[0].pofol.pofolContent}</textarea>
                        <br>
                    </td>
                </tr>
                <tr>
                	<td colspan="2">
                		<c:choose>
                			<c:when test="${ not empty requestScope.imgList }">
                				<c:forEach var="item" items="${requestScope.imgList}">
                					<img src="${item.pofolImgUrl}" class="originImg" id="${item.pofolImgNo}">
                					<input style="display:none;" type="file" name="pofolImgUrl"
                					class="fileInput" multiple data-img-id="${item.pofolImgNo}">
                					<input type="hidden" name="pofolImgNo" value="${item.pofolImgNo}">
                				</c:forEach>
                				
                				<!-- 1004 1005 / 1004.jpg 1005.jpg -->
                			</c:when>
                			<c:otherwise>
                			</c:otherwise>
                		</c:choose>
                	</td>
                </tr>	
                </tbody>
            </table>
            <div align="center">
                <button id="btnCancel" type="button" onclick="history.back();">취소</button>
                <button id="btnSubmit" type="submit">수정하기</button>
            </div>
        </form>
        
        <script>
        
	        $('.originImg').click(function() {
	            let imgId = $(this).attr('id');
	            $('.fileInput[data-img-id="' + imgId + '"]').click();
	        });
	        
	        $('.fileInput').change(function() {
	            let imgId = $(this).data('img-id');
	            let previewImage = $('#' + imgId);

	            if (this.files && this.files[0]) {
	                let reader = new FileReader();
	                reader.onload = function (e) {
	                	
	                    previewImage.attr('src', e.target.result);
	                    // 선택한 파일의 URL을 해당 이미지의 숨겨진 필드에 업데이트
	                    $('input[name="pofolImgUrl' + imgId + '"]').val(e.target.result);
	                    
	                };
	                reader.readAsDataURL(this.files[0]);
	            }
	        });

        </script>
        
    </div> 

	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>