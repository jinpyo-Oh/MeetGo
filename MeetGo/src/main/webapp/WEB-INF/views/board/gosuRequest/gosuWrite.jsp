<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; 
    }     
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

 .wrap{
    width: 1000px;
    height: 800px;
    margin: auto;
    box-sizing: border-box;
 }
 .gosu_title{
    width: 1000px;
    height: 70px;
    display: flex;
    position: relative;
    flex-direction: row; /* Change flex-direction to row */
    
}
 
 .gosu_title_1{
    width: 15%;
    height: 70px;
    margin-top: 5px;
 }
 .gosu_title_2{
    width: 85%;
    height: 70px;
    float: right;
 }
 #title_btn{
    background-color: transparent;
    border: 0;
    opacity: 0.5;
    margin-top: 5px;
    margin-right: 10px;
 }

 .gosu_img_1{
    width: 1000px;
    height: 40px;
 }
 .gosu_img_2{
    width: 1000px;
    height: 150px;
 }
.gosu_head{
    width: 1000px;
    height: 40px;
}
.gosu_category{
    width: 1000px;
    height: 55px;
    box-sizing: border-box;
  
}
.gosu_content{
    width: 1000px;
    height: 280px;
    box-sizing: border-box;
    
}
#gosu_content{
    margin: auto; /* 가운데 정렬 스타일 추가 */
    display: block; /* 블록 레벨 요소로 설정하여 가운데 정렬이 적용되도록 합니다. */
}
*:focus {
    outline: 0;
}
.gosu_content > textarea {
    resize: none;
    border: 1px solid lightgray;
    border-collapse: 5px;
}
.input-file-button1,
    .input-file-button2,
    .input-file-button3,
    .input-file-button4,
    .input-file-button5 {
        display: inline-block;
        margin-bottom: 15px;
    }

    .input-file-button1 input,
    .input-file-button2 input,
    .input-file-button3 input,
    .input-file-button4 input,
    .input-file-button5 input {
        display: none;
    }
</style>

<body>
	<jsp:include page="../../common/header.jsp"/>

    <div class="wrap">
        <form id="gosuWrite" action="gosuInsert.bo" method="post" enctype="multipart/form-data"> 
	     
	     <input type="hidden" value="${sessionScope.loginUser}">
        <br>
        	<br>
        <div class="gosu_title">
        	
            <div class="gosu_title_1">
                <h4><b>&nbsp;&nbsp;&nbsp;고수찾기</b></h4>  
            </div>
            <div class="gosu_title_2">              
                
                <button type="submit" id="title_btn" style="float: right; font-size: 20px;"><h5>등록하기</h5></button>
            </div>
        </div>
        
        <div class="gosu_img_1">
            &nbsp;&nbsp;<i class="bi bi-camera-fill" style="font-size: 27px;"></i>&nbsp;&nbsp;&nbsp; <span
                id="fileCount">0</span>/5 &nbsp;&nbsp; 사진 5장 첨부 필수
        </div>
        <br>
        <div class="gosu_img_2" style="text-align: center;">
            &nbsp;&nbsp;&nbsp;
            
            <img src="" id="profileImg1" width="150" height="150" onclick="handleImageClick('#gosutitle1');" >   
            &nbsp;&nbsp;&nbsp;
            <img src="" id="profileImg2" width="150" height="150" onclick="handleImageClick('#gosutitle2');"> 
            &nbsp;&nbsp;&nbsp;
            <img src="" id="profileImg3" width="150" height="150" onclick="handleImageClick('#gosutitle3');">  
            &nbsp;&nbsp;&nbsp;
            <img src="" id="profileImg4" width="150" height="150" onclick="handleImageClick('#gosutitle4');"> 
            &nbsp;&nbsp;&nbsp; 
            <img src="" id="profileImg5" width="150" height="150" onclick="handleImageClick('#gosutitle5');">   
        
        	<br><br>
            
            <hr>
            
            <label class="input-file-button1" for="gosutitle1">
                <input type="file" multiple id="gosutitle1" name="gosuReqImg" style="display: none;" onchange="loadImg(this, '#profileImg1');" >
            </label>
            
            <label class="input-file-button2" for="gosutitle2">
                <input type="file" multiple id="gosutitle2" name="gosuReqImg" style="display: none;" onchange="loadImg(this, '#profileImg2');" >
            </label>
            
            <label class="input-file-button3" for="gosutitle3">
                <input type="file" multiple id="gosutitle3" name="gosuReqImg" style="display: none;" onchange="loadImg(this, '#profileImg3');"  >
            </label>
            
            <label class="input-file-button4" for="gosutitle4">
                <input type="file" multiple id="gosutitle4" name="gosuReqImg" style="display: none;" onchange="loadImg(this, '#profileImg4');" >
            </label>
            
            <label class="input-file-button5" for="gosutitle5">
                <input type="file"  multiple id="gosutitle5" name="gosuReqImg" style="display: none;" onchange="loadImg(this, '#profileImg5');" >
            </label>
        </div>
        <br>
        <br>
        <div class="gosu_head"> <label for="title">
            &nbsp;&nbsp;&nbsp; <input type="text" name="boardTitle" id="title"
            placeholder="제목을 입력하세요."
            style="border: none; background: transparent; width: 600px; height: 40px; font-size: 18px;">
        </label>
        </div>
        <hr>
        <div class="gosu_category">
            &nbsp;&nbsp; 
                &nbsp;&nbsp;&nbsp;&nbsp;
                카테고리 &nbsp;&nbsp;   
                <select name="" style="height: 30px; width: 150px;">
                    <option value="new" selected>전체</option>
                    <option value="writer">홈/리빙</option>
                    <option value="title">취미/교육</option>
                    <option value="title">건강/미용</option>
                    <option value="title">디자인</option>
                    <option value="title">이벤트</option>
                    <option value="title">IT/개발</option>
                    <option value="title">비즈니스</option>
                    <option value="title">법률/행정</option>
                    <option value="title">기타</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;
                지역 &nbsp;&nbsp;
                <select name="" style="height: 30px; width:150px;">
              		<option selected>전체</option>
                    <option>서울</option>
                    <option>인천</option>
                    <option>대전</option>
                    <option>대구</option>
                    <option>부산</option>
                    <option>울산</option>
                    <option>광주</option>
                    <option>경기</option>
                    <option>강원</option>
                    <option>충북</option>
                    <option>충남</option>
                    <option>전남</option>
                    <option>전북</option>
                    <option>경북</option>
                    <option>경남</option>
                    <option>제주</option>
                </select>
                <hr>
        </div>
        <div class="gosu_content">
            <br><br>
            <label for="content">
            <textarea id="content" class="form-control" name="boardContent" cols="30" rows="10" placeholder="&nbsp;&nbsp;고수를 쉽게 찾으려면 보다 구체적으로 적어주시면 더욱 빠르게 찾을 수 있습니다&#13;
            예) 드럼 레슨을 도와주실 고수분 찾아요 &#13; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예)&nbsp;화장실 청소를 도와 줄 고수분 찾아요"
            style="border: 1px solid lightgray; height: 200px; width: 1000px; font-size: 20px; ;"></textarea>
        </label>
        </div>
   
	</form>

    </div>

    <jsp:include page="../../common/footer.jsp"/>
    
    <script>
        
            function handleImageClick(inputFileId) {
                    $(inputFileId).trigger('click');
                }

                function loadImg(inputFile, imgId) {
                    if (inputFile.files.length === 1) {
                        let reader = new FileReader();

                        reader.readAsDataURL(inputFile.files[0]);

                        reader.onload = function (e) {
                            $(imgId).attr("src", e.target.result);
                        };
                    } else {
                        $(imgId).attr("src", null);
                    }
                }

                let fileCount = 0;

            function handleImageClick(inputFileId) {
                $(inputFileId).trigger('click');
            }

            function loadImg(inputFile, imgId) {
                if (inputFile.files.length === 1) {
                    let reader = new FileReader();

                    reader.readAsDataURL(inputFile.files[0]);

                    reader.onload = function (e) {
                        $(imgId).attr("src", e.target.result);
                        handleFileCount(1); // 파일이 업로드되면 fileCount 증가
                    };
                } else {
                    $(imgId).attr("src", null);
                    handleFileCount(-1); // 이미지가 삭제되면 fileCount 감소
                }
            }

            function handleFileCount(change) {
                fileCount += change;
                $('#fileCount').text(fileCount);

                // 파일 업로드 버튼 표시 또는 숨김
                if (fileCount >= 5) {
                    $(".input-file-button1, .input-file-button2, .input-file-button3, .input-file-button4, .input-file-button5").hide();
                } else {
                    $(".input-file-button1, .input-file-button2, .input-file-button3, .input-file-button4, .input-file-button5").show();
                }
            }   
    </script>
</body>
</html>