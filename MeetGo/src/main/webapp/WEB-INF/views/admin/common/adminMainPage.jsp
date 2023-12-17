<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<head>
	<title>MeetGo 관리자 메인 페이지</title>
<style>
	#myChart{
		width:500px;
		height:700px;
	}
	#chart1{
		width:500px;
		height:700px;
	}
</style>
</head>
<body>
    <jsp:include page="adminHeader.jsp"/>
	<div style="width: 80%; margin: auto; text-align:center">
		
		<br>
		
		<h1>메인페이지</h1>
		
		<br>
		
		<div id="chart1" style="text-align:center">
			<h4>회원가입추이(6개월)</h4> <br>
	  		<canvas id="myChart"></canvas>
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
</script>
</body>
</html>