<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>메인페이지</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
	<style>
		html, body {
			height: 100%;
		}
        .content {
            width: 1200px;
            margin: 0 auto;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .swiper {
            width: 1200px;
            height: 400px;
			margin: 30px auto;
            position: relative;
        }
        .swiper-slide>img {
            width : 100%;
            height : 100%;
        }
        div[class^=swiper-button] {
            color : white;
			display : none;
        }

        .main-category {
            width: 1000px;
            height: auto;
			padding: 0;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .category-item{
			width: 180px;
			height: 200px;
		}
		.category-img-wrapper img{
			width: 80px;
			height: 80px;
		}
		.main-header {
			width: 1200px;
			height: 50px;
			display: flex;
			align-items: center;
			justify-content: space-between;
		}
		.main-portfolio {
			display: flex;
			align-items: center;
		}
        .portfolio-card{
			width: 300px;
			height: 300px;
			text-align: center;
			margin: 20px;
		}
		.portfolio-img {
			position: relative;
		}
		.portfolio-img img {
			margin: auto;
			width: 250px;
			height: 250px;
			border-radius: 10px;
		}
		.portfolio-img-text {
			margin-left: 10px;
			text-align: left;
			color: white;
            text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
            /*-webkit-text-stroke: 1px black;*/
            /*-webkit-text-stroke-width: 1px;*/
            /*-webkit-text-stroke-color: black;*/
			position: absolute;
			top: 85%;
			left: 50%;
			width: 100%;
			transform: translate(-50%, -50%);
		}
        .portfolio-img-text p, .portfolio-img-text h4{
			margin: 5px;
		}
        .portfolio-img-text h4 {
			font-size: 20px;
		}
		.portfolio-img-text p {
			font-size: 18px;
		}
		.portfolio-info {
			width: 250px;
			margin: 10px auto 0 auto;
            display: flex;
		}
        .portfolio-info img{
			width: 40px;
			height: 40px;
			border-radius: 20px;
			margin-right: 15px;
		}
		.portfolio-info p{
			line-height: 100%;
			margin-top: 10px;
		}
        .tip-card {
            width: 600px;
            height: 200px;
            margin: 20px;
            border: 1px solid #f2f2f2;
			background-color: #fafafa;
			
        }
        .tip-card-header {
            padding: 20px 25px;
            display: flex;
            align-items: center;
        }
        .tip-card-img {
			width: 20%;
		}
        .tip-card-info{
			width: 65%;
        }
		.tip-card-header img {
			width: 80px;
			height: 80px;
			border-radius: 40px;
		}
		.card-category {
            font-size: 20px;
			color: gray;
		}
		.card-name {
			font-size: 25px;
		}
		.tip-card-content{
            padding: 0 25px;
			color: #323232;
		}
	</style>
</head>

<body>
	<jsp:include page="common/header.jsp"/>
	<div class="content">
		
		
		<div class="swiper"> <!-- 슬라이드 이미지 시작 -->
			<div class="swiper-wrapper">
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/banner1.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/banner2.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/banner3.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/banner4.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/mainPage/banner5.png"></div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
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
                navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                    prevEl: '.swiper-button-prev',
                    nextEl: '.swiper-button-next'
                }
            });
		</script> <!-- 슬라이드 이미지 끝 -->
		
		<div class=""> <!-- 카티고리 영역 시작 -->
			<ul class="main-category">
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/all-icon.png" alt="전체" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">전체</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/home-icon.png" alt="홈/리빙" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">홈/리빙</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/hobby-icon.png" alt="취미/교육" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">취미/교육</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/health-icon.png" alt="건강/미용" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">건강/미용</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/design-icon.png" alt="디자인" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">디자인</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/event-icon.png" alt="이벤트" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">이벤트</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/develop-icon.png" alt="IT/개발" class="category-img">
							</div>
							<p class="category-title">IT/개발</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/business-icon.png" alt="비즈니스" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">비즈니스</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/Admin-icon.png" alt="법률/행정" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">법률/행정</p>
						</div>
					</a>
				</li>

				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="<%=request.getContextPath()%>/resources/images/common/mainPage/guitar-icon.png" alt="기타" class="category-img">
							</div>
							<p class="category-title">기타</p>
						</div>
					</a>
				</li>
			</ul>
		</div> <!-- 카티고리 영역 끝 -->
		
		
		
		<section> <!-- 포트폴리오 영역 -->
			<div class="main-header">
				<h2>MeetGo 포트폴리오</h2>
				<a href="<%=request.getContextPath()%>/sendPofol.po" class="go-list" data-v-1b5b0368 data-v-3daa4096>
					<span data-v-1b5b0368>전체보기</span>
					<img style="width: 15px; height: 15px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABZWVn8/PxkZGRNTU309PRtbW06OjpWVlZSUlJbW1tJSUn39/dpaWn5+flERESsrKyioqJAQECOjo63t7cLCwva2tqXl5dzc3MWFhYtLS3j4+PLy8thYWHCwsKampqAgIAfHx/e3t41NTXHcqcgAAAD30lEQVR4nO2dC3ITMRBEpWyy+WGMTZyvA3Hg/mckWw4QLNmrdpwSbzTvANR0Tc9Mi61yQngP/eLu7P764Xy+fNc/89/SX8U/nN/UruYDeLyOb7mqXc/BmcUNvtWu6MDMNwXGeFK7poOSEfgyjLWrOiBZgTEe1a7rYGwRGONF7coOxFaBVmZxh0AbRt0p0MK6WewWyDfqzZhAfBc/jStkz+L3AoHsLn4pUgiexWmZQHAXy0w6QJ3F0VOBN+rItf8HZkYVegg1avkcDhDXzVJSiJzFZ00isIu3mkLgLBaf/N/wNmryn4hj8GZxpUrkGfXCvsRzVSLOqN2lKhG3brojVSLPqPIs8k6/3MUGZhHXxU7eqA3MIm6jBtmoDcxiA0bFrRsPcBa66AHOQhc9wFnoYtfAq1+WiDOqHuBwGdUDXAbcuvEAZ6GL/urPgNuo/urP0IBRG5DYgFFx68Zf/Rlwp98DnIUueoDLgNuoHuAy8Ix6Yl+iH40U3Lrxo5EBd/r9s42FLrbw2Ua+i7iN2sJnmwZe/bJRcevGA5yFLrYQ4Bo4Gh7gUnBGbSHA+WebFNy68QCXAXf6PcBZ6GILR8MDXApvFv1oWJDoAS4Ft2781Z8Bd/o9wFnooh7g7mqXLCPP4rx2xTJyuulrV6wiBzjgL6OrRq1d7x6IRwP4C/7i0VjUrncPtFl8ql3uPvSKwlXtavegL/xlW2wP+5JfX/4Lbw67r5JA3i6dnmkCcfdQtGiMt7UrFpmoAuOkdskanWrROKtdssZEXDK43C3PYDytXbLGVDr0A8e1S9aQz0T8XLtkDS2qDcAsqp8JWAfVqIabwYk8gzCL2j8TskCYRfWoBlsyvbxkYBbVZxDWwc6j2iY0i3pU24Q2g7JFYTPoUY0u0PyL3n5Us34m7Ec16y96j2p0gXpUg1nUflTzFz1coPmo5h9fEmAW9aiWAJtBf9HTBXpUS4AtGf/4QhfoUS2BNoPWo5r9jy8e1TaBWdTPRALMovajmvUz4S/6BNgM+scXukB/0dMF+scXukDzUc1f9Akwi3pUS4DNoL/o6QI9qiXAlox/fKEL9KiWQJtB61HNP74kmJ9BmEXDsXWBT6pAmEW13x0bgC2ZEFaiQJpFQ7DewfCoCaTN4AsLSSDPoiHcWhcYVoJA3gwOzMsFAmdwoHwOkRZ9YWldYAjPpi06MCsSyFwyrzyYtuhAQapBdzAUHAzwDL5yZdmia3ZKtCBwp0S+RddslWhF4FaJNiy6JivRksCsRDsWXZM8hnl/5GaMjZcU70/cjLNcvXHoj9rVfAz97PTn/fXD5WxZu5Lt/AJjmD6cEME9/gAAAABJRU5ErkJggg==">
				</a>
			</div>
			<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
			<script>
				$(function (){
                    $.ajax({
						url : "selectMainPortfolio",
						method : "get",
						success : function (data){
                            console.log(data);
                            for (let i = 0; i < data.length; i++) {
								let pofol = data[i].pofol;
                                let pofolUrl = data[i].firstImg;
                                let userUrl = data[i].gosuImg;
                                let pofolTitle = (pofol.pofolTitle).replaceAll(" ", "").length > 10 ? pofol.pofolTitle.substring(0,12) + "..." : pofol.pofolTitle;
                                var pofolCard = '<div class="portfolio-card">' +
													'<div class="portfolio-img">' +
														'<img src="'+pofolUrl+'">' +
														'<div class="portfolio-img-text">' +
															'<h4>'+pofolTitle+'</h4>' +
															'<p>'+pofol.pofolService+'</p>' +
														'</div>' +
													'</div>' +
													'<div class="portfolio-info">' +
														'<img src="'+userUrl+'">' +
														'<p>'+data[i].userNickname+'</p>' +
													'</div>' +
												'</div>';
                                $('.main-pofol').append(pofolCard);
                            }
                            $('.main-pofol').slick({
                                dots: true,
                                infinite: false,
                                speed: 300,
                                slidesToShow: 4,
                                slidesToScroll: 4,
                                responsive: [
                                    {
                                        breakpoint: 1024,
                                        settings: {
                                            slidesToShow: 3,
                                            slidesToScroll: 3,
                                            infinite: true,
                                            dots: true
                                        }
                                    },
                                    {
                                        breakpoint: 600,
                                        settings: {
                                            slidesToShow: 2,
                                            slidesToScroll: 2
                                        }
                                    },
                                    {
                                        breakpoint: 480,
                                        settings: {
                                            slidesToShow: 1,
                                            slidesToScroll: 1
                                        }
                                    }
                                    // You can unslick at a given breakpoint now by adding:
                                    // settings: "unslick"
                                    // instead of a settings object
                                ]
                            });
						},
						error : function (){
                            alert("메인페이지 포폴 조회 실패");
						}
					})
				})
			</script>
			<div class="main-portfolio main-pofol">
			
			</div>
			<script>
			
			</script>
		</section>
		<br><br>
		<section> <!-- MeetGo 꿀팁 영역 시작 -->
			<div class="main-header">
				<h2>MeetGo 꿀팁</h2>
				<a href="/portfolio/?from=main-portfolio" class="go-list" data-v-1b5b0368 data-v-3daa4096>
					<span data-v-1b5b0368>전체보기</span>
					<img style="width: 15px; height: 15px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABZWVn8/PxkZGRNTU309PRtbW06OjpWVlZSUlJbW1tJSUn39/dpaWn5+flERESsrKyioqJAQECOjo63t7cLCwva2tqXl5dzc3MWFhYtLS3j4+PLy8thYWHCwsKampqAgIAfHx/e3t41NTXHcqcgAAAD30lEQVR4nO2dC3ITMRBEpWyy+WGMTZyvA3Hg/mckWw4QLNmrdpwSbzTvANR0Tc9Mi61yQngP/eLu7P764Xy+fNc/89/SX8U/nN/UruYDeLyOb7mqXc/BmcUNvtWu6MDMNwXGeFK7poOSEfgyjLWrOiBZgTEe1a7rYGwRGONF7coOxFaBVmZxh0AbRt0p0MK6WewWyDfqzZhAfBc/jStkz+L3AoHsLn4pUgiexWmZQHAXy0w6QJ3F0VOBN+rItf8HZkYVegg1avkcDhDXzVJSiJzFZ00isIu3mkLgLBaf/N/wNmryn4hj8GZxpUrkGfXCvsRzVSLOqN2lKhG3brojVSLPqPIs8k6/3MUGZhHXxU7eqA3MIm6jBtmoDcxiA0bFrRsPcBa66AHOQhc9wFnoYtfAq1+WiDOqHuBwGdUDXAbcuvEAZ6GL/urPgNuo/urP0IBRG5DYgFFx68Zf/Rlwp98DnIUueoDLgNuoHuAy8Ix6Yl+iH40U3Lrxo5EBd/r9s42FLrbw2Ua+i7iN2sJnmwZe/bJRcevGA5yFLrYQ4Bo4Gh7gUnBGbSHA+WebFNy68QCXAXf6PcBZ6GILR8MDXApvFv1oWJDoAS4Ft2781Z8Bd/o9wFnooh7g7mqXLCPP4rx2xTJyuulrV6wiBzjgL6OrRq1d7x6IRwP4C/7i0VjUrncPtFl8ql3uPvSKwlXtavegL/xlW2wP+5JfX/4Lbw67r5JA3i6dnmkCcfdQtGiMt7UrFpmoAuOkdskanWrROKtdssZEXDK43C3PYDytXbLGVDr0A8e1S9aQz0T8XLtkDS2qDcAsqp8JWAfVqIabwYk8gzCL2j8TskCYRfWoBlsyvbxkYBbVZxDWwc6j2iY0i3pU24Q2g7JFYTPoUY0u0PyL3n5Us34m7Ec16y96j2p0gXpUg1nUflTzFz1coPmo5h9fEmAW9aiWAJtBf9HTBXpUS4AtGf/4QhfoUS2BNoPWo5r9jy8e1TaBWdTPRALMovajmvUz4S/6BNgM+scXukB/0dMF+scXukDzUc1f9Akwi3pUS4DNoL/o6QI9qiXAlox/fKEL9KiWQJtB61HNP74kmJ9BmEXDsXWBT6pAmEW13x0bgC2ZEFaiQJpFQ7DewfCoCaTN4AsLSSDPoiHcWhcYVoJA3gwOzMsFAmdwoHwOkRZ9YWldYAjPpi06MCsSyFwyrzyYtuhAQapBdzAUHAzwDL5yZdmia3ZKtCBwp0S+RddslWhF4FaJNiy6JivRksCsRDsWXZM8hnl/5GaMjZcU70/cjLNcvXHoj9rVfAz97PTn/fXD5WxZu5Lt/AJjmD6cEME9/gAAAABJRU5ErkJggg==">
				</a>
			</div>
			<div class="main-portfolio">
				<div class="tip-card">
					<div class="tip-card-header">
						<div class="tip-card-img">
							<img c src="https://img.allurekorea.com/allure/2023/05/style_6451ca47394b6-960x1200.jpg" alt="">
						</div>
						<div class="tip-card-info">
							<div class="card-category">부분·피팅모델 알바</div>
							<div class="card-name">정채연</div>
						</div>
						<a href="">
							<span data-v-1b5b0368>더보기</span>
							<img style="width: 15px; height: 15px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABZWVn8/PxkZGRNTU309PRtbW06OjpWVlZSUlJbW1tJSUn39/dpaWn5+flERESsrKyioqJAQECOjo63t7cLCwva2tqXl5dzc3MWFhYtLS3j4+PLy8thYWHCwsKampqAgIAfHx/e3t41NTXHcqcgAAAD30lEQVR4nO2dC3ITMRBEpWyy+WGMTZyvA3Hg/mckWw4QLNmrdpwSbzTvANR0Tc9Mi61yQngP/eLu7P764Xy+fNc/89/SX8U/nN/UruYDeLyOb7mqXc/BmcUNvtWu6MDMNwXGeFK7poOSEfgyjLWrOiBZgTEe1a7rYGwRGONF7coOxFaBVmZxh0AbRt0p0MK6WewWyDfqzZhAfBc/jStkz+L3AoHsLn4pUgiexWmZQHAXy0w6QJ3F0VOBN+rItf8HZkYVegg1avkcDhDXzVJSiJzFZ00isIu3mkLgLBaf/N/wNmryn4hj8GZxpUrkGfXCvsRzVSLOqN2lKhG3brojVSLPqPIs8k6/3MUGZhHXxU7eqA3MIm6jBtmoDcxiA0bFrRsPcBa66AHOQhc9wFnoYtfAq1+WiDOqHuBwGdUDXAbcuvEAZ6GL/urPgNuo/urP0IBRG5DYgFFx68Zf/Rlwp98DnIUueoDLgNuoHuAy8Ix6Yl+iH40U3Lrxo5EBd/r9s42FLrbw2Ua+i7iN2sJnmwZe/bJRcevGA5yFLrYQ4Bo4Gh7gUnBGbSHA+WebFNy68QCXAXf6PcBZ6GILR8MDXApvFv1oWJDoAS4Ft2781Z8Bd/o9wFnooh7g7mqXLCPP4rx2xTJyuulrV6wiBzjgL6OrRq1d7x6IRwP4C/7i0VjUrncPtFl8ql3uPvSKwlXtavegL/xlW2wP+5JfX/4Lbw67r5JA3i6dnmkCcfdQtGiMt7UrFpmoAuOkdskanWrROKtdssZEXDK43C3PYDytXbLGVDr0A8e1S9aQz0T8XLtkDS2qDcAsqp8JWAfVqIabwYk8gzCL2j8TskCYRfWoBlsyvbxkYBbVZxDWwc6j2iY0i3pU24Q2g7JFYTPoUY0u0PyL3n5Us34m7Ec16y96j2p0gXpUg1nUflTzFz1coPmo5h9fEmAW9aiWAJtBf9HTBXpUS4AtGf/4QhfoUS2BNoPWo5r9jy8e1TaBWdTPRALMovajmvUz4S/6BNgM+scXukB/0dMF+scXukDzUc1f9Akwi3pUS4DNoL/o6QI9qiXAlox/fKEL9KiWQJtB61HNP74kmJ9BmEXDsXWBT6pAmEW13x0bgC2ZEFaiQJpFQ7DewfCoCaTN4AsLSSDPoiHcWhcYVoJA3gwOzMsFAmdwoHwOkRZ9YWldYAjPpi06MCsSyFwyrzyYtuhAQapBdzAUHAzwDL5yZdmia3ZKtCBwp0S+RddslWhF4FaJNiy6JivRksCsRDsWXZM8hnl/5GaMjZcU70/cjLNcvXHoj9rVfAz97PTn/fXD5WxZu5Lt/AJjmD6cEME9/gAAAABJRU5ErkJggg==">
						</a>
					</div>
					<div class="tip-card-content">
						<div>
							메이크업 헤어 + 모델 시간당 포토샵 포함시 10만원으로 진행 합니다
							촬영 끝나고 5일 안에 보정본 보내 드립니다 포토샵 as 가능합니다
						</div>
					</div>
				</div>
				<div class="tip-card">
					<div class="tip-card-header">
						<div class="tip-card-img">
							<img src="https://img.allurekorea.com/allure/2023/05/style_6451ca47394b6-960x1200.jpg" alt="">
						</div>
						<div class="tip-card-info">
							<div class="card-category">부분·피팅모델 알바</div>
							<div class="card-name">정채연</div>
						</div>
						<a href="">
							<span data-v-1b5b0368>더보기</span>
							<img style="width: 15px; height: 15px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAb1BMVEX///8AAABZWVn8/PxkZGRNTU309PRtbW06OjpWVlZSUlJbW1tJSUn39/dpaWn5+flERESsrKyioqJAQECOjo63t7cLCwva2tqXl5dzc3MWFhYtLS3j4+PLy8thYWHCwsKampqAgIAfHx/e3t41NTXHcqcgAAAD30lEQVR4nO2dC3ITMRBEpWyy+WGMTZyvA3Hg/mckWw4QLNmrdpwSbzTvANR0Tc9Mi61yQngP/eLu7P764Xy+fNc/89/SX8U/nN/UruYDeLyOb7mqXc/BmcUNvtWu6MDMNwXGeFK7poOSEfgyjLWrOiBZgTEe1a7rYGwRGONF7coOxFaBVmZxh0AbRt0p0MK6WewWyDfqzZhAfBc/jStkz+L3AoHsLn4pUgiexWmZQHAXy0w6QJ3F0VOBN+rItf8HZkYVegg1avkcDhDXzVJSiJzFZ00isIu3mkLgLBaf/N/wNmryn4hj8GZxpUrkGfXCvsRzVSLOqN2lKhG3brojVSLPqPIs8k6/3MUGZhHXxU7eqA3MIm6jBtmoDcxiA0bFrRsPcBa66AHOQhc9wFnoYtfAq1+WiDOqHuBwGdUDXAbcuvEAZ6GL/urPgNuo/urP0IBRG5DYgFFx68Zf/Rlwp98DnIUueoDLgNuoHuAy8Ix6Yl+iH40U3Lrxo5EBd/r9s42FLrbw2Ua+i7iN2sJnmwZe/bJRcevGA5yFLrYQ4Bo4Gh7gUnBGbSHA+WebFNy68QCXAXf6PcBZ6GILR8MDXApvFv1oWJDoAS4Ft2781Z8Bd/o9wFnooh7g7mqXLCPP4rx2xTJyuulrV6wiBzjgL6OrRq1d7x6IRwP4C/7i0VjUrncPtFl8ql3uPvSKwlXtavegL/xlW2wP+5JfX/4Lbw67r5JA3i6dnmkCcfdQtGiMt7UrFpmoAuOkdskanWrROKtdssZEXDK43C3PYDytXbLGVDr0A8e1S9aQz0T8XLtkDS2qDcAsqp8JWAfVqIabwYk8gzCL2j8TskCYRfWoBlsyvbxkYBbVZxDWwc6j2iY0i3pU24Q2g7JFYTPoUY0u0PyL3n5Us34m7Ec16y96j2p0gXpUg1nUflTzFz1coPmo5h9fEmAW9aiWAJtBf9HTBXpUS4AtGf/4QhfoUS2BNoPWo5r9jy8e1TaBWdTPRALMovajmvUz4S/6BNgM+scXukB/0dMF+scXukDzUc1f9Akwi3pUS4DNoL/o6QI9qiXAlox/fKEL9KiWQJtB61HNP74kmJ9BmEXDsXWBT6pAmEW13x0bgC2ZEFaiQJpFQ7DewfCoCaTN4AsLSSDPoiHcWhcYVoJA3gwOzMsFAmdwoHwOkRZ9YWldYAjPpi06MCsSyFwyrzyYtuhAQapBdzAUHAzwDL5yZdmia3ZKtCBwp0S+RddslWhF4FaJNiy6JivRksCsRDsWXZM8hnl/5GaMjZcU70/cjLNcvXHoj9rVfAz97PTn/fXD5WxZu5Lt/AJjmD6cEME9/gAAAABJRU5ErkJggg==">
						</a>
					</div>
					<div class="tip-card-content">
						<div>
							메이크업 헤어 + 모델 시간당 포토샵 포함시 10만원으로 진행 합니다
							촬영 끝나고 5일 안에 보정본 보내 드립니다 포토샵 as 가능합니다
						</div>
					</div>
				</div>
			</div>
		</section><!-- MeetGo 꿀팁 영역 끝 -->
	</div>
	<br><br>
	<jsp:include page="common/footer.jsp"/>
</body>
</html>
