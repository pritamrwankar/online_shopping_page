<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping</title>
<%@include file="components/common_css_js.jsp" %>

<style type="text/css">
a{
   text-decoration:none;
}

   body{
   background-image:url("images/form_background.jpeg");
   }
</style>

</head>
<body>
<%@include file="components/navbar.jsp" %>

	<div class="contaainer-fluid">
	
		<div class="container " style="width:550px">
		<form action="LoginServlet" method="post">
				<div class="card mt-4">
				<div class="card-header custom-bg ">
				<h3 class="card-title" style="color:white;">Login Here</h3>
				
				</div>
				<div class="card-body">
				<%@include file="components/message.jsp" %>
					  <div class="mb-3">
					    <label for="exampleInputEmail1" class="form-label">Email address</label>
					    <input type="email" name="email"class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Password</label>
					    <input type="password"  name="pass" class="form-control" id="exampleInputPassword1">
					  </div>
					
					  <button type="submit" class="btn btn-primary">Submit</button>
					
				
				</div>
			
			
			</div>
			</form>
		</div>
		
	</div>
</body>
</html>