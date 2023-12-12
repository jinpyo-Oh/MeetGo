<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
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
    margin: auto;
    width: 1000px;
    min-height : 1200px;
    
}
.gosu_header1{
    margin: auto;
    height: 50px;
    width: 1000px;
}

.gosu_header2{
    height: 80px;
    width: 1000px;
    box-sizing: border-box;
}
.gosu_content1{
    height: 100px;
    box-sizing: border-box;
}
.gosu_content2{
    box-sizing: border-box;
    height: 150px;
    text-align: center;
}
/* 댓글 작성 */

#coment{
	
    border-radius: 6px;
}

.gosu_coment1{
    height: 60px;
    width: 1000px;
    
}
.gosu_coment2 {
    width: 1000px;
    height: 100px;
    display: flex;
    position: relative;
    flex-direction: row; 
}

.gosu_coment2_1 {
    width: 10%;
    height: 80px;
}

.gosu_coment2_2 {
    width: 75%;
    height: 80px; 
    float: right;

}

.gosu_coment2_3 {
	width: 13%;
	height: 80px; 	  
	text-align:center;
}


.gosu_bottom{
    width: 1000px;
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    
}

*:focus {
    outline: 0;
}

        .swiper-slide>img {
            width : 100%;
            height : 100%;
        }
        div[class^=swiper-button] {
            color : white;
			display : none;
        }
	
		.category-img-wrapper img{
			width: 80px;
			height: 80px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="../../common/side.jsp"/>
	
  <div class="wrap">

        <div class="gosu_header1">
            &nbsp; &nbsp;
            <b>커뮤니티 > 고수찾기</b>
        </div>
        
   <div class="gosu_header2">
		    &nbsp; &nbsp;<h2>&nbsp; ${requestScope.m.boardTitle}</h2>
		    &nbsp; &nbsp;
		</div>
		<div class="gosu_content1">
		    <br>
		    <img src="" id="profileImg" width="70" height="70">   
		    &nbsp; 
		    
		    ${requestScope.m.userNo}
		    ${requestScope.m.createDate} &nbsp; &nbsp;<i class="bi bi-eye-fill"></i>
		</div>
        <hr>
        <div class="swiper"> 
			  <div class="swiper-wrapper">
            <!-- 이미지 파일 경로를 반복문으로 처리 -->
            <c:forEach var="image" items="${requestScope.imgList}">
                <div class="swiper-slide" align="center">
                    <img src="${image.filePath}" style="width:750px; height:400px; float:center;">
                </div>
                
                <div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
            </c:forEach>
        </div>
			
		</div>
        <div class="gosu_content2">
        
        <img src="${ requestScope.list[0].boardFile.filePath }">
            
            <div style="font-size:25px;">
            ${ requestScope.m.boardContent }
			</div>
        </div>
			
				 <table id="replyArea">
			 
        		<div class="gosu_coment1">
          
            <!-- 일반회원의 댓글 입력가능창하게끔 -->
            <!-- 만약 로그인이 안되었다면 막거나 하기 -->
                    
            <input type="text" name="coment" id="coment" style="width: 900px; height: 50px;" placeholder="&nbsp;내용을 입력하세요."> &nbsp; 
            	
             <button class="btn btn-primary" onclick="addReply();">댓글작성</button>        	
	   
	        </div>
	      
	        <hr>
	       
	        </table>
 	     
         <div class="gosu_coment2">   <!-- 댓글을 등록한 회원의 id  -->
				<div class="gosu_coment2_1">
                <!-- 프로필 이미지 넣기 -->
                <img src="" id="profileImg" width="50" height="50">&nbsp;&nbsp; 
                ${ requestScope.m.userNo }
                
                </div>
                 
        <div class="gosu_coment2_2">
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" style="width: 700px; 
         	 background: transparent;">     
         	 ${ requestScope.r.replyContent }   	
        </div> 
        	 <div class="gosu_coment2_3">        	 
        	  <button type="submit" class="btn btn-primary">견적요청</button>       	 
        	 </div>
        	                     
        </div>
      
	
        
        <div class="gosu_bottom">
        
            <button type="submit" id="gosu_btn" class="btn btn-secondary" >목록가기</button>
        </div>
   	</div>
    	<jsp:include page="../../common/footer.jsp"/>
   
   
     <script>   
		    
     const swiper = new Swiper('.swiper', {
        autoplay : {
            delay : 10000 // 3초마다 이미지 변경
        },
        loop : true, //반복 재생 여부
        slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
        pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: { 
            prevEl: '.swiper-button-prev',
            nextEl: '.swiper-button-next'
        }

		    });
		</script>
</body>
</html>