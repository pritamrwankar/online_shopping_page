<%@page import="learn.helper.Helper"%>
<%@page import="learn.dao.CategoryDoa"%>
<%@page import="learn.cart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="learn.helper.FactoryProvider"%>
<%@page import="learn.cart.entities.UserDetails"%>
<%@page import=" java.util.HashMap" %>
<%@page import=" java.util.Map" %>
    <%
    UserDetails user=(UserDetails)session.getAttribute("current_user");
    if(user==null)
    {
    	session.setAttribute("message", "you are Not logged in !! log in first");
    	response.sendRedirect("login.jsp"); 
    	return; 
    }else{
    	if(user.getUserType().equals("normal")){
    		session.setAttribute("message", "you are Not Admin !! ");
        	response.sendRedirect("login.jsp");
        	return;
    	}
    }
    
    
    
    %>
    	
							<%
							     CategoryDoa dao=new CategoryDoa(FactoryProvider.getFactory());
							     List<Category> list=dao.getCategory();
							     
								Map<String,Long> map=Helper.getCounts(FactoryProvider.getFactory());
							
							
							
							%>
    
    
    
    
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Admin login Page</title>
	<%@include file="components/common_css_js.jsp" %>	
	
	
	<style type="text/css">
	.admin .card:hover
	{
	  background:#e2e2e2;
	 cursor:pointer;
	 border:2px solid gray;
	
	}

	
	</style>
	
	</head>
		<body>
		 <%@include file="components/common_modals.jsp" %>
			<%@include file="components/navbar.jsp" %>
			<div class="container-fluid"> 
					<%@include file="components/message.jsp" %>
				</div>
		<div class="container-fluid d-flex justify-content-evenly overflow-auto">
	
		
				<div class="row row-cols-1 row-cols-md-3 g-4 m-3 admin">
				
				  <div class="col ">
				    <div class="card h-100">
				    <div class="card-header text-center">
				      <img src="images/group.png" style="width:100px;" class="card-img-top" alt="...">
				      <h1><%=map.get("userCount") %></h1>
				    </div>
				      
				      <div class="card-body">
				        <h5 class="card-title text-center">Users</h5>
				        <p class="card-text"></p>
				      </div>
				    </div>
				  </div>
				  
		        
				  
				  
				  <div class="col">
				    <div class="card h-100">
				      <div class="card-header text-center">
				      <img src="images/categories.png" style="width:100px;" class="card-img-top" alt="...">
				   
				      <h1><%=list.size() %></h1>
				      
				     
				      
				    </div>
				      <div class="card-body">
				        <h5 class="card-title text-center">Categories</h5>
				        <p class="card-text">.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <div class="card-header text-center">
				      <img src="images/product.png" style="width:100px;" class="card-img-top" alt="...">
				      <h1><%=map.get("productCount") %></h1>
				    </div>
				      <div class="card-body">
				        <h5 class="card-title text-center">Products</h5>
				        <p class="card-text"></p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100" data-bs-toggle="modal" data-bs-target="#categories">
				      <div class="card-header text-center">
				      <img src="images/interace.png" style="width:100px;" class="card-img-top" alt="...">
				      <h1></h1>
				    </div>
				      <div class="card-body" >
				        <h5 class="card-title text-center">Add categories</h5>
				        <p class="card-text"></p>
				      </div>
				    </div>
				  </div>
				    <div class="col">
				    <div class="card h-100" data-bs-toggle="modal" data-bs-target="#addProducts">
				      <div class="card-header text-center">
				      <img src="images/add-product.png" style="width:100px;" class="card-img-top" alt="...">
				    </div>
				      <div class="card-body" >
				        <h5 class="card-title text-center">Add Products</h5>
				        <p class="card-text"></p>
				      </div>
				    </div>
				  </div>
				</div>
		</div>
		<!-- categories modal -->
					<!-- Button trigger modal -->
			
			
			<!-- Modal -->
			<form action="ProductOperationServlet" method="post">
			<div class="modal fade" id="categories" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog ">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Categories Details</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        
				    	<div class="mb-3">
				    	       <input type="hidden" name="opration" value="addCategories" >
							  <label  class="form-label">Categories Name</label>
							  <input type="text" class="form-control" id="catdet" placeholder="categories details" name="catdet">
							</div>
							<div class="mb-3">
							  <label  class="form-label">Categories Discription</label>
							  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="catdes"></textarea>
						</div>
			            <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-primary">Save changes</button>
					      </div>
			        
			       
			      </div>
			     
			    </div>
			  </div>
			</div>
		  </form>
		<!-- categories modal end -->
		
		
		
		
		
		
		<!-- Add Products modal -->
			<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
			<div class="modal fade" id="addProducts" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Categories Details</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        
				    	<div class="mb-3">
				    			<input type="hidden" name="opration" value="addProduct">
							  <label  class="form-label">Product Name</label>
							  <input type="text" class="form-control"   name="pname">
							</div>
							
							<div class="mb-3">
							  <label  class="form-label"> Product Price</label>
							  <input type="number" class="form-control"   name="pprice">
							</div>
							
							<div class="mb-3">
							  <label  class="form-label">Product Discount</label>
							  
							  <input type="text" class="form-control" " rows="3"  name="pdiscount">
							  
						  </div>
						  <div class="mb-3">
							  <label  class="form-label"> Product quantity</label>
							  <input type="number" class="form-control"   name="pquentity">
							</div>
							
							
						
							<div class="mb-3">
							  <label  class="form-label"> Product Categories</label>
 							  <select class="form-select" aria-label="Default select example" name="catId">
 							  <%
 							        
 							   		  for(Category c:list){
 							   			 
 							   						  
 							  %>
 							  
 							  
							  
							  <option  value="<%=c.getCategoryId()%>"><%=c.getCategorytitle()%></option>
							  
							 <%} %>
							</select>
							</div>
							<div class="mb-3">
							<label  class="form-label">Product Discription</label>
							 <div class="form-floating">
							 
								  <textarea class="form-control" name="pdics" Id="floatingTextarea"></textarea>
								  
							</div>
							</div>
							<div class="mb-3">
							  <label  class="form-label">Product Image</label>
							  <input type="file" class="form-control" id="catdet"  name="pimg">
							</div>
			            <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="submit" class="btn btn-primary">Add Product</button>
					      </div>
			        
			       
			      </div>
			     
			    </div>
			  </div>
			</div>
		  </form>
		 <!-- Add Products modal end -->
		</body>
</html>