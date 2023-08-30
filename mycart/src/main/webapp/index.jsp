<%@page import="learn.helper.Helper"%>
<%@page import="learn.cart.entities.Category"%>
<%@page import="learn.dao.CategoryDoa"%>
<%@page import="learn.cart.entities.Products"%>
<%@page import="java.util.List"%>
<%@page import="learn.dao.ProductDao"%>
<%@page import="learn.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Shopping</title>
<%@include file="components/common_css_js.jsp" %>

<style>
/* .card{

width:200px;
} */


</style>

  </head>
<body>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/common_modals.jsp" %>
	<div class="container-fluid">
			<div class="row m-2">
	
	<%
		String cat=request.getParameter("category");
	
	
	
		ProductDao dao=new ProductDao(FactoryProvider.getFactory());	
		
		List<Products> list=null;
		if( cat==null  || cat.trim().equals("all")){
			 list=dao.getAllProducts();
		}
		else{
			int cid=Integer.parseInt(cat.trim());
			list=dao.getAllProductsBycategoryId(cid);
		}
		
		
		
		
		
		
		CategoryDoa cdao=new CategoryDoa(FactoryProvider.getFactory());
		List<Category> clist=cdao.getCategory();
	
	
	
	%>
	   <div class="col-md-2 mt-4 ">
	   <div class="list-group">
		  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
		   All Products
		  </a>
		
	  
		
	   <%
	   		for(Category c:clist){
	   			
	   	%>	
	   	    <a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategorytitle() %></a>
	   		
	   	<%  }
	     %>
	   </div>
	   </div>
 		 <div class="col-md-10 mt-4">
 		
	 		 	<div class="d-flex flex-wrap container-fluid">
	 		 	  
	 		 	
	 		 		 <%
	 		 		 for(Products p:list)
	 		 		 {
	 		 		 
	 		 		 %>
	             
	         
	      
	      					<div class="card w-25  product-card  ">
	      					 <div class="card-header d-flex justify-content-center">
	      					  <img class="card-img-top m-1"style="hight:200px;  width:200px;" src="images/Products/<%=p.getpPic() %>" alt="Card image cap"></div>
	      					  <div class="card-body">
	      					  <h5 class="card-title"><%=p.getpName() %></h5>
	      					   <p class="card-text"><%=Helper.get10Words(p.getpDiscrip()) %></p>
	      					  </div>
	      					      <div class="card-footer d-flex justify-content-between"  >
						    
						   <div> <button class="btn custom-bg btn-sm text-white" onclick="Add_to_cart(<%=p.getpId() %>,'<%=p.getpName() %>',<%=p.getpPrice()%>)">Add to cart</button></div>
						    <div > <button class="btn btn-success btn-sm">&#8377&nbsp;<span><%=p.getPriceAfterApplyingDiscount()  %>/- </span><span class="text-secondary text-white discount-lable"><%=p.getpPrice()%>&nbsp;<%=p.getpDiscount() %>% off</span></button></div>
						    
						    </div>
	      					
	      					</div>
	     
	                    

	     
	     
	                  <%
	 		 		 }
	                  %>	
	                  		
	 		      </div>
	 		 	
	 		</div>
 		 
 		 
	   
	   </div>
	
	
	
	
	</div>
	
	
	
	
	    
	</body>
</html>