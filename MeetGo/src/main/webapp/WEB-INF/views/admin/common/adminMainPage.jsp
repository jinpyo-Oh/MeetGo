<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<head>
	<title>MeetGo 관리자 메인 페이지</title>
<style>
	#main{
		display: flex;
	}
	#myChart{
		width:800px;
		height:800px;
		float:left;
	}
	#chart1{
		width:700px;
		height:800px;
		float:left;
	}
	#chartdiv {
		width: 700px; /* Set the desired width */
	    height: 440px; /* Set the desired height */
	    margin: auto;
	    float:right;
	    box-sizing: border-box;
	}
	#chart2{
		width:800px;
		height:400px;
	}
</style>
</head>
<body>
    <jsp:include page="adminHeader.jsp"/>
	<div style="width: 80%; margin: auto; text-align:center">
		
		<br>
		
		<h1>메인페이지</h1>
		
		<br>
		<div id="main">
			<div id="chart1" style="text-align:center">
				<h4 style="width:800px;">회원가입추이(6개월)</h4> <br>
		  		<canvas id="myChart"></canvas>
			</div>
			<div id="chart2" style="text-align:center">
				<h4>수익 추이</h4>
				<div id="chartdiv"></div>
			</div>
		</div>
		
	</div>
	
	<script>
    var labels = [];
    var dataValues = [];

    <c:forEach var="chartMemberDto" items="${requestScope.list1}">
        labels.push('${chartMemberDto.month}월');
        dataValues.push(${chartMemberDto.count});
    </c:forEach>

    // Your existing chart initialization code
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '회원 수',
                data: dataValues,
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    
    var chartData = [];
    <c:forEach var="dataPoint" items="${requestScope.list2}">
        chartData.push({
            "value": ${dataPoint.count},
            "months": ${dataPoint.month}
        });
    </c:forEach>

    // Create chart instance
    var chart = am4core.create("chartdiv", am4charts.XYChart);

    // Add data dynamically
    chart.data = chartData;

    // Create a date axis and a value axis
    var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
    var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());

    // Create a series for the smoothed line chart
    var series = chart.series.push(new am4charts.LineSeries());
    series.dataFields.dateX = "months";
    series.dataFields.valueY = "value";

    // Enable smoothing for the series
    series.tensionX = 0.8;
    series.tensionY = 0.8;

    // Add a cursor
    chart.cursor = new am4charts.XYCursor();

    // Add scrollbar
    chart.scrollbarX = new am4core.Scrollbar();

    // Add legend
    chart.legend = new am4charts.Legend();
</script>
</body>
</html>