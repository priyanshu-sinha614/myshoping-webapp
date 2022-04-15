<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<title>Login</title>
<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>

<style>

body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: purple;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	margin-left:300px;
  float:inherit;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
     width: 100%;
  }
}
</style>
<body class="bg-light">
 <!-- Navbar -->
    <jsp:include page="bootstrap/nav.jsp"></jsp:include>
    
    
<div class="container bg-white p-5 mt-5 login">
	<form action="/login-handler" method="post" style="border:1px solid #ccc pb-5">
	  <div class="container">
	    <h1 class="text-center">User Login</h1>
	    
	     <c:if test="${signupstatus!=null }">
	    	<h4 class="text-center">${signupstatus}</h4>
	    </c:if>
	    
	   
	    
	    
	    <hr>
	
	    <label for="email"><b>Email</b></label>
	    <input type="text" placeholder="Enter Username" name="username" required>
	
	    <label for="psw"><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="password" required>
	
	    <a href="/forgetpassword">forget password</a>
	    <div class="clearfix">
	    
	      <button type="submit" class="signupbtn">Login</button>
	    </div>
	  </div>
	</form>
	
	<div class="container "> <a href="/sign-up"> <button type="button" class="cancelbtn">Signup</button> </div>   </a>
	
	</div>
	

</body>
</html>
