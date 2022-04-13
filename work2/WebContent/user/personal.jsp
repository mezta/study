<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>
<style>
 .a2 {
			background-color: #ff9800;
			color: #000000;
			padding: 10px;
			text-decoration: none;
			font-size: 12px;
			box-shadow: #666 0px 0px 6px;
		}
		.a2:active{
			background-color: #bdbc9d;
		}
    


</style>
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
</head>
<body class="inblog-page">
<jsp:include page="header.jsp"></jsp:include>
 <div class="wrap">
	<h3 align="center">个人中心</h3>
       
        </div>
   <div class="main-content main-content-login">
    <div class="container">
        <div class="row">
            <div class="content-area col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="site-main">
                    <h3 class="custom_blog_title">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${success}
                    </h3>
                    <div class="customer_login">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="login-item">
                      <div class="col-l-4">
               <input type="hidden" readonly="readonly" name="uid" value="${userfomation.uid}">
                    <p>用户：${userfomation.uname}</p>               
                    <p>密码：${userfomation.upass}</p>
                    <p>昵称：${userfomation.nickName}</p>
                    <p>年龄：${userfomation.age} </p> 
                    <p>电话：${userfomation.telephone}</p>
                    <p>email：${userfomation.email}</p>
                    <p>积分：${userfomation.letter}</p>
             
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  href="${basePath}user/getUserInfomation?uid=${userfomation.uid}" class=a2 />修改信息</a>
                </div> 
                                </div>
                                
                            </div>
                            
                            <div class="col-lg-6 col-md-6 col-sm-12">
                             
                                    <table class="table">
                                    <thead class="table-dark">
							<!-- <h3 style="text-align:center">团购套餐</h3> -->
							<tr>				
								
								<th class="table-id" style="width: 10%;color:white; text-align: center">会员套餐</th>
								<th class="table-id" style="width: 10%; color:white;text-align: center">开始时间</th>
								<th class="" style="width: 10%; color:white;text-align: center">会员到期时间</th>
								<th class=" table-id" style="width: 10%;color:white; text-align: center">剩余天数</th>
					
							</tr>
							</thead>
							<tbody>
							<c:forEach items="${msgs}" var="val" varStatus="vs">
									<tr>
										<td class="" style="width: 10%; text-align: center">${val.mcontent}</td>
										<td class="" style="width: 15%; text-align: center">${val.msendtime}</td>						
										<td class="" style="width: 12%; text-align: center">${val.msender}</td>
										<td class="" style="width: 10%;color: red; text-align: center">${val.mreceiver}</td>
									</tr>
								</a>
							</c:forEach>
							</tbody>
		</table>	
                                </div>
                            </div>
                      
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
		
		<br />
			<!-- 信息提示 -->
			<input value="${mess}" type="hidden" id="message">
	
	
	 <footer>
            <div class="container text-center">
                <div class="powered_by_metinfo">
                    <p style="text-align: center;">@海格利斯游泳馆</span></p>
                </div>
            </div>
        </footer>
        <button type="button" class="btn btn-icon btn-primary btn-squared met-scroll-top hide">
            <i class="icon wb-chevron-up" aria-hidden="true">
            </i>
        </button>

</body>
<script src="${basePath}js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var message = document.getElementById("message").value;
    if (message != null && message != "") {
        alert(message);
    }
 </script>  
</html>
