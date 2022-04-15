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
   <!--  <style>
        .my-alert {
            position: absolute;
            z-index: 1000;
            width: 230px;
            height: 120px;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: rgb(205, 200, 205);
        }
        .my-alert .title {
            height: 90px;
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            line-height: 24px;
        }

        .my-alert .button {
            text-align: center;
        }
        .my-alert .button button {
            width: 120px;
            height: 30px;
            border: none;
            outline: none;
            background-color: aquamarine;
            cursor: pointer;
        }
    </style> -->
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
               <input type="hidden" readonly="readonly" name="uid" value="${userMain.uid}">
                    <p>用户：${userMain.uname}</p>               
                    <p>密码：${userMain.upass}</p>
                    <p>昵称：${userMain.nickName}</p>
                    <p>年龄：${userMain.age} </p> 
                    <p>电话：${userMain.telephone}</p>
                    <p>email：${userMain.email}</p>
                    <p>积分：${userMain.letter}</p>
             
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
                      <%--  <c:forEach items="${daqi}" var="val" varStatus="vs">
				     <p>套餐id：${val.mcontent}</p>
				     <p>剩余天数：${val.mreceiver} 请及时续费！！</p>
			</c:forEach> --%>
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
<%-- <script src="${basePath}js/layui.js">
var arry=new Array();
<c:forEach items="${daqi}" var="val">
// createAlert(${val.mcontent},  ${val.mreceiver})
//layer.alert('${val.mcontent},  ${val.mreceiver}', {icon: 6});
		alert("${val.mcontent},  ${val.mreceiver}")
layer.open({
  type:1,
  content:"${val.mcontent},  ${val.mreceiver}",
  btn:["确认"]
})
</c:forEach>

</script> --%>
<script  type="text/javascript">
    var message = document.getElementById("message").value;
    if (message != null && message != "") {
        alert(message);
    }
   /*   var arry=new Array();
    
    <c:forEach items="${daqi}" var="val">
    createAlert(${val.mcontent},  ${val.mreceiver})
     layer.alert('${val.mcontent},  ${val.mreceiver}', {icon: 6}); */
   		alert("您的套餐${val.mcontent} 还有 ${val.mreceiver} 天就到期啦！请即使续费哦！")
    </c:forEach> 
    
  
   /*
   function createAlert(mcontent, mreceiver) {
        let div = document.createElement("div");
        div.classList.add("my-alert")
        
        let title = document.createElement("div");
        title.classList.add("title");
        title.innerText = "套餐id：" + mcontent +"的剩余天数："+ mreceiver + "请及时续费！！";
        div.appendChild(title);

        let button = document.createElement("div");
        button.classList.add("button");
        let btn = document.createElement("button");
        btn.innerHTML = "确定"
        btn.onclick = function() {
            div.remove();
        }
        button.appendChild(btn);

        div.appendChild(button)


        document.body.appendChild(div);
    }
     
   
   <c:forEach items="${daqi}" var="val">
    createAlert(${val.mcontent},  ${val.mreceiver})
    </c:forEach> 
   */  */
 </script>  
</html>
