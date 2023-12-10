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
			font-size: 15px;
		}
		.portfolio-img-text p {
			font-size: 13px;
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
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/banner1.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/banner2.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/banner3.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/banner4.png"></div>
				<div class="swiper-slide"><img src="<%=request.getContextPath()%>/resources/images/common/banner5.png"></div>
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
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_truck.svg" alt="이사" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">이사</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_cleaning.svg" alt="청소/정리" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">청소/정리</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_sofa_with_light.svg" alt="인테리어" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">인테리어</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_artist_palette.svg" alt="취미/레슨" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">취미/레슨</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_suit_case.svg" alt="문서작업" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">문서작업</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="data:image/png;base64,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" alt="요리" class="category-img">
							</div>
							<p class="category-title">요리</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://assets.cdn.soomgo.com/icons/category1/service_graduation_cap.svg" alt="과외" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">과외</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://cdn.icon-icons.com/icons2/1864/PNG/512/iconfinder-gymsports-and-competitionarchitecture-and-cityfitnessarchitecturebuildingsportexercise-4394760_119508.png" alt="운동" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">운동</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMQxtX91ur1My2Pte0NTV-5ZCtw99pHL8XCA&usqp=CAU" alt="디자인/개발" class="category-img" data-v-4f2bc4d0>
							</div>
							<p class="category-title">디자인/개발</p>
						</div>
					</a>
				</li>
				<li class="category-item">
					<a href="">
						<div class="category-icon">
							<div class="category-img-wrapper">
								<img src="data:image/png;base64,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" alt="기타" class="category-img">
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
				<a href="/portfolio/?from=main-portfolio" class="go-list" data-v-1b5b0368 data-v-3daa4096>
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
                                var pofolCard = '<div class="portfolio-card">' +
													'<div class="portfolio-img">' +
														'<img src="'+pofolUrl+'">' +
														'<div class="portfolio-img-text">' +
															'<h4>'+pofol.pofolTitle+'</h4>' +
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
