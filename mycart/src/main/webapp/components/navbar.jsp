<%@page import="learn.cart.entities.Products"%>
<%@page import="java.util.List"%>
<%@page import="learn.helper.FactoryProvider"%>
<%@page import="learn.dao.ProductDao"%>
<%@page import="learn.cart.entities.UserDetails"%>
<%@page import="learn.helper.Helper"%>
<%@page import="learn.cart.entities.Category"%>
<%@page import="learn.dao.CategoryDoa"%>
<%@page import="learn.cart.entities.Products"%>
<%@page import="java.util.List"%>
<%@page import="learn.dao.ProductDao"%>
<%@page import="learn.helper.FactoryProvider"%>
<%
		String cat1=request.getParameter("category");
	
	
	
		ProductDao dao1=new ProductDao(FactoryProvider.getFactory());	
		
		List<Products> list1=null;
		if( cat1==null  || cat1.trim().equals("all")){
			 list1=dao1.getAllProducts();
		}
		else{
			int cid=Integer.parseInt(cat1.trim());
			list1=dao1.getAllProductsBycategoryId(cid);
		}
		
		
		
		
		
		
		CategoryDoa cdao1=new CategoryDoa(FactoryProvider.getFactory());
		List<Category> clist1=cdao1.getCategory();
	
	
	
	%>
<%
		UserDetails user1=(UserDetails)session.getAttribute("current_user");
	
%>


<%@include file="common_css_js.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark custom-bg d-flex justify-content-around">

  <div class="container ">
    <a class="navbar-brand" href="index.jsp">Online shop</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active navbar-info" aria-current="page" href="index.jsp">Home</a>
        </li>
        
       
      
      </ul>
      
       <div>
        <ul  class="navbar-nav me-auto mb-2 ms-4">
                 <li class="nav-item active">
		   			       <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#cart"Style="font-size:25px;" ><i  class="bi bi-cart-check"><span Style="font-size:15px; color:white;" class="badge bg-secondary crat-item">0</span></i>
		   	                 
		   	             </a>
		   		</li>
        
        <%
		    	if(user1==null)
				{%>
		    		  <li class="nav-item">
		              <a href="login.jsp">
		              <button type="button"  class="btn btn-success mt-2 me-2" >
		   	            Login
		   	             </button>
		   	        </a>
		           </li>
		           
		   		        <li>
		   			       <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		   	           Register
		   	             </button>
		   		</li>
		   		<%
				}else
				{
					%>
					
					<li class="nav-item">
		              <a href="<%=user1.getUserType().equals("admin")?"Admin.jsp":"Normal.jsp"%>">
		              <button type="button" class="btn btn-success mt-2 me-2" >
		   	            <%=user1.getUserName() %>
		   	             </button>
		   	        </a>
		           </li>
		           
		   		        <li>
		   			      <a  href="LogoutSevlet"target="LogoutSevlet"> <button type="button" class="btn btn-primary mt-2" >
		   	           LogOut
		   	             </button></a>
		   		</li>
					
					<% 
				}
        %>
        
       
        </ul>
  </div>
   </div>
   </div>
  <!-- Modal -->
    <div >
    
     <form action="RegisterServlet" method="post">
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable">
		    <div class="modal-content">
		      <div class="modal-header">
		      
		        <h5 class="modal-title" id="staticBackdropLabel">Sign Up</h5>
		        
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        
				  <div class="mb-2">
				    <label  class="form-label">Username</label>
				    <input type="text" name="username" class="form-control" id="username" >
				    
				  </div>
				  <div class="mb-2">
				    <label  class="form-label">Email</label>
				    <input type="email" name="email" class="form-control" id="email">
				  </div>
				   <div class="mb-2">
				    <label for="exampleInputPassword1" class="form-label">Password</label>
				    <input type="password" name="password" class="form-control" id="Password">
				  </div>
				  <div class="mb-2">
				    <label  class="form-label">Phone</label>
				    <input type="number" name="phone" class="form-control" id="number">
				  </div>
				  <div class="mb-3 form-group">
				    <label  >Address</label>
				    <textarea class=" form-control" name="add" id="address"></textarea>
				  </div>
				 
				  
			
	
		      </div>
		      <div class="modal-footer">
		        <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-success" >Submit</button>
		      </div>
		    
		       
			
		    </div>
		  </div>
		</div>
  	  </form>
    </div>


</nav>

