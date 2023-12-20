<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- 별점용 스크립트 -->
<script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>

<style>
	.detail{
        width: 100%;
        border-style: hidden;
        border-radius: 10px;
        margin: center;
    }
    
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; }
    
    .cons{
        text-align: center;
        height: 35px;
    }
    
    .btn {
        float: right;
        margin: 5px;
    }
    .fix{
        background-color: #059862d1;
        color: white;
    }
    .back{
        margin: 5px;
        float: left;
        height: 30px;
        color: black;
    }
    #content{
    	background-color: white;
    	border: 0;
    }
</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div style="width: 80%; margin: auto;">
        
        <div style="text-align: center; width: 60%; margin: auto;">
            <br>
            <br>

            <h2>리뷰 작성</h2>
       
           <br><br>
    		
            <form method="post" action="reviewEnroll.me" enctype="multipart/form-data">
                <div style="border: 1px solid black; border-radius: 10px;">
                    <table class="detail" border="1px" style="border-color: black;" >
                            <tr class="cons">
                                <td class="fix" style="width: 15%; border-top-left-radius: 10px;">계약번호</td>
                                <td style="width: 35%;">${ est.estNo }</td>
                                <td class="fix" style="width: 15%;">견적서명</td>
                                <td style="color: red; width: 35%;">${ est.estTitle }</td>
                            </tr>
                            <tr class="cons">
                                <td class="fix" >고수명</td>
                                <td>${ gosuName }</td>
                                <td class="fix" >별점</td>
                                <td style="color: #e8dc06c4;">
                                    <div class="rating">
                                        <span class="rating__result"></span> 
                                        <i class="rating__star far fa-star"></i>
                                        <i class="rating__star far fa-star"></i>
                                        <i class="rating__star far fa-star"></i>
                                        <i class="rating__star far fa-star"></i>
                                        <i class="rating__star far fa-star"></i>
                                        <input type="hidden" name="rating" id="ratingInput" value="">
                                    </div>
                                </td>
                            </tr>
                        
                            <tr style="height: 320px;">
                                <td style="background-color: #059862d1; color: white;">내용</td>
                                <td colspan="3" style="text-align: left;">
                                   <textarea id="content" name="revContent" class="form-control" rows="10" style="resize: none; height: 320px; width: 100%;" required></textarea>
                                </td>
                            </tr>
                            <tr class="cons">
                            	<div id="insertFile">
	                                <td class="fix" style="border-bottom-left-radius: 10px;" >이미지</td>
	                                <td colspan="3" style="text-align: left; padding-left: 15px;" id="image">
										<a id="removeFile" class="btn btn-dark" style="width:38px; height:38px;">-</a>	
	                                	<a id="addFiles" class="btn btn-dark" style="width: 38px; height:38px;">+</a>
	                                </td>
                            	</div>
                            </tr>
                    </table>
                    
                    <input type="hidden" name="estNo" value="${ est.estNo }">
                    <input type="hidden" name="userNo" value="${ est.userNo }">
                    <input type="hidden" name="gosuNo" value="${ est.gosuNo }">
                    
                </div>
                
                
                <br>

                <a type="button" href="estimate.me" class="btn btn-warning btn-sm back">목록으로</a>
                <button type="submit" class="btn btn-success btn-sm">등록</button>
                
			</form>
                
                <!-- 파일 추가용 스크립트 -->
                <script>
	                $(function(){
						let maxFile = 5;
						$("#addFiles").on("click", function() {
							if($("#image>input").length < maxFile){
								$("#image").append('<input type="file" name="upfile">');
							}													
						})
						$("#removeFile").on("click", function() {
							let files = $("#image>input")
							$("#image>input").eq(files.length-1).remove();
	
						})
						
					})
                </script>
                
                <!-- 별점용 스크립트 -->
                <script>
                    const ratingStars = [...document.getElementsByClassName("rating__star")];
                    const ratingResult = document.querySelector(".rating__result");
        
                    printRatingResult(ratingResult);
        
                    function executeRating(stars, result) {
                        
                        const starClassActive = "rating__star fas fa-star";
                        const starClassUnactive = "rating__star far fa-star";
                        const starsLength = stars.length;
                       
                        let i;
                       
                        stars.map((star) => {

                            star.onclick = () => {

                                i = stars.indexOf(star);
            
                                if (star.className.indexOf(starClassUnactive) !== -1) {
                                    printRatingResult(result, i + 1);
                                    for (i; i >= 0; --i) stars[i].className = starClassActive;
                                } else {
                                    printRatingResult(result, i);
                                    for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
                                }

                            };

                        });
                    }
        
                    function printRatingResult(result, num = 0) {         
                        /*result.textContent = `${num}/5`;*/
                        const ratingInput = document.getElementById("ratingInput");
                        ratingInput.value = num;
                        console.log(ratingInput);
                    }
        
                    executeRating(ratingStars, ratingResult);

                </script>

        </div>
    </div>	
	
	<br><br><br><br>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>