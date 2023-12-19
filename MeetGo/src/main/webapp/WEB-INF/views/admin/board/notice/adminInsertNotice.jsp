<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>공지사항 등록 페이지</title>
	<style>
        #insert-body {
            width: 50%;
			height: 1100px;
            margin: auto;
        }

        .insertNoticeTitle {
            font-size: 30px;
        }

        .notice-table {
            width: 80%;
            margin: auto;
            text-align: center;
            align-items: center;
            border-collapse: separate;
            border-spacing: 10px 40px;
        }

        .notice-table tr {
        }

        .notice-bar {
            font-size: 25px;
        }

        label[for=upload] {
            display: inline-block;
            border: 3px solid #ccc;
            color: #666;
            font-weight: bold;
            background: #eee;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer
        }

        label[for=upload]:hover {
            background: #ddd
        }

        label[for=upload] input {
            display: none
        }

        .thumb {
            position: relative;
            height: 300px;
            width: 300px;
            overflow: hidden;
            margin: 40px 0;
            cursor: move;

        }

        .thumb:before {
            content: "";
            display: block;
            position: absolute;
            width: 96%;
            height: 96%;
            border: 3px dashed #eee;
            z-index: 9;
            top: 1%;
            left: 1%;
            opacity: 0;
            transition: all 0.2s;
            pointer-events: none
        }

        .thumb:hover::before {
            opacity: 0.6
        }

        .thumb img {
            min-height: 100%;
            max-height: 51vh;
            width: auto !important;
            transition: all 0.4s;
        }
		.table-button{
			text-align: center;
			align-items: center;
		}
	</style>
</head>
<body>
<jsp:include page="../../common/adminHeader.jsp"/>
<div id="insert-body">
	<div class="pageTitleArea" align="center">
		<p class="pageTitle">
			<img style="width: 40px; height: 40px"
				 src="<%=request.getContextPath()%>/resources/images/chat/notice-icon.png">
			공지사항 등록
		</p>
		<hr>
	</div>
	<div class="" style="width:100%; border: 1px solid lightgray; margin: auto; height: 1000px">
		<table class="notice-table">
			<tr>
				<td width="20%">
					<div class="notice-bar">제목</div>
				</td>
				<td width="80%">
					<input id="noticeTitle" style="width: 100%; border: none; border-bottom: 1px solid black;" type="text" name="title"
						   placeholder="제목을 입력해 주세요." required/>
				</td>
			</tr>
			<tr>
				<td>
					<div class="notice-bar">내용</div>
				</td>
				<td>
					<textarea id="noticeContent" style="width: 100%; height: 300px; resize: none" name="content" placeholder="내용을 입력해 주세요."
							  required></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div class="notice-bar">파일 첨부</div>
					<label for="upload">첨부하기
						<input type='file' id="upload"></label>
				</td>
				<td>
					<div class="thumb">
						<img id="img" style="width:100%; height:100%; object-fit: cover"
							src="<%=request.getContextPath()%>/resources/images/common/upload-icon.png"/>
					</div>
				</td>
			</tr>
		</table>
		<div class="table-button">
			<button type="submit" class="meetgo-btn" style="width: 200px; height: 50px" onclick="insertNotice()">
				<span class="icon text-white-50">
				  <i class="fas fa-check"></i>
				</span>
				<span class="text"> 글 작성하기</span>
			</button>
			<button href="" class="meetgo-red" style="border-radius: 5px; width: 200px; height: 50px; background-color: white" onclick="window.history.back()">
				<span class="icon text-white-50">
				  <i class="fas fa-trash"></i>
				</span>
				<span class="text"> 취소하기</span>
			</button>
		</div>
	</div>
	<script>
        function preview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    console.log(reader.result)
                    var img = new Image;
                    img.onload = function () {
                        $('#img').attr({'src': e.target.result, 'width': img.width});
                    };
                    img.src = reader.result;
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#upload").change(function () {
            $("#img").css({top: 0, left: 0});
            preview(this);
            $("#img").draggable({containment: 'parent', scroll: false});
        });
        
        function insertNotice(){
            var form = $('#upload')[0].files[0];
            var formData = new FormData();
            formData.append('boardImg', form);
            formData.append('boardTitle', $('#noticeTitle').val() );
            formData.append('boardContent', $('#noticeContent').val());
            $.ajax({
				url : "adminInsertNotice.insert",
				enctype: 'multipart/form-data',
				data: formData,
				processData: false,
				contentType: false,
				cache: false,
				method : "post",
                success: function (result) {
                    console.log(result);
                    location.href = "adminNoticeList.ad";
                },
                error: function () {
                    alert("실패");
                }
			});
		}
	</script>
</div>
</body>
</html>
