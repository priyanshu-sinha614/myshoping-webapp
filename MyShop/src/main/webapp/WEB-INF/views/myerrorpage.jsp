<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!doctype html>
<html lang="en">
  <head>
  
  	<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">
	
    <title>| Error-Page | </title>
    <style type="text/css">
    	
    </style>
    
  </head>
  <body class="container-fluid bg-light " style="margin: 0%;padding: 0%;">
   
   <!-- Navbar -->
    <jsp:include page="bootstrap/nav.jsp"></jsp:include>
    
    <div class="marque"> <marquee behavior=scroll direction="left" scrollamount="22"><h2> <img width="75px;" alt="no-img" src="/image/websiteimage/myshop2.jpg"> &nbsp; &nbsp; ERROR :  ${error }  &nbsp; &nbsp; <img width="75px;" alt="no-img" src="/image/websiteimage/myshop2.jpg"> </h2></marquee> </div>
    
    <div class="container ml-4 mb-4">
    	<marquee behavior=scroll direction="left" scrollamount="25"> 
    		<a href="/">
    		<img width="75%" alt="no-img" src="/image/myerrorpage/error4041.jpg">
    		</a>
    	</marquee>
    </div>
    

   <!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>
	
  </body>
</html>