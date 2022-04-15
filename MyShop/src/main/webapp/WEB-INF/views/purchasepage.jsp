<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

    <!doctype html>
<html lang="en">

  <head>
    <jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	
    <title>Purchase Page</title>
  </head>
  
  
  <body class="container-fluid bg-light " style="margin: 0%;padding: 0%;">
   
    <jsp:include page="bootstrap/nav.jsp"></jsp:include>
    
    <div class="container">
    	<h3>Thank you </h3>
    	<h3> ${status } </h3>
    </div>
    
    
    
    <!-- Footer -->
	<jsp:include page="bootstrap/footer.jsp"></jsp:include>
	
  </body>
  
</html>