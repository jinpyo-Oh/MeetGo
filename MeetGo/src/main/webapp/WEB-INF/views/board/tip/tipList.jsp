<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
    @font-face {
        font-family: 'Pretendard-Regular';
        src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
        font-weight: 400;
        font-style: normal;
    }
    * { font-family: 'Pretendard-Regular'; 
    
    } 
    
    @import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css");

    div{
       /*border : 1px solid red; */  
    }
    .wrap{
    
    width: 1000px;
    height: 1000px;
    margin: auto;
    }

    .content_1{
        height: 1000px;
        width: 1000px;
        float: right;
        box-sizing: border-box;

    }
    .content_title{
        width: 1000px;
        height: 100px;
        box-sizing: border-box;

    }
    .content_1_1{
        box-sizing: border-box;
        width: 1000px;
        height: 50px;
    }
    .content_1_2{
        box-sizing: border-box;
        height: 850px;
        width: 1000px;

    }
    .content_main1_1{
        box-sizing: border-box;
        float: left;
        width: 70%;
        height: 20%;
        
    }
    .content_main1_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
        
    }
    .content_main2_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;
        
    }
    .content_main2_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
    }

    .content_main3_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;
        
    }
    .content_main3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
    }
    .content_main4_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;
        
    }
    .content_main4_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
    }
    
    .content_1_3_1{
        width: 70%;
        box-sizing: border-box;
        float: left;
        height: 20%;      
    }
    .content_1_3_2{
        width: 30%;
        box-sizing: border-box;
        text-align: center;
        float: right;
        height: 20%;
        display: flex;
        justify-content: center;
        align-items: center;

    }
    
   </style>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>

	  <div class="wrap">
       
        <div class="content_1">
            
            <div class="content_title" style="text-align: center; font-size: 28px;"  >        
                <p>팁과 노하우</p>
                
                <hr>
            </div>
            
            <div class="content_1_1" style="text-align: right;">
                 
                <form action="test.do" method="get">             
                    <select name="">
                        <option value="new">최신순</option>
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                    </select>
                </form>    
            </div>
            
                       
            <div class="content_1_2">
                
                <div class="content_main1_1">
                    <h2>&nbsp;&nbsp; ${ m.boardTitle }</h2>
                  
                    <p>&nbsp;&nbsp; ${ m.boardContent }</p>
                      
                    &nbsp;&nbsp; &nbsp;&nbsp;<i class="bi bi-eye-fill"></i>                 
                    &nbsp;&nbsp;
                </div>   
                <div class="content_main1_2">
                    <img src="" id="titleImg" width="170" height="160" >    
                </div> 
         
                    <div class="content_1_3_1" >
                        
                    <br><br><br><br><br>
                    <div class="list-bar">
                    <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                            </a>
                          </li>
                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                          <li class="page-item"><a class="page-link" href="#">2</a></li>
                          <li class="page-item"><a class="page-link" href="t">3</a></li>
                          <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                            </a>
                          </li>
                        </ul>
                      </nav>
                    </div>
                    </div>
                    
                    <div class="content_1_3_2" >
                    
                <a href="tipWrite.go">
                <button type="submit" class="btn btn-primary" >글작성</button>
            	</a>
                    
                    </div>
     
                
            </div>
                                   
        </div>

    </div>
    	<jsp:include page="../../common/footer.jsp"/>
    
</body>
</html>