<%@page import="learn.cart.entities.UserDetails"%>
<%
    UserDetails user=(UserDetails)session.getAttribute("current_user");
		if(user==null)
		{
			session.setAttribute("message", "you are Not logged in !! log in first");
			response.sendRedirect("login.jsp"); 
			return; 
		}else{
			response.sendRedirect("index.jsp");
		}
		


%>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<head>
		<meta charset="UTF-8">
		<title></title>
		
		<%@include file="components/common_css_js.jsp" %>	
		
		</head>
		<body>
		<%@include file="components/navbar.jsp" %>
		
		
		</body>
</html>