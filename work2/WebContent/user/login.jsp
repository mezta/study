<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>用户登录</title>
	
    <%-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}css/materialize.min.css">
    <link rel="stylesheet" href="${basePath}css/tooplate.css"> --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="Fitness Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
	/>
	<link rel="stylesheet" href="${basePath}css/bootstrap.min.css">
	<link rel="stylesheet" href="${basePath}css/style1.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="${basePath}css/fontawesome-all.css">
 <style>
 #login {
    background-image: url(${basePath}images/d.jpg);
    }
     canvas {
        background: #ffffff;
        transition: translate 0.5s;
      }
 </style>
</head>

<body id="login">
    <!-- title -->
	<h1> Login Form 用户</h1>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3">
		<form action="login" method="post">
			<div class="form-style-agile">
				<label>
					用户名
					<i class=""></i>
				</label>
				<input placeholder="Username"  id="uname" name="uname" type="text" required="">
			</div>
			<div class="form-style-agile">
				<label>
					密码
					<i class=""></i>
				</label>
				<input placeholder="Password" id="upass" name="upass"  type="password" required="">
			</div>
			<div class="form-style-agile">
				<label>
					验证码
				<i class=""></i>
				</label>
				<input type="text" value=""  placeholder="请输入验证码（不区分大小写）" class="input-val" >
				 <!-- <canvas id="canvas" width="100" height="30"></canvas> -->
			</div>
			<canvas id="canvas" width="120" height="50"></canvas>
			<!-- checkbox -->
			<div class="wthree-text">
				<ul>
					<li>
							<a href="${basePath}admin/login.jsp" class=""><button type="button" class="btn btn-danger">管理员登录</button></a>
						<!-- //checkout -->
					</li>
					<li>
						<a href="${basePath}user/register.jsp">注册新用户</a>
					</li>
				</ul>
			</div>
			<!-- //switch -->
			<input type="submit" class="ltn" value="登 录">
		</form>
	</div>
<div class="footer">
		<h2>&copy; 2022 Fitness Login Form 海格利斯游泳馆
		</h2>
	</div>
    <script src="${basePath}js/jquery-3.2.1.slim.min.js"></script>
    <script src="${basePath}js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
        var register = '${register}';
        console.log(register);
        if(register != ''){
	        alert(register);
        }
        console.log(mess);
        var mess = '${mess}';
        if(mess != ''){
	        alert(mess);
        }
    </script>
     <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
<script>

    $(function(){
        var show_num = [];
        draw(show_num);
 
        $("#canvas").on('click',function(){
            draw(show_num);
        })
        $(".ltn").on('click',function(){
            var val = $(".input-val").val().toLowerCase();
            var num = show_num.join("");
            if(val==''){
                alert('请输入验证码！');
                return false;
            }else if(val == num){
                $("#from").submit();
                // draw(show_num);
 
            }else{
                alert('验证码错误！请重新输入！');
                $(".input-val").val('');
                // draw(show_num);
                return false;
            }
        })
    })
    
 
    //生成并渲染出验证码图形
    function draw(show_num) {
        var canvas_width=$('#canvas').width();
        var canvas_height=$('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,v,w,x,y,z,A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度
        
        for (var i = 0; i < 4; i++) {  //这里的for循环可以控制验证码位数（如果想显示6位数，4改成6即可）
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            // var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var deg = Math.random() - 0.5; //产生一个随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";
 
            context.translate(x, y);
            context.rotate(deg);
 
            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);
 
            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }
 
    //得到随机的颜色值
    function randomColor() {
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
 
</script>
</body>

</html>