<%

  String message=(String)session.getAttribute("message");
  if(message!=null){
	  
%>	
	  <div class="alert alert-success text-center alert-dismissible fade show" role="alert">
  <strong><%=message %></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%	  
	  session.getAttribute("message"); 
  }


%>