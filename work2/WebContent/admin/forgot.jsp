<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>后台修改密码</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<meta name="keywords"
	content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
<link href="../assets/loginWork2/css/style.css" rel='stylesheet'
	type='text/css' />
<!--webfonts-->
<link
	href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet'
	type='text/css'>
<!--//webfonts-->
<script
	src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<style>
		#forgetPwd {
	    border-radius: 25px;
	    background: red;
	    padding: 20px;
	    width: 90px;
	    height: 30px;
		}
	</style>
</head>
<body>
	<script>
		$(document).ready(function(c) {
		});
	</script>
	<!--SIGN UP-->
	<h1>修改密码</h1>
	<div class="login-form">
	<div class="head-info">
	<a id="forgot1" href="../admin/login"><label class="lbl-1" style="font-size:13px;color:white" >登</label></a>
	</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="../assets/loginWork2/images/avtar.png" />
		</div>
		<form action="../adminUser/forgot">
			<input type="text" name="email" class="text" id="email" placeholder="Email" autocomplete="off">
			<div class="key">
				<input type="password" name="apass" class="form-control" id="apass" placeholder="新密码" autocomplete="off">
			</div>
			<div class="signin">
				<input type="submit" value="修改">
			</div>
		</form>
	</div>

</body>
</html>