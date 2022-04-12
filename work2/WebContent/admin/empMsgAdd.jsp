<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="../css/admin/amazeui.min.css">
<link rel="stylesheet" href="../css/admin/dmin.css">
<link rel="stylesheet" href="../css/app.css">
<style>
.admin-main {
	padding-top: 0px;
}
</style>
</head>
<body>
	<div class="admin-content-body">
		<div class="am-cf am-padding am-padding-bottom-0">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">订单信息</strong><small></small>
			</div>
		</div>

		<div class="am-cf admin-main">
			<!-- content start -->
			<div class="admin-content">
				<div class="admin-content-body">
					<div class="am-g">
						<form role="form" enctype="multipart/form-data"
							class="am-form am-form-horizontal" action="../empMsg/empMsgAdd"
							method="post" style="padding-top: 30px;">
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									收货人 </label>
								<div class="am-u-sm-9">
									<select class="form-control" name="mreceiver"
										<c:if test="${msg.mreceiver!=null&&msg.mreceiver!=0}">readonly</c:if>>
										<c:forEach items="${emps}" var="t">
											<option value="${t.uid}"
												${t.uid==msg.mreceiver?'selected':'' }>${t.uname}</option>
										</c:forEach>
									</select>  
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									订单名 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${msg.mtitle}" name="mtitle"
										type="text"
										<c:if test="${msg.mtitle!=null&&msg.mtitle!=''}">readonly</c:if>>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									订单内容 </label>
								<div class="am-u-sm-9">
									<input id="" required value="${msg.mcontent}" name="mcontent"
										type="text"
										<c:if test="${msg.mcontent!=null&&msg.mcontent!=''}">readonly</c:if>>
								</div>
							</div>
							<c:if test="${msg.mid==null ||msg.mid==0 }">
								<div class="am-form-group">
									<div class="am-u-sm-9 am-u-sm-push-3">
										<input id="addRole" class="am-btn am-btn-success" value="发送"
											type="submit">
									</div>
								</div>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="../js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
	
</script>
</html>
