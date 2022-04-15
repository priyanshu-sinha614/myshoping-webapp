<%@page import="com.priyanshu.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary p-3" >
  <div class="container-fluid">
  	
    <a class="navbar-brand" href="/">
    <img width="75px;" alt="no-img" src="/image/websiteimage/myshop2.jpg">
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a style="font-size: 20px;" class="nav-link active" aria-current="page" href="/home"> Home </a>
        </li>
        <li class="nav-item">
          <a style="font-size: 20px;" class="nav-link active" aria-current="page" href="/laptop">Laptop</a>
        </li>
        <li class="nav-item dropdown">
          <a style="font-size: 20px;" class="nav-link dropdown-toggle" href="/mobile" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Electronic-Product
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a  class="dropdown-item" href="/mobile">Mobile</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        
         <li class="nav-item">
          <a style="font-size: 20px;" class="nav-link active" aria-current="page" href="/about">About</a>
        </li>
        
      </ul>
      

      	
      	<!-- Admin and Login button -->
      	
      	<c:choose>
      	
		  <c:when test="${users!=null}">
		  	<div class="loginsection">
		      	<span> 
		      		<a href="/showCart">
			      		<i class="fa fa-shopping-cart" style="font-size:30px;color:buttonface;"> 
			      			<span id="dis" style="font-size: 25px; color: white;">
			      				 ${totalProductList.size() }
			      			</span>
			      		</i> 
		      		</a>
		      	</span>  
      			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      	
		  	<a href="/purchase/mypurchase"> <span style="font-size: 20px; color: white;"> <img width="45px;" alt="no-img" src="/image/userprofile/man.jpg"> ${users.fname} </span> </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="/logout" class="btn btn-danger btn-lg">Logout</a>
		    
		  </c:when>
		  
		  <c:when test="${users==null}"> 
		  	<a href="admin" class="btn btn-warning btn-lg">Admin</a> &nbsp;&nbsp;
      	
		    <a id="login" href="login" class="btn btn-light btn-lg">Login</a>
		  </c:when>
		  
		</c:choose>
      	
		
      </div>
      
    </div>
  </div>
  
</nav>





