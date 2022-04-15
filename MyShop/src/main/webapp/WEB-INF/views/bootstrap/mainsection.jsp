<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="container mt-4">
  <div class="row row-cols-4">
  
  	<c:forEach items="${allitem }" var="arr">
  	
   	 <div class="col mb-5">
   	 	<div class="card" style="width: 18rem;">
		
			  <img alt="no" src="/image/${arr.path}" class="card-img-top">
			  
			  <div class="card-body">
			    <h5 class="card-title"> ${arr.model } </h5>
			    <p class="card-text"> ${arr.desc } </p>
			    
			    <p><i class="fa fa-rupee" style="font-size:24px">&nbsp; ${arr.price }</i>  </p>
			    
			    <!-- Buy now -->
			    <a href="/purchase/buynow?model=${arr.model} &price=${arr.price } &desc=${arr.desc } &path=${arr.path } &productId=${arr.productId }" class="btn btn-primary rounded-pill">Buy Now</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   
			   <!-- Add cart -->
			   <a href="/addsessionproduct?model=${arr.model} &price=${arr.price } &desc=${arr.desc } &path=${arr.path } &productId=${arr.productId }">
			   	 <button type="button" id="di" class="btn btn-primary rounded-pill"><i class="fa fa-shopping-cart" style="font-size:17px">Add Cart</i></button>
			   </a>
			   
			  </div>
			  
			</div>
			
   	 </div>
    
     </c:forEach>
     
     
  </div>
</div>













