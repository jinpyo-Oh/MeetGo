<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계정설정</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI/tfW2c+2GB6l5ZPinXc5/CN2fV/6if5dFl5/ow="
        crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <style>
        .main {
            width: 600px;
            height: 1100px;
            margin: 0 auto;
            text-align: center;
            padding:20px;
        }
        .title {
            float: left;
            font-size: 30px;
            font-weight: 900;
        }
        .profile {
           

        }
        #userprofileimg
        {
            width: 100px;
            height: 100px;
            border-radius: 50px;
            margin-right:140px;
            margin-top: 100px;

        }
        .poto {
            width: 30px;
            height: 30px;
            position: absolute;
            margin-top: -30px;
        }
        .item-title{
            color: #7777;
            margin: 20px 0px ;
        
        }
        .item-title {
            paddiong : 4px 0px 0px;


        }
        .item-description {
            color:#7777;
            

        }
        .item{
            margin:50px;
            text-align: left;
            
        }
        .arrow1, .arrow2, .arrow3, .arrow4{
            float: right;
            width: 20px;
        }
        .update-btn{
         display: inline-block;
	    padding: 10px 20px;
	    font-size: 16px;
	    font-weight: bold;
	    text-align: center;
	    text-decoration: none;
	    cursor: pointer;
	    border: none;
	    border-radius: 5px;
	    transition: background-color 0.3s, color 0.3s;
	    background-color: #3498db; /* 버튼 배경색 */
	    color: #fff; /* 버튼 텍스트 색상 */
    }
     .update-btn:hover{
      background-color: #2980b9;
     }
        

    </style>
</head>
<body>
    	<jsp:include page="../common/header.jsp"/>
    <div class="main">
       <form action="update.me" method="post"  enctype="multipart/form-data">
        <div class="profile">
            <h1 class="title">계정 설정</h1>
			<img src="${ sessionScope.loginUser.userProFile }" id="userprofileimg">
		
        </div>
        
        <input type="file" id="profileupload" name="profileupload"onchange="previewProfileImage(event)" style="display:none"><img src="<%=request.getContextPath()%>/resources/images/common/camera.png" id="poto" class="poto"  onclick="openFileUpload()">
            	
   
        <div class="item">
            <div class="item-title">
                <p>이름</p>
            </div>
            <div class="item-info">
                <p>${ sessionScope.loginUser.userName }</p>
            </div>
            
            <div class="item-description">
                <p>이름은 상대방에게 노출되지 않습니다.</p>
                
            </div>
            <hr>
            <div class="item-title">
                <p>숨고 활동명</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow1">
            <div class="item-info">
                <p>${ sessionScope.loginUser.userNickname }</p>
            	<input type="text" class="form-control" id="userNickname"  Placeholder="변경할 닉네임을 입력해주세요." name="userNickname" readonly required>
            </div>
            <hr>
            <div class="item-title">
                <p>이메일</p>
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow2">
            <div class="item-info">
                <p>${ sessionScope.loginUser.userEmail }</p>
               <input type="text" class="form-control" id="userEmail" value="${ sessionScope.loginUser.userEmail }" name="userEmail" readonly required>
                
            </div>
            <hr>
            <div class="item-title">
                <p>비밀번호</p>
                
            </div>
            <img src="https://assets.cdn.soomgo.com/icons/icon-mypage-list-arrow.svg" class="arrow3">
            <div class="item-info">
                <p>********</p>
                <input type="password" class="form-control" id="userPwd" Placeholder="변경할 비밀번호를 입력해주세요." name="userPwd" readonly required>
                
            </div>
            
            <hr>
            
            <div class="item-title">
                <p>휴대폰 전화번호</p>
            </div>
            
            <div class="item-info">
                <p>${ sessionScope.loginUser.userPhone }</p>
                
            </div>
		</div>
		 	<button type="submit" class="update-btn">수정하기</button>
		 	
		</form>
            <hr>

            
            <br><br><br>
            <div class="modal" id="withdrawModal" tabindex="-1" role="dialog" id="deleteForm">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">계정 탈퇴</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                          <form action="delete.me" method="post">
                        <div class="modal-body">
                            <p>정말로 계정을 탈퇴하시겠습니까? 다시는 되 돌리지도 못합니다.</p>
                            <label for="userPwd" class="mr-sm-2">Password : </label>
                            <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="userPwd"> <br>
                            <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-danger">계정 탈퇴</button>
                        </div>
                        </form>
                    </div>
                   
                    
                </div>
                
                
                
                
    
            </div>
            <!-- 모달 열기 버튼 -->
            <button
            class="btn btn-danger" data-toggle="modal" data-target="#withdrawModal">계정 탈퇴</button>
            <!-- ... -->
    
     
            
            


    </div>
        <jsp:include page="../common/footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
    // 페이지 로드시 숨기기
   		$("#userNickname").hide();
        $("#userEmail").hide();
        $("#userPwd").hide();
    // 화살표 클릭 시 보이기/숨기기 토글
        $(".arrow1").click(function() {
            $("#userNickname").toggle().prop('readonly', false);
        });
    // 화살표 클릭 시 보이기/숨기기 토글
        $(".arrow2").click(function() {
            $("#userEmail").toggle().prop('readonly', false);
        });

    // 화살표 클릭 시 보이기/숨기기 토글
   $(".arrow3").click(function() {
            $("#userPwd").toggle().prop('readonly', false);
        });
    

 

    // 화살표 클릭 시 보이기/숨기기 토글
    

});

</script>
    <script>
function previewProfileImage(event) {
    var input = event.target;
    var reader = new FileReader();

    reader.onload = function () {
        var img = document.getElementById('userprofileimg');
        img.src = reader.result;
    };

    if (input.files && input.files[0]) {
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<script>
function openFileUpload() {
    document.getElementById('profileupload').click();
}

function previewProfileImage(event) {
    var input = event.target;
    var reader = new FileReader();

    reader.onload = function () {
        var img = document.getElementById('userprofileimg');
        img.src = reader.result;
    };

    if (input.files && input.files[0]) {
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</body>
</html>