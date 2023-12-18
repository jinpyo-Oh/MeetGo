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
    #main {
      display: flex;
    }

    #chart1 {
      width: 850px;
      height: 800px;
      float: left;
    }

    #chart2 {
      width: 850px;
      height: 800px;
      float: right;
    }
    
    #myChart{
    	width:700px;
    	height: 800px;
    }
    
    #lineChart{
    	width: 700px;
    	height: 800px;
    }
    
  </style>
</head>
<body>
  <jsp:include page="adminHeader.jsp" />
  <div style="width: 80%; margin: auto; text-align:center">
    <br><br>
    <h1>메인페이지</h1>
    <br><br>
    <div id="main">
      <div id="chart1" style="text-align:center">
        <h4 style="width:100%;">회원가입 현황</h4> <br>
        <canvas id="myChart" width="750px;" height="550px;"></canvas>
      </div>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div id="chart2" style="text-align:center">
        <h4 style="width:100%;">수익 현황</h4> <br>
        <canvas id="lineChart" width="750px;" height="550px;"></canvas>
      </div>
      <div>
      </div>
    </div>
  </div>

  <script>
    var labels1 = [];
    var dataValues1 = [];

    <c:forEach var="chartMemberDto" items="${requestScope.list1}">
      labels1.push('${chartMemberDto.month}월');
      dataValues1.push(${chartMemberDto.count});
    </c:forEach>

    var ctx1 = document.getElementById('myChart').getContext('2d');
    new Chart(ctx1, {
      type: 'bar',
      data: {
        labels: labels1,
        datasets: [{
          label: '회원 수',
          data: dataValues1,
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

    // 2번 차트
    var ctx2 = document.getElementById('lineChart').getContext('2d');
        var lineChartData = {
            labels: [],
            datasets: [{
                label: 'Monthly Sales',
                data: [],
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false
            }]
        };

        <c:forEach var="dataPoint" items="${requestScope.list2}">
            lineChartData.labels.push('${dataPoint.month}'); // Assuming month is a string
            lineChartData.datasets[0].data.push(${dataPoint.count});
        </c:forEach>

        var lineChartOptions = {
            scales: {
                x: {
                    type: 'category',
                    labels: lineChartData.labels
                },
                y: {
                    type: 'linear',
                    position: 'left'
                }
            }
        };

        var lineChart = new Chart(ctx2, {
            type: 'line',
            data: lineChartData,
            options: lineChartOptions
        });
  </script>
</body>
</html>