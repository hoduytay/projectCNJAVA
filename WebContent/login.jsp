<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
	 <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>

<% String username_err="",password_err="",username ="",err = "";
	if(request.getAttribute("username_err") !=null){
		username_err =(String) request.getAttribute("username_err");
	}
	if(request.getAttribute("password_err") !=null){
		password_err =(String) request.getAttribute("password_err");
	}
	if(request.getAttribute("username") !=null){
		username =(String) request.getAttribute("username");
	}
	if(request.getAttribute("err")!=null){
		err = (String) request.getAttribute("err");
	}
%>
<jsp:include page="header.jsp"></jsp:include>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Đăng Nhập</h2>
						<form action="UserLoginServlet" method="post">
						<p style="color:red"><%=err %></p>
							<input type="text" placeholder="Tài khoản" name="username"/>
							<input type="password" placeholder="Mật khẩu" name="password" />
							<button type="submit" class="btn btn-default">Đăng Nhập</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Đăng ký tài khoản mới</h2>
						<form action="UserRegisterServlet" method="post">
						<p style="color:red;"><%=username_err %></p>
					
							<input type="text" placeholder="Tên người dùng" name="username" value="<%=username%>"/>
							<p style="color:red;"><%=password_err %></p>
							<input type="password" placeholder="Password" name="password"/>
							<button type="submit" class="btn btn-default">Đăng ký</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
	
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>