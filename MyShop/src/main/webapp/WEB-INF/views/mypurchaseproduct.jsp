<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!doctype html>
<html lang="en">

  <head>
    
	<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">
	
    <title>My Purchase </title>
    <style type="text/css">
    	
    </style>
  </head>
  
  
  <body class="container-fluid bg-light " style="margin: 0%;padding: 0%;">
   
   <!-- Navbar -->
    <jsp:include page="bootstrap/nav.jsp"></jsp:include>
    
    <div class="container mt-4 mb-4">
    
    	
    	
    	<table class="table table-success table-striped">
    		<h4 class="m-4 text-center">Name : ${names }</h4>
  			
  			<tr> <th> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;     Product</th> <th> Model </th> <th> Price(incl.Tax) </th> <th> Description </th> <th> Order Date </th>
  			</tr>
  			
  			<c:forEach items="${myProductOrder }" var="product">
    	
  			<tr> <td> 
  				<div class="card" style="width: 18rem;">
			 	 <img alt="no" src="/image/${product.path}" class="card-img-top">
				</div>
  			</td> 
  			
  			 <td> ${product.model } </td> <td> ${product.price } </td> <td> ${product.desc } </td> <td> ${product.dates } </td>
  			</tr>
  			
  			</c:forEach>
  			
		</table>
    	
    </div>
	
	<!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>
	

	
  </body>
  
</html>


