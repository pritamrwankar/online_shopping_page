function Add_to_cart(pid,pname,pprice){
	
	  let cart=	localStorage.getItem("cart");
	  if(cart==null)
	  {
		let Products=[];
		let product={ProductId:pid,ProductName:pname,ProductQuntity:1,ProductPrice:pprice};
		Products.push(product);
		localStorage.setItem("cart",JSON.stringify(Products));
		console.log("product added for the first time");
		ShowToast("product added for the first time");
	
	  }
	  else{
		
		let pcart=JSON.parse(cart);
		
		let oldProduct=pcart.find((item) => item.ProductId==pid)
		if(oldProduct){
			
			oldProduct.ProductQuntity=oldProduct.ProductQuntity+1;
			pcart.map((item)=> {
				if(item.ProductId==oldProduct.ProductId){
					item.ProductQuntity=oldProduct.ProductQuntity;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product Quntity increass");
			ShowToast(oldProduct.ProductName+"product Quntity increass");
			
		}else{
			
			let product={ProductId:pid,ProductName:pname,ProductQuntity:1,ProductPrice:pprice};
			pcart.push(product); 
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product Added");
			ShowToast("product Added to cart");
			
		}
	}
	     updateCart();
}

         //update cart
       function updateCart(){
		let Stringcart=localStorage.getItem("cart");
		let cart=JSON.parse(Stringcart);
		if(cart==null ||cart.length==0){
			console.log("cart is empty");
			$(".crat-item").html("(0)");
			$(".cart-body").html("<h3>cart Does not have any item</h3>");
			$(".checkout-btn").addClass("disabled");
			
		
		}else{
			console.log(cart);
			$(".crat-item").html(`( ${cart.length})`);
			$(".checkout-btn").removeClass("disabled");
			let table=`
			
						<table class="table"> 
						<thead class="thred-light">
						<tr>
						<th>Item Name</th>
						<th> price</th>
						<th> Quantity</th>
						<th>Total Price</th>
						<th>Action</th>
						</tr>
						
						
						
						</thead>
			
			
			
			`;
			let totalprice=0;
			cart.map((item)=>{
				
				table+=`
				 <tr>
				   <td>${item.ProductName}</td>
				   <td>${item.ProductPrice}</td>
				   <td>${item.ProductQuntity}</td>
				   <td>${item.ProductQuntity*item.ProductPrice}</td>
				   <td><button onclick="deleteItemOfCart(${item.ProductId})" class="btn btn-danger btn-sm">Delete</button>            </td>
				 </tr>
				
				
				`
				totalprice+=item.ProductPrice*item.ProductQuntity;
			})
			
			
			table=table+`
			 
			<tr><td colspan="5" class=" text-end"> Total Price : ${totalprice}</td></tr>
			
			
			</table>`;
			
			$(".cart-body").html(table);
			
		}
}
    //delete item of the cart
    function deleteItemOfCart(pid){
	 let cart=JSON.parse(localStorage.getItem("cart"));
	 let newcart=cart.filter((item)=>item.ProductId !=pid);
	 localStorage.setItem("cart",JSON.stringify(newcart));
	  updateCart();
	  ShowToast("product remove from the Cart");
	 
	
   }


   ///show toast function
   function ShowToast(text){
	$(".toast").addClass("show");
	$(".toast-body").html(text);
	
	setTimeout(()=>{
		$(".toast").removeClass("show")
	},3000);
}

   //go to checkout page
   function goTocheckout()
   {
	
	window.location="checkout.jsp";
}
  //go to index.jsp
  
  function goToindex(){
	window.location="index.jsp";
}





  //checkout page order placed
  function orderPlace(){
	 ShowToast("Order Placed Successfully !!");
}

$(document).ready(function(){
	updateCart();
})