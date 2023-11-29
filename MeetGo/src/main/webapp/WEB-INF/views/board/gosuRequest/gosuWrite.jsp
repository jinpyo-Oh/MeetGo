<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    height: 1000px;
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
.gosu_coment{
    height: 60px;
    width: 1000px;
    
}
#coment{
    border-radius: 6px;
}

.gosu_coment2 {
    width: 1000px;
    height: 100px;
    display: flex;
    position: relative;
    flex-direction: row; /* Change flex-direction to row */
}

.gosu_coment2_1 {
    width: 12%;
    height: 80px;
}

.gosu_coment2_2 {
    width: 80%;
    height: 80px; 
    float: right;
    /* Change height to 100px to match gosu_coment2_1 */
    /* Add position relative */
}

.gosu_coment2_3{
   width: 10%;
   height: 50px;
    
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

 <div class="wrap">

        <div class="gosu_header1">
            &nbsp; &nbsp;
            <b>커뮤니티 > 고수찾기</b>
        </div>
        
        <div class="gosu_header2">
            
            <h2>&nbsp; &nbsp;모태솔로 탈출하고싶은데 도와주실분 계신가요</h2>
            
            &nbsp; &nbsp;경기/김포시
            <hr>
        </div>
        <div class="gosu_content1">
            <br>
            <img src="" id="profileImg" width="70" height="70">   
            &nbsp; 
             믿을맨 &nbsp; &nbsp;<i class="bi bi-eye-fill"></i> 20

        </div>
        <hr>
       
        <div class="gosu_content2">
            젠장 또 대상혁인거야?<br>
            숭배해야겠지?
            <br>
            대상혁!

        </div>
        <div class="gosu_coment">
            
            <input type="text" name="coment" id="coment" style="width: 1000px; height: 50px;" 
            
            placeholder="&nbsp;내용을 입력하세요.">
        </div>
        <hr>
        <div class="gosu_coment2">
            
        <div class="gosu_coment2_1">
            <img src="" id="profileImg" width="50" height="50">&nbsp;&nbsp;user03       
        </div>
            
        <div class="gosu_coment2_2">
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" style="width: 700px; 
            border: none; background: transparent;">
        </div>    
        
        <div class="gosu_coment2_3">
            <button class="btn btn-primary" style="float: right;">견적요청</button>
        </div>       
            
        </div>
        <div class="gosu_coment2">
            
            <div class="gosu_coment2_1">
                <img src="" id="profileImg" width="50" height="50">&nbsp;&nbsp;user03       
            </div>
                
            <div class="gosu_coment2_2">
                &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" style="width: 700px; 
                border: none; background: transparent;">
            </div>    
            
            <div class="gosu_coment2_3">
                <button class="btn btn-primary" style="float: right;">견적요청</button>
            </div>       
                
        </div>
        
        <div class="gosu_coment2">
            
                <div class="gosu_coment2_1">
                    <img src="" id="profileImg" width="50" height="50">&nbsp;&nbsp;user03       
                </div>
                    
                <div class="gosu_coment2_2">
                    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" style="width: 700px; 
                    border: none; background: transparent;">
                </div>    
                
                <div class="gosu_coment2_3">
                    <button class="btn btn-primary" style="float: right;">견적요청</button>
                </div>       
                    
        </div>    

        
        <div class="gosu_bottom">
            <button type="submit" id="gosu_btn" class="btn btn-secondary" >목록가기</button>
        </div>
        

    </div>
    	<jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>