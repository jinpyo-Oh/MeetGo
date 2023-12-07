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
    #servicePrice{display: inline-block; width: 227px;}
    #priceOption{display: inline-block; width: 150px;}
    .pofolDescription{width: 100%;}
    #pofol-uploadFile{display: none;}
    #form-table>tbody label:hover{cursor: pointer;}

    .btn-addFile, .btn-removeFile{
        border: 0px;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        font-size: 18px;
        margin-left: 80px;
        background-color: black;
        color: white;
    }
    .file-label svg:hover{fill: #2A8FF7;}
    .btn-deleteFile{margin-left: 10px;}
    .btn-deleteFile:hover{cursor: pointer; fill:#2A8FF7}

    .outer>form button[type="submit"],
    .outer>form button[type="button"]{
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
    .outer>form button[type="button"]{
        background-color: rgba(204, 29, 29, 0.699);;
    }
    .outer>form button[type="submit"]:hover{background-color: #2A8FF7;}
    .outer>form button[type="button"]:hover{background-color: rgba(204, 29, 29);}
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp"/>
	
    <div class="outer">
        <p>
            포트폴리오 등록
        </p>
        <hr>
        <form action="pofolWrite.po" method="post" onsubmit="return false;" enctype="multipart/form-data">
            <table id="form-table">
                <thead>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select class="form-control" id="categorySelect" required>
                            <option></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" class="form-control" id="pofolTitle" name="" required>
                    </td>
                </tr>
                <tr>
                    <th>
                        가격
                    </th>
                    <td>
                        <input type="text" class="form-control" id="servicePrice">
                        <span><b>원</b></span>
                        <select class="form-control" id="priceOption">
                            <option>직접입력</option>
                            <option>협의 후 결정</option>
                        </select>
                    </td>
                </tr>
                </thead>
                <tr><th colspan="2"><hr></th></tr>
                <tbody>
                <tr>
                    <th>소개글</th>
                    <td colspan="2">
                        <textarea class="form-control pofolIntro" style="resize: none;" rows="5"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea class="form-control pofolDescription" style="resize: none;" rows="10"></textarea>
                        <br>
                    </td>
                </tr>
                <tr>
                   <th>첨부파일</th>
                    <td>
                        <input type="file" id="pofol-uploadFile" style="display: none;" onchange="addFile(this);" multiple> 
                        <label for="pofol-uploadFile" class="file-label">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-upload" viewBox="0 0 16 16">
                                <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
                                <path d="M7.646 1.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 2.707V11.5a.5.5 0 0 1-1 0V2.707L5.354 4.854a.5.5 0 1 1-.708-.708l3-3z"/>
                              </svg>
                        </label>
                        &nbsp;&nbsp;<span>최대 5개까지 첨부 가능합니다. <span style="font-size: 14px;">(첨부파일 용량 제한 : 100MB)</span></span>
                    </td>
                </tr>
                &nbsp;&nbsp;<tr><td colspan="2" class="file-list"></td></tr>
                </tbody>
            </table>
            <div align="center">
                <button type="button" onclick="history.back();">취소</button>
                <button type="submit">등록하기</button>
            </div>
        </form>
        
    </div> 
    
    <script>
    
        let fileNo = 0;
        let filesArr = new Array();

 
        /* 첨부파일 추가 */
        function addFile(obj){
            var maxFileCnt = 5;   // 첨부파일 최대 개수
            var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
            var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
            var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

            // 첨부파일 개수 확인
            if (curFileCnt > remainFileCnt) {
                alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
            }

            for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

                const file = obj.files[i];

                // 첨부파일 검증
                if (validation(file)) {
                    // 파일 배열에 담기
                    var reader = new FileReader();
                    reader.onload = function () {
                        filesArr.push(file);
                    };
                    reader.readAsDataURL(file)

                    // 목록 추가
                    let htmlData = '';
                    htmlData += '<div id="file' + fileNo + '" class="filebox">';
                    htmlData += '   <span class="name">' + file.name + '</span>';
                    htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');">'
                             + '<svg class="btn-deleteFile" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="red" class="bi bi-dash-circle" viewBox="0 0 16 16">'
                             + '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
                             + '<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/></svg></a>';
                    htmlData += '</div>';
                    $('.file-list').append(htmlData);
                    fileNo++;
                } else {
                    continue;
                }
            }
            // 초기화
            document.querySelector("input[type=file]").value = "";
        }

        /* 첨부파일 검증 */
        function validation(obj){
            const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
            if (obj.name.length > 100) {
                alert("파일명이 100자 이상인 파일은 제외되었습니다.");
                return false;
            } else if (obj.size > (100 * 1024 * 1024)) {
                alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
                return false;
            } else if (obj.name.lastIndexOf('.') == -1) {
                alert("확장자가 없는 파일은 제외되었습니다.");
                return false;
            } else if (!fileTypes.includes(obj.type)) {
                alert("첨부가 불가능한 파일은 제외되었습니다.");
                return false;
            } else {
                return true;
            }
        }

        /* 첨부파일 삭제 */
        function deleteFile(num) {
            document.querySelector("#file" + num).remove();
            filesArr[num].is_delete = true;
        }

        /* 폼 전송 */
        function submitForm() {
            // 폼데이터 담기
            var form = document.querySelector("form");
            var formData = new FormData(form);
            for (var i = 0; i < filesArr.length; i++) {
                // 삭제되지 않은 파일만 폼데이터에 담기
                if (!filesArr[i].is_delete) {
                    formData.append("attach_file", filesArr[i]);
                }
            }

            $.ajax({
                method: 'POST',
                url: '',
                dataType: 'json',
                data: formData,
                async: true,
                timeout: 30000,
                cache: false,
                headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
                success: function () {
                    alert("파일업로드 성공");
                },
                error: function (xhr, desc, err) {
                    alert('에러가 발생 하였습니다.');
                    return;
                }
            })
        }

    </script>
    	
	<jsp:include page="../../common/footer.jsp"/>

</body>
</html>