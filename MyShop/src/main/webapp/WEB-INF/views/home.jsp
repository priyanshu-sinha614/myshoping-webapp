<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

  <head>
    
	<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">
	
    <title> My Shop </title>
    <style type="text/css">
    	
    </style>
  </head>
  
  
  <body class="container-fluid bg-light " style="margin: 0%;padding: 0%;" >
   
   <!-- Navbar -->
    <jsp:include page="bootstrap/nav.jsp"></jsp:include>
    
    <div class="marque"> <marquee behavior=scroll direction="left" scrollamount="22"><h2> <img width="75px;" alt="no-img" src="/image/websiteimage/myshop2.jpg"> &nbsp; &nbsp;  Welcome to My Electronic Shop  &nbsp; &nbsp; <img width="75px;" alt="no-img" src="/image/websiteimage/myshop2.jpg"> </h2></marquee> </div>
    
	<!--   slide bar   -->
	<jsp:include page="bootstrap/slide.jsp"></jsp:include>
	
	<jsp:include page="bootstrap/mainsection.jsp"></jsp:include>
	
	
	<div class="container-fluid border mb-4" style="background-color: 	#b0c4de;">
	
		<div class="container mt-5 m-3 text-center">
			<img  alt="no-img" src="/image/sponsors/mypartners.jpg">
			
		</div>
		<div class="container m-3 text-center">
			<img height="600px;" alt="no-img" src="/image/sponsors/mypartners2.jpg">
		</div>
		
	</div>
		
	<!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>
	
	
  </body>
  
</html>