<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
    height: 850px;
    width: 1000px;
}
.gosu_header1{
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
       
           &nbsp; &nbsp;<td><h2>&nbsp; ${ requestScope.m.boardTitle }</h2></td>
            
            &nbsp; &nbsp;
        </div>
        <div class="gosu_content1">
            <br>
            <img src="" id="profileImg" width="70" height="70">   
            &nbsp; 
            ${ requestScope.m.userNo }
            
            ${ requestScope.m.createDate } &nbsp; &nbsp;<i class="bi bi-eye-fill"></i> 20

        </div>
        <hr>
        <div class="swiper"> <!-- 슬라이드 이미지 시작 -->
			<div class="swiper-wrapper">
                <div class="swiper-slide"><img src=""></div>
				<div class="swiper-slide"><img src=""></div>
				<div class="swiper-slide"><img src=""></div>
				<div class="swiper-slide"><img src=""></div>
				<div class="swiper-slide"><img src=""></div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
        <div class="gosu_content2">
            ${ requestScope.m.boardContent }
	
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
    
</body>
   <script>
    	$(function() {
    		
    		// 댓글리스트 조회용 선언적 함수 호출
    		selectReplyList();
		
    	});
    	
    	function addReply() {
    		
    		// 댓글 작성 요청용 ajax 요청
    		
    		// 댓글내용이 있는지 먼저 검사 후
    		// 댓글 내용 중 공백 제거 후 길이가 0 이 아닌 경우
    		// => textarea 가 form 태그 내부에 있지 않음
    		//    (required 속성으로 필수 입력값임을 나타낼 수 없음)
    		if($("#coment").val().trim().length != 0) {
    			
    			$.ajax({
    				url : "rinsert.bo",
    				type : "get",
    				data: {
    				    refBoardNo: ${ requestScope.b.boardNo },
    				    replyContent: $("#coment").val()
    				},
    				success : function(result) { 
    					
    					if(result == "success") {
    						
    						// 댓글 작성 성공 시
    						selectReplyList();
    						$("#coment").val("");
    						
    					}
    					
    				},
    				error : function() {
    					console.log("댓글 작성용 ajax 통신 실패!");
    				}
    			});
    			
    		} else {
    			
    			alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요.", function(){ alertify.success('Ok'); });	
    		}
    	}
    	
    	function selectReplyList() {
    		
    		// 해당 게시글에 딸린 댓글 조회 요청용 ajax 요청
    		$.ajax({
    			url : "rlist.bo",
    			type : "get",
    			data : {bno : ${ requestScope.b.boardNo }},
    			success : function(result) {
    				
    				// console.log(result);
    				
    				let resultStr = "";
    				
    				for(let i = 0; i < result.length; i++) {
    					
    					resultStr += "<tr>"    							  	
    							   + 	"<td>" + result[i].replyContent + "</td>"
    							   +	"<td>" + result[i].createDate + "</td>"
    							   + "</tr>";
    				}
    				
    				$("#replyArea").html(resultStr);
    				
    			},
    			error : function() {
    				console.log("댓글리스트 조회용 ajax 통신 실패!");
    			}
    		});
    	}
    </script>
</html>