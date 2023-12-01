<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고수 찾기</title>
    <style>
    /* 폰트 */
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    .outer { font-family: 'Pretendard-Regular'; }

    /* 전체 div 영역 */
    .outer{
        width: 1200px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
        box-sizing: border-box;
    }
    
    /* 메뉴 제목 */
    #title-text{
        font-weight: bold;
        font-size: 30px;
        color: #2A8FF7;
        letter-spacing: 4px;
        text-align: center;
    }
    
    /* 옵션선택 영역 */
    #select-option-area{ width: 40%; margin: auto; }
    #select-option-area span{
        font-size: 20px;
        font-weight: 700;
        margin-right: 20px;
    }
    .option-select{ appearance: none; font-size: 20px; }
    .option-select option {
        background: white;
        font-size: 20px;
    }

    /* 옵션 select */
    #region-main{
        width: 160px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
    }
    #region-sub{
        width: 220px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-left: 15px;
    }
    #category-main{
        width: 160px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
    }
    #category-sub{
        width: 220px;
        height: 45px;
        text-align: center;
        border-radius: 5px;
        border: 1px solid lightgray;
        margin-left: 15px;
    }
    
    #btn-search{
    	width: 150px;
    	height: 50px;
    	margin-top: 35px;
    	font-size: 18px;
    	background-color: #2A8FF7;
    	color: white;
    	border: 0px;
    	border-radius: 5px;
    }

    /* 결과화면 영역 */
    #result-area{
        width: 50%;
        margin: auto;
    }
    #filter{
        width: 120px; height: 40px;
        border: 0px; border-bottom: 3px solid #2A8FF7;
    }
    
    /* 고수 서비스 테이블 */
    .service-object{ margin-top: 50px; margin-bottom: 50px;}
    .service-table{
        width: 600px;
        border-bottom: 1px solid lightgrey;
    }
    .service-table:hover{ cursor: pointer;}
    .service-table>thead{ height: 80%; font-size: 18px; }
    .service-table>tbody{ height: 20%; font-size: 16px; }
    .service-table>thead th{ width: 35%; }
    .service-table td:nth-child(2), #service-table td:nth-child(3)
    { height: 20px; }
    .service-table th img { max-height: 100%; }

    /* 페이징버튼 */
    #pagingBtn-area{margin-top: 80px;}
    .pagingBtn{
        border: 0;
        border-radius: 5px;
        width: 80px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    .pageBtn{
        border: 0;
        border-radius: 5px;
        width: 40px;
        height: 40px;
        font-size: 20px;
        color: white;
        background-color: #2a91f7c0;
    }
    </style>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="outer">
        <p id="title-text">고수찾기</p><br>
        <div id="select-option-area" align="center">
        
            <form action="searchGosu.go" method="get">
            <input type="hidden" name="currentPage" value="1">
            <span>&nbsp;지역</span>&nbsp;&nbsp;&nbsp;

            <select id="region-main" class="option-select" name="regionMain">
            	<option>전국</option>
                <option>서울</option>
                <option>세종</option>
                <option>강원</option>
                <option>인천</option>
                <option>경기</option>
                <option>충북</option>
                <option>충남</option>
                <option>대전</option>
                <option>경북</option>
                <option>대구</option>
                <option>경남</option>
                <option>부산</option>
                <option>울산</option>
                <option>전북</option>
                <option>전남</option>
                <option>광주</option>
                <option>제주</option>
            </select>
            
            <select id="region-sub" class="option-select" name="regionSub">
            	<option></option>
            </select>

            <br>
            <br>
            
            <span>서비스</span>
            <select id="category-main" class="option-select" name="categoryMain">
                <option value="0" selected>전체 서비스</option>
                <option value="1" >홈 / 리빙</option>
                <option value="2">취미 / 레슨</option>
                <option value="3">건강 / 미용</option>
                <option value="4">디자인</option>
                <option value="5">이벤트</option>
                <option value="6">IT / 개발</option>
                <option value="7">비즈니스</option>
                <option value="8">법률 / 행정</option>
                <option value="9">기타</option>
            </select>
            <select id="category-sub" class="option-select" name="categorySub">
                <option selected></option>
            </select>
           	
           	<input type="submit" value="검색" id="btn-search">
           	
            </form>
            
            <br>
        </div>

        <hr style="width: 50%;">
        
        <div id="result-area">

            <span>총 ${ requestScope.pi.listCount } 건 조회됨</span>

            <div align="right">
            <select id="filter" class="form-control">
                <option value="review" selected>리뷰많은순</option>
                <option value="rate">평점높은순</option>
                <option value="hire">고용순</option>
                <option value="recent">최신순</option>
            </select>
            </div>
	
			<c:choose>
			<c:when test="${ not empty requestScope.list }" >
			<c:forEach var="g" items="${ requestScope.list }">
            	<div align="center" class="service-object">
                    <table class="service-table">
                        <thead>
                        <tr>    
                           <th rowspan="2">
                            <div align="center">
                                <img class="gosu-profile" width="150px" height="150px" src="${ g.userProfile }">
                            </div>
                           </th> 
                           <td style="width: 25%;">${ g.userNickname }</td>
                           <td>
                            <span id="mainC">${ g.categorySmallNo.toString().charAt(0) }</span> > <span id="subC">${ g.categorySmallNo.toString() }</span>
                           </td>
                        </tr>
                        <tr>
                            <td colspan="2">${ g.gosu.introduction }</td>
                        </tr>
                        </thead>                        
                        <tbody>
                        <tr>
                            <td style="text-align: center;"><br>별점</td>
                            <td colspan="2"><br>리뷰 <b>00</b> 건</td>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        </tbody>
                    </table>
                    </div> 
                </c:forEach>
                </c:when>
				<c:otherwise>
                	조회된 결과가 없습니다.
                </c:otherwise>
        </c:choose>
			
        </div>
                
        <!-- 페이징바 -->    
        <div align="center" id="pagingBtn-area">
        
        	<!-- 첫 페이지면 이전페이지로 이동 불가 -->
        	<c:choose> 
        		<c:when test="${ requestScope.pi.currentPage eq 1 }">
        			<button class="pagingBtn" disabled style="display:none;">prev</button>
        		</c:when>
        		<c:otherwise>
        			<button class="pagingBtn" onclick="location.href='searchGosu.go?currentPage=${ requestScope.pi.currentPage - 1 }&regionMain=${ requestScope.regionMain }&regionSub=${ requestScope.regionSub }&categoryMain=${ requestScope.categoryMain }&categorySub=${ requestScope.categorySub }'">prev</button>
        		</c:otherwise>
        	</c:choose>
            
            
             <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                    					end="${ requestScope.pi.endPage }"
                    					step="1">
			<button class="pageBtn" onclick="location.href='searchGosu.go?currentPage=${ p }&regionMain=${ requestScope.regionMain }&regionSub=${ requestScope.regionSub }&categoryMain=${ requestScope.categoryMain }&categorySub=${ requestScope.categorySub }'">${ p }</button>
            </c:forEach>
            
            <!-- 마지막 페이지면 다음페이지로 이동 불가 -->
            <c:choose>
       		<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.endPage }">
       			<button class="pagingBtn" disabled style="display:none;">next</button>
       		</c:when>
       		<c:otherwise>
       			<button class="pagingBtn" onclick="location.href='searchGosu.go?currentPage=${ requestScope.pi.currentPage + 1 }&regionMain=${ requestScope.regionMain }&regionSub=${ requestScope.regionSub }&categoryMain=${ requestScope.categoryMain }&categorySub=${ requestScope.categorySub }'">next</button>
       		</c:otherwise>
       		</c:choose>
            
            
        </div>
               
 	</div>

<script>
	// sub 지역 리스트
	let seoul = ["전체", "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"];
	let sejong = ["전체"];
	let gangwon = ["전체", "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"];
	let incheon = ["전체", "중구", "동구", "남구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
	let gyeonggi = ["전체", "수원시", "성남시", "고양시", "용인시", "부천시", "안산시", "안양시", "남양주시", "화성시", "평택시", "의정부시", "시흥시", "파주시", "광명시", "김포시", "군포시", "광주시", "이천시", "양주시", "오산시", "구리시", "안성시", "포천시", "의왕시", "하남시", "여주시", "여주군", "양평군", "동두천시", "과천시", "가평군", "연천군"];
	let chungbuk = ["전체", "청주시", "충주시", "제천시", "청원군", "보은군", "옥천군", "영동군", "진천군", "괴산군", "음성군", "단양군", "증평군"];
	let chungnam = ["전체", "천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시", "당진군", "금산군", "연기군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"];
	let daejeon = ["전체", "동구", "중구", "서구", "유성구", "대덕구"];
	let gyeongbuk = ["전체", "포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉"];
	let daegu = ["전체", "중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군"];
	let gyeongnam = ["전체", "창원시", "마산시", "진주시", "진해시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"];
	let busan = ["전체", "중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구", "해운대구", "사하구", "금정구", "강서구", "연제구", "수영구", "사상구", "기장군"];
	let ulsan = ["전체", "중구", "남구", "동구", "북구", "울주군"];
	let jeonbuk = ["전체", "전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군", "부안군"];
	let jeonnam = ["전체", "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군"];
	let gwangju = ["전체", "동구", "서구", "남구", "북구", "광산구"];
	let jeju = ["전체", "제주시", "서귀포시"];

	// sub 카테고리 리스트
	let homeLiving = ["청소", "인테리어", "이사", "수리"];
	let hobbyEdu = ["음악", "요리", "외국어", "미술"];
	let healthBeauty = ["전체", "메이크업", "헤어", "피부관리", "헬스"];
	let design = ["영상편집", "사진편집", "일러스트 / 공예", "3D / 애니메이션"];
	let event = ["사진촬영", "기획 / 장식", "공연"];
	let development = ["웹 개발", "소프트웨어 개발", "앱 개발"];
	let business = ["마케팅", "통역 / 번역", "컨설팅"];
	let law = ["세무 / 회계", "법무", "노무"];
	let other = ["알바", "PPT제작", "반려동물", "대여 / 대관"];
	
	$(function() {
		
	    // option 변경 이벤트 핸들러 등록
	    $("#region-main").on("change", function() {
	        updateSubRegionOptions();
	    });
	    
	    $("#category-main").on("change", function(){
	    	updateSubCategoryUpdate();
	    });
	    
	    updateSubRegionOptions();
	    updateSubCategoryUpdate();
	    
	});


	// 지역 옵션 업데이트
	function updateSubRegionOptions() {
		
	    let mainRegionSelect = $("#region-main");
	    let subRegionSelect = $("#region-sub");
	
	    // 선택된 지역 값 가져오기
	    let selectedRegion = mainRegionSelect.val();
	
	    // 서브 지역 옵션 초기화
	    let subRegionOptions = "";
	    
	    switch (selectedRegion) {
	        case "전국":
	                subRegionOptions += '<option value="all">-</option>';
            break;
	        case "서울":
	            $.each(seoul, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "세종":
	            $.each(sejong, function(index, subRegion) {
	                subRegionOptions += '<option value="' + subRegion + '">' + subRegion + '</option>';
	            });
	            break;
	        case "강원":
	            $.each(gangwon, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "인천":
	            $.each(incheon, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "경기":
	            $.each(gyeonggi, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "충북":
	            $.each(chungbuk, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "충남":
	            $.each(chungnam, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "대전":
	            $.each(daejeon, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "경북":
	            $.each(gyeongbuk, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "대구":
	            $.each(daegu, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "경남":
	            $.each(gyeongnam, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "부산":
	            $.each(busan, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "울산":
	            $.each(ulsan, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "전북":
	            $.each(jeonbuk, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "전남":
	            $.each(jeonnam, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "광주":
	            $.each(gwangju, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        case "제주":
	            $.each(jeju, function(index, subRegion) {
	                subRegionOptions += '<option>' + subRegion + '</option>';
	            });
	            break;
	        default:
	            break;
	    }
	    // 서브 지역 옵션 업데이트
	    subRegionSelect.html(subRegionOptions);
	}
	
    // 카테고리 옵션 업데이트
    function updateSubCategoryUpdate() {
    	
	    let mainCategorySelect = $("#category-main");
	    let subCategorySelect = $("#category-sub");
	
	    // 선택된 카테고리 값 가져오기
	    let selectedCategory = mainCategorySelect.val();
	
	    // 서브 카테고리 옵션 초기화
	    let subCategoryOptions = "";
	    
	    switch(selectedCategory) {
	        case "0":
	            subCategoryOptions += '<option value="0">' + "-" + '</option>';
	    	break;
	        case "1":
            $.each(homeLiving, function(index, subCategory) {
            	 subCategoryOptions += '<option value="' + (101 + index) + '">' + homeLiving[index] + '</option>';
            });
            break;
	        case "2":
	            $.each(hobbyEdu, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (201 + index) + '">' + hobbyEdu[index] + '</option>';
	            });
	            break;
	        case "3":
	            $.each(healthBeauty, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (301 + index) + '">' + healthBeauty[index] + '</option>';
	            });
	            break;
	        case "4":
	            $.each(design, function(index, subCategory) {
	            	 subCategoryOptions += '<option value="' + (301 + index) + '">' + design[index] + '</option>';
	            });
	            break;
	        case "5":
	            $.each(event, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (501 + index) + '">' + event[index] + '</option>';
	            });
	            break;
	        case "6":
	            $.each(development, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (601 + index) + '">' + development[index] + '</option>';
	            });
	            break;
	        case "7":
	            $.each(business, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (701 + index) + '">' + business[index] + '</option>';
	            });
	            break;
	        case "8":
	            $.each(law, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (801 + index) + '">' + law[index] + '</option>';
	            });
	            break;
	        case "9":
	            $.each(other, function (index, subCategory) {
	                subCategoryOptions += '<option value="' + (901 + index) + '">' + other[index] + '</option>';
	            });
	            break;
	        default:
	            break;

	    }
	    subCategorySelect.html(subCategoryOptions);
    }

</script>
     <jsp:include page="../common/footer.jsp"/>
</body>
</html>