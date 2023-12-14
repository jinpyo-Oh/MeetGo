<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 서비스</title>
    <style>
		.addservicemain {
            margin: 0 auto;
            width: 600px;
            height: 875px;
        }

        .header-img {
            display: inline-block;
            position: relative;
            width: 1.875rem;
            height: 1.875rem;
            margin-right: 0.25rem;
            top: 0.375rem;
        }

        .service-context {
            position: relative; /* 추가: 드롭다운 위치를 부모 기준으로 지정하기 위함 */
        }

        .service-context ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .service-context ul li {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            text-overflow: ellipsis;
            white-space: nowrap;
            cursor: pointer;
            width: 100%;
            height: 3.125rem;
            line-height: 3.125rem;
            position: relative;
            padding: 0 1.75rem;
            display: inline-block;
            font-size: 1rem;
            letter-spacing: -.025rem;
            font-weight: 400;
            color: #323232;
            float: right;
            transition: transform 0.3s ease;
        }

        .bottom-boder {
            background: #f2f2f2;
            position: absolute;
            height: 0.0625rem;
            bottom: 0;
            left: 0;
            width: -webkit-fill-available;
            margin: 0 1.75rem;
        }

        .footer-button {
            width: 100%;
            padding: 10px;
            border-style: none;
            color: white;
            margin-top:100px;
        }

        .service-context ul li:hover {
            background-color: #e0e0e0;
            transform: scale(1.1);
        }

        .selected {
            background-color: aquamarine;
            color: white;
        }

    
        .name {
        	overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    float: left;
        }
        li {
            text-align: -webkit-match-parent;
        }
       .parent-level2 {
            display: none;
            list-style-type: none;
            padding: 0;
            margin: 0;
            position: absolute;
            left: 100%;
            top: 0;
                        z-index: 1;
            text-align: center;
        }
         .parent-level2 li {
            cursor: pointer;
        }

        .parent-level2 li:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>

    <div class="addservicemain">
        <div class="service-header">
            <h1><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/1200px-Hamburger_icon.svg.png" class="header-img">서비스 추가</h1>
        </div>
       <div class="service-context">
            <form action="addService.me">
            <ul>
                <li class="parent-level1"> <span class="name"><%-- ${sessionScope.bigCategoryList} --%></span>
                    <div class="bottom-boder"></div>
                    <ul class="parent-level2">
                        <li><span class="name">청소</span><div class="bottom-boder"></div></li>
                        <li><span class="name">인테리어</span><div class="bottom-boder"></div></li>
                        <li><span class="name">이사</span><div class="bottom-boder"></div></li>
                        <li><span class="name">수리</span><div class="bottom-boder"></div></li>
                    </ul>
                </li>
                
                
                <li class="parent-level1"><span class="name">취미/교육</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">음악</span></li>
                        <li><span class="name">요라</span></li>
                        <li><span class="name">외국어</span></li>
                        <li><span class="name">미술</span></li>
                    </ul>
                
                </li>
                <li class="parent-level1"><span class="name">건강/미용</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">메이크업</span></li>
                        <li><span class="name">헤어</span></li>
                        <li><span class="name">피부관리</span></li>
                        <li><span class="name">헬스</span></li>
                    </ul>
                </li>
                <li class="parent-level1"><span class="name">디자인</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">영상 편집</span></li>
                        <li><span class="name">사진 편집</span></li>
                        <li><span class="name">일러스트/공예</span></li>
                        <li><span class="name">3D/애니메이션</span></li>
                    </ul>
                </li>
                <li class="parent-level1"><span class="name">이벤트</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">사진촬영</span></li>
                        <li><span class="name">기획/장식</span></li>
                        <li><span class="name">공연</span></li>
                    </ul>
                </li>
                <li class="parent-level1"><span class="name">IT/개발</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">웹 개발</span></li>
                        <li><span class="name">소프트웨어 개발</span></li>
                        <li><span class="name">앱 개발</span></li>
                    </ul>
                </li>
                <li class="parent-level1"><span class="name">비즈니스</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">마케팅</span></li>
                        <li><span class="name">통역/번역</span></li>
                        <li><span class="name">컨설팅</span></li>
                    </ul>
                </li>
                 <li class="parent-level1"><span class="name">법률/행정</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">세무/회계</span></li>
                        <li><span class="name">노무</span></li>
              			<li><span class="name">법무</span></li>             
                        <li><span class="name">법률</span></li>
                    </ul>
                </li>
                 <li class="parent-level1"><span class="name">기타</span>
                <div class="bottom-boder"></div>
                 <ul class="parent-level2">
                        <li><span class="name">알바</span></li>
                        <li><span class="name">PPT 제작</span></li>
                        <li><span class="name">반려동물</span></li>
                        <li><span class="name">대여/대관</span></li>
                    </ul>
                </li>
                	
				
            </ul>
            </form>
        </div>
        <div class="service-footer">
            <button class="footer-button">서비스를 선택해주세요</button>
        </div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        var serviceItems = document.querySelectorAll(".service-context ul .parent-level1");
        var serviceButton = document.querySelector(".footer-button");
        var level2Items = document.querySelectorAll(".parent-level2 li");

        function resetButtons() {
            serviceItems.forEach(function (item) {
                var dropdown = item.querySelector(".parent-level2");
                if (dropdown) {
                    dropdown.style.display = "none";
                    item.classList.remove("selected");
                }
            });

            level2Items.forEach(function (item) {
                item.classList.remove("selected");
            });

            serviceButton.style.backgroundColor = "#F0F0F0";
            serviceButton.style.color = "white";
        }

        serviceItems.forEach(function (item) {
            item.addEventListener("click", function () {
                var dropdown = this.querySelector(".parent-level2");
                if (dropdown) {
                    if (dropdown.style.display === "block") {
                        dropdown.style.display = "none";
                        this.classList.remove("selected");
                        resetButtons();
                    } else {
                        resetButtons();
                        dropdown.style.display = "block";
                        this.classList.add("selected");
                    }
                }

                if (this.classList.contains("selected")) {
                    serviceButton.style.backgroundColor = "aquamarine";
                    serviceButton.style.color = "white";
                } else {
                    serviceButton.style.backgroundColor = "#F0F0F0";
                    serviceButton.style.color = "white";
                }
            });
        });

        level2Items.forEach(function (item) {
            item.addEventListener("click", function () {
                resetButtons();
                item.classList.add("selected");
                serviceButton.style.backgroundColor = "aquamarine";
                serviceButton.style.color = "white";
            });
        });
    });
</script>
</body>
</html>