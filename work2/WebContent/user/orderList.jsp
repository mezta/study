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
<!-- Bootstrap -->
<link href="${basePath}css/bootstrap.min.css" rel="stylesheet">
<script src="${basePath}js/jquery.min.js"></script>
<script src="${basePath}js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<table class="table table-bordered">
	<div class="panel panel-primary" style="padding-top:50px;"> 
	<h3 align="center">我的订单信息</h3>
		<table class="table table-striped table-hover">
			<tr>
								<th class="table-id" style="width: 10%; text-align: center">ID</th>
								<th class="table-id" style="width: 10%; text-align: center">商户订单号</th>
								<th class="table-id" style="width: 10%; text-align: center">下单时间</th>
								
								<th class=" table-id" style="width: 10%; text-align: center">付款金额</th>
								<th class=" table-id" style="width: 10%; text-align: center">订单积分</th>
								<th class="table-id"
									style="width: 10%; text-align: center">商品编码</th>
									<!-- <th class="" style="width: 10%; text-align: center">会员到期时间</th> -->
								<th class="table-set" style="width: 10%; text-align: center">操作</th>
							</tr>
							<c:forEach items="${msgs}" var="val" varStatus="vs">
									<tr>
										<td style="width: 10%; text-align: center">${vs.index+1}</td>
										<td style="width: 15%; text-align: center">${val.mtitle}
										</td>
										<td class="" style="width: 15%; text-align: center">${val.msendtime}
										</td>
								
										<td  style="width: 12%; text-align: center">${val.mprize}
										</td>
										<td class=""
											style="width: 10%; text-align: center">${val.mcount}</td>
										<td class=""
											style="width: 10%; text-align: center">${val.mcontent}</td>
											<%-- <td class=""
											style="width: 12%; text-align: center">${val.msender}</td>
							 --%>
										<td style="width: 20%; text-align: center; ">
											<div class="am-btn-toolbar"
												style="text-align: center;">
												
														<button
															class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
															<span class="am-icon-trash-o" style="text-align: center"></span>
															<a href="${basePath}empMsg/deleteMsgByID?mid=${val.mid}&uid=${userMain.uid}" onclick="return confirm('确实要删除吗?')">删除订单</a>
														</button>
								
												
												</button>
													</div>
												
											</div>
										</td>
									</tr>
								</a>
							</c:forEach>
		
		</table>	
		<br />
			<!-- 信息提示 -->
			<input value="${mess}" type="hidden" id="message">
	</div>
	</table>
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
