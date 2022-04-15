<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
<title>Mobile</title>

<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">

</head>

<body class="bg-light">
	<jsp:include page="bootstrap/nav.jsp"></jsp:include>

	<div class="marque"> <marquee behavior=scroll direction="left" scrollamount="17"><h2>Mobile BUMPER DHAMAKA OFFER ONLY <i class="fa fa-rupee" style="font-size:24px"></i> 5000 to <i class="fa fa-rupee" style="font-size:24px"></i> 25000 </h2></marquee> </div>
    

	<div class="container mt-4">
	  <div class="row row-cols-4">
	  
	  	<c:forEach items="${mobiles }" var="arr">
	  	
	   	 <div class="col mb-5">
	   	 	<div class="card" style="width: 18rem;">
			
				  <img alt="no" src="/image/${arr.path}" class="card-img-top">
				  
				  <div class="card-body">
				    <h5 class="card-title"> ${arr.model } </h5>
				    <p class="card-text"> ${arr.desc } </p>
				    
				    <p><i class="fa fa-rupee" style="font-size:24px">&nbsp; ${arr.price } </i></p>
				    
				    <a href="/purchase/buynow?model=${arr.model} &price=${arr.price } &desc=${arr.desc } &path=${arr.path }  &productId=${arr.productId } " class="btn btn-primary rounded-pill">Buy Now</a>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    
			   		 <!-- Add cart -->
				   <a href="/addsessionproduct?model=${arr.model} &price=${arr.price } &desc=${arr.desc } &path=${arr.path }  &productId=${arr.productId } ">
				    	<button type="button" id="di" class="btn btn-primary rounded-pill"><i class="fa fa-shopping-cart" style="font-size:17px">Add Cart</i></button>
				   </a>
				  </div>
				  
			</div>
				
	   	</div>
    
     </c:forEach>
  </div>

</div>

<!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>
	

</body>
</html>