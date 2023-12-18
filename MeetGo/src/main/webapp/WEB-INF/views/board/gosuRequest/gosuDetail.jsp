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
		
		.report{
        	width: 50px;
        	height: 50px;
        	margin-right:20px;
        	margin-bottom: 15px;
        }
</style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>
	<jsp:include page="../../common/side.jsp"/>
	
  <div class="wrap">
		
		<br><br><br>
        <div class="gosu_header1">
            &nbsp; &nbsp;
            <b>커뮤니티 > 고수찾기</b>
        </div>
        
   <div class="gosu_header2">
		    &nbsp; &nbsp;<h2>&nbsp; ${requestScope.m.board.boardTitle}</h2>
		    &nbsp; &nbsp;
		</div>
		<div class="gosu_content1">
		    <br>
		    <img src="${ requestScope.m.userProfile }" id="userProfile" width="70" height="70" style="border-radius: 50%;">   
		    &nbsp; &nbsp;
		    
		    ${requestScope.m.userNickname}
		    <div style="float:right;">
		&nbsp;   작성일 :	&nbsp; ${requestScope.m.board.createDate} &nbsp; &nbsp;<i class="bi bi-eye-fill"></i> &nbsp;${requestScope.m.board.boardCount}
		</div>
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
            ${ requestScope.m.board.boardContent }
			</div>
        </div>
			
			 
          
            <!-- 일반회원의 댓글 입력가능창하게끔 -->
            <!-- 만약 로그인이 안되었다면 막거나 하기 -->
           
           <table id="replyArea" class="table" align="center">
           <thead>
               <tr>
               	<c:choose>
               		<c:when test="${ empty sessionScope.loginUser }">
               			<!-- 로그인 전 : 댓글창 막기 -->
               			<th colspan="2">
                         <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea>
                     </th>
                     <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
               		</c:when>
               		<c:otherwise>
                     <th colspan="2">
                         <textarea class="form-control" id="content" cols="80" rows="2" style="resize:none; width:100%;"></textarea>
                     </th>           
                     
                     <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addGosuReply();">등록하기</button></th>
               		
               		</c:otherwise>
               	</c:choose>
               </tr>
               <tr>
                   <td colspan="2">댓글(<span id="rcount">0</span>)</td>
                   <td style="text-align:right;"><img class="report" onclick="reportAlert('${requestScope.m.userNo}')" src="<%=request.getContextPath()%>/resources/images/common/report-icon.png"></td>
               </tr>
           </thead>
           
           <tbody>
           
           </tbody>
           
           
            </table>
              	
	   
	        </div>
	      
	        <hr>
	       
 	     
        
      
	
        
        <div class="gosu_bottom">
        	<a href="gosuList.bo">
            <button type="submit" id="gosu_btn" class="btn btn-secondary" >목록가기</button>
        	</a>
        </div>
    	<jsp:include page="../../common/footer.jsp"/>
   
   
     <script>   
     $(function() {
 		
 		// 댓글리스트 조회용 선언적 함수 호출
 		selectGosuReplyList();
 		
 		// 만약, 댓글이 실시간으로 달리는걸 보고싶다면?
 		setInterval(selectGosuReplyList, 1000);
 		
 	});
 	
 	function addGosuReply() {
 		
 		// 댓글 작성 요청용 ajax 요청
 		
 		// 댓글내용이 있는지 먼저 검사 후
 		// 댓글 내용 중 공백 제거 후 길이가 0 이 아닌 경우
 		// => textarea 가 form 태그 내부에 있지 않음
 		//    (required 속성으로 필수 입력값임을 나타낼 수 없음)
 		if($("#content").val().trim().length != 0) {
 			
 			$.ajax({
 				url : "gosuRinsert.bo",
 				type : "get",
 				data : { // Ajax 요청 또한 Spring 에서 커맨드 객체 방식 사용 가능
 					boardNo : ${ requestScope.m.board.boardNo }, 
 					userNo : "${ sessionScope.loginUser.userNo}" ,
 					replyContent : $("#content").val()
 				},
 				success : function(result) { 
 					
 					if(result == "success") {
 						// 댓글 작성 성공 시
 						selectGosuReplyList();
 						$("#content").val("");
 						
 					}
 					console.log("댓글 작성 성공");
 					
 				},
 				error : function() {
 					console.log("댓글 작성용 ajax 통신 실패!");
 				}
 			});
 			
 		} else {
 			
 			alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요.", function(){ alertify.success('Ok'); });	
 		}
 	}
 	
 	function selectGosuReplyList() {
 		
 		$.ajax({
 			url : "gosuRlist.bo",
 			type : "get",
 			data : {bno : ${ requestScope.m.board.boardNo }},
 			success : function(result) {
 				
 				let resultStr = "";
 				
 				for(let i = 0; i < result.length; i++) {
 					
 					resultStr += "<tr>"
 						+ "<th>" + result[i].userNickname + "</th>"
 	                    + "<td>" + result[i].replyContent + "</td>"
 	                    + "<td>" + result[i].replyDate + "</td>"
 	                   + "<td><a href='gosuList.bo' class='btn btn-primary' (" + i + ")'>견적요청</a></td>"
 	                    + "</tr>";
 				}
 				
 				$("#replyArea>tbody").html(resultStr);
 				$("#rcount").text(result.length);
 				
 			},
 			error : function() {
 				console.log("댓글리스트 조회용 ajax 통신 실패!");
 			}
 		});
 	}    
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