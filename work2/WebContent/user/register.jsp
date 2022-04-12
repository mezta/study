<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>注册</title>
	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}css/materialize.min.css">
    <link rel="stylesheet" href="${basePath}css/tooplate.css">
    <!--  <link rel="stylesheet" href="../css/admin/amazeui.min.css">
		<link rel="stylesheet" href="../css/admin/admin.css">
     -->
   <style>
#register {
    background-image: url(${basePath}images/trainer-bg.jpg);
    /*  background-image: url(${basePath}images/d.jpg); */
   background-repeat:repeat-y;
    }
 </style>
</head>

<body id="register">
<div class="container">
 <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <header class="mb-5">
                    <h3 class="mt-0 white-text">注册用户</h3>
                </header>
            </div>
			  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
					<form class=""  method="post" style="padding-top:30px;" data-am-validator action="${basePath}user/register" enctype="multipart/form-data">
						<div class="am-form-group">
							
							<div class="am-u-sm-9">
								<input type="text" required name="nickName" id="nickName"  placeholder="请输入用户昵称"> 
							</div>
						</div>
						<div class="am-form-group">
							<div class="am-u-sm-9">
							
								<input type="text" id="uname" required name="uname" type="text"  placeholder="请输入用户名"> 
							</div>
						</div>
						<div class="am-form-group">
							
							<div class="am-u-sm-9">
								<input type="password" required name="upass" id="upass" placeholder="请输入密码"> 
							</div>
						</div>
						
						<div class="am-form-group">
							
							<div class="am-u-sm-9">
								<input type="text" id="telephone" required name="telephone" placeholder="请输入电话" 
									name="telephone"  > 
							</div>
						</div>
						<div class="am-form-group">
							
							<div class="am-u-sm-9">
								<input type="email" id="email" required name="email" placeholder="请输入邮箱" 
									name="email"  > 
							</div>
						</div>
						<div class="am-form-group">
							
							<div class="am-u-sm-9">
								<input type="text" id="age" required name="age" placeholder="请输入年龄" 
									name="age"  > 
							</div>
						</div>
						<div class="text-right mt-8">
                        <button type="submit"  class="waves-effect btn-large btn-large-white px-4 tm-border-radius-0" >
                        	注册
                        </button>
                    </div>
					</form>
					<a href="${basePath}user/getLogin">已有账号?请登录
						<input value="${mess}" type="hidden" id="message">
				</div>
				</div>
				</div>

    <script src="${basePath}js/jquery-3.2.1.slim.min.js"></script>
    <script src="${basePath}js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
        var mess = "${mess}";
         if(mess !=""){
	        alert(mess);
        } 
         function login(){
	         
         }

    </script>
    <script>
			$("form").submit(function(){
				var	telephone=document.getElementById("telephone").value;
				var	email=document.getElementById("email").value;
				if(!checkMobile(telephone)){
					alert("电话号码不符合规则，请重新输入");
					return false;
				} 
				if(!checkEmail(email)){
					alert("email不符合规则，请重新输入");
					return false;
				} 
				
			})
			

			//验证电话规则
			function
				 checkMobile(str) {
				  var
				 re = /^1(3|4|5|7|8)\d{9}$/
				  if (re.test(str)) {
				    return true;
				  } else {
				    return false;
				  }
			}
		//验证邮箱
		function
			 checkEmail(str){
			  var
			 re = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
			  if(re.test(str)){
			    return true;
			  }else{
			    return false;
			  }
		}
		var mess = "${mess}";
		         if(mess !=""){
			        alert(mess);
		        } 
		</script>
</body>

</html>

