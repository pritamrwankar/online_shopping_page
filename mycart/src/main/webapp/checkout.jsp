<%
UserDetails user=(UserDetails)session.getAttribute("current_user");
if(user==null)
{
	session.setAttribute("message", "you are Not logged in !! log in first");
	response.sendRedirect("login.jsp"); 
	return; 
}





%>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout page</title>

<%@include file="components/common_css_js.jsp" %>
</head>
<body>
 <%@include file="components/navbar.jsp" %>
    <%@include file="components/common_modals.jsp" %>
		<div class="container">
		    <div class="row">
		      <div class="col-md-6 mt-4">
		      	<div class="card">
		      	 <div class="card-body">
		      	 	<h3 class="text-center mb-4">Your Selected Items</h3>
		      	 	<div class="cart-body"></div>
		      	 
		      	 </div>
		      	
		      	</div>
		      
		      </div>
		      <div class="col-md-6 mt-4">
		      	<div class="card">
		      	 <div class="card-body">
		      	 	<h3 class="text-center mb-4">Your Details For Order</h3>
			      	 	<form>
						 <div class="mb-3">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp">
						    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
						 </div>
			      	 	 <div class="mb-3">
						    <label for="exampleInputEmail1" class="form-label">Your Name</label>
						    <input type="text" class="form-control" name="name">
					
						 </div>
			      	 	 <div class="form-floating">
			
						  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
						  <label for="floatingTextarea">Your Address</label>
						</div>
						<div class="mt-3 text-end">
						  <button class="btn btn-outline-success me-1" onclick="orderPlace()">Place Order</button>
						  <button class="btn btn-outline-primary" onclick="goToindex()">Continue Shopping</button>
						</div>
			      	 	</form>
			      	 	
		      	 
		      
		      </div>
		    
		    </div>
		</div>
</body>
</html>