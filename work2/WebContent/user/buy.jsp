<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.row{    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
    flex-direction: row;
    align-content: flex-end;
    justify-content: space-between;}
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
<title></title>
<!-- Bootstrap -->
<link href="http://localhost:8080/work2/css/bootstrap.min.css" rel="stylesheet">
<script src="http://localhost:8080/work2/js/jquery.min.js"></script>
<script src="http://localhost:8080/work2/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
<meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="generator" content=""  data-variable=",cn,10001,,10001,M1156015" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
		<link rel='stylesheet' href='http://localhost:8080/work2/css/ceshi.css'>
		 <link rel="stylesheet" href="../css/admin/amazeui.min.css" />
</head>
<body class="nav-header">
	



<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <!-- Google Font -->
  <link rel='stylesheet' href='http://localhost:8080/work2/css/ceshi.css'>
 <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,300i,400,500,700,900" rel="stylesheet">

 <!-- Css Styles -->
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/bootstrap.min.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/font-awesome.min.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/owl.carousel.min.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/magnific-popup.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/barfiller.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/slicknav.min.css" type="text/css">
 <link rel="stylesheet" href="http://localhost:8080/work2/css/user/style.css" type="text/css">
<title>欢迎光临海格利斯游泳馆</title>
<!-- Bootstrap -->
<style>
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
</style>
 <link rel='stylesheet' href='css/ceshi.css'>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<section class="met-content animsition">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 met-cons">
                        <div class="met-position bordernone pattern-show">
                           
                        </div>
                        <div id="main">
			
				<div class="met-news-list news-lists" style="text-alige">
				<div  class="met-service" style="text-align: center">
					<dt>商户订单号 </dt>
					<dd>
						<input id="" type="text" style="text-align:center "disabled="disabled"  name="mtitle" value="${msg.mtitle}" />
					</dd>
					
					<dt>套餐ID</dt>
					<dd>
						<input id="" type="text" style="text-align:center " disabled="disabled"name="mcontent" value="${msg.mcontent}" />
					</dd>
					
					<dt>付款金额  </dt>
					<dd>
						<input id="" type="text" style="text-align:center " disabled="disabled"name="mprize" value="${msg.mprize} "/>
					</dd>
					<!-- <dt>商品描述</dt>
					<dd>
						<input id="WIDbody" name="WIDbody" value=""/>
					</dd> -->
					&nbsp;
					<p class="more">
					<span class="new-btn-login-sp">
							<a href="${basePath}empMsg/goAlipay?mtitle=${msg.mtitle}" class="a2">现在支付</a>
						</span>
					</p>
					<hr class="one_line">
					
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
						
						</span> <span class="note-help">如果您点击“付款”按钮，即表示您同意该次的执行操作。</span>
					</dd>
				</dl>
				<div id="foot">
			<ul class="foot-ul">
				<li>支付宝版权所有 2022-2023 ALIPAY.COM</li>
			</ul>
		</div>
		</div>
	
</div>
		
	</div>
            </div>           
        </section>
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
<script src="http://localhost:8080/work2/js/admin/jquery-3.1.0.min.js" type="text/javascript"></script>
<script>
function display() {
	alert("请先登录！");
} 
<script type="text/javascript">
				var currentPage=;
				$("#page_"+currentPage).addClass("am-active");
				$("#search").click(function(){
					var data=$(".am-form-field").val();
					var url="../groups/getAllGroup?currPage=1&IName="+data;
					window.location.href=url;
				});
				function goNewPage(pageNum){
					var data='';
					window.location.href="../groups/getAllGroup?currPage="+pageNum+"&IName="+data;
				}
				var message=document.getElementById("message").value;
				if(message!=null&&message!=""){
					alert(message);
				}
			</script>
</html>

</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>

	
</body>
<script language="javascript">
	var tabs = document.getElementsByName('tab');
	var contents = document.getElementsByName('divcontent');
	
	(function changeTab(tab) {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        tabs[i].onmouseover = showTab;
	    }
	})();
	
	function showTab() {
	    for(var i = 0, len = tabs.length; i < len; i++) {
	        if(tabs[i] === this) {
	            tabs[i].className = 'selected';
	            contents[i].className = 'show';
	        } else {
	            tabs[i].className = '';
	            contents[i].className = 'tab-content';
	        }
	    }
	}
	
</script>
</html>