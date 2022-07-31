<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<title>Signup</title>
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
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
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
    
    
<div class="container bg-white mt-4">

	<form action="/signup-handler" method="post" style="border:1px solid #ccc">
	  <div class="container">
	    <h1 class="text-center">Sign Up</h1>
	    
	    <c:if test="${signupstatus!=null }">
	    	<p class="text-center text-danger">${signupstatus}</p>
	    </c:if>
	    
	    <p class="text-center">Please fill in this form to create an account.</p>
	    <hr>
	    
	    <table>
	    	<tr>
	    	<th width="50%">First Name *<input width type="text" name="fname" required="required"> </th> 
	    	<th>Last Name <input type="text" name="lname"> </th> 
	    	<tr>
	    </table>
	
	    <label for="email"><b>Username *</b></label>
	    <input type="text" placeholder="Enter Username" name="username" required>
	
	    <label for="psw"><b>Password *</b></label>
	    <input type="password" placeholder="Enter Password" name="password" required>
	
		<label for="psw"><b>Mobile no *</b></label>
	    <input type="text" placeholder="Enter Mobile no." name="mobile" required>
	
	    
	    
	    <label for="gender"><b>Gender *</b></label><br>   &nbsp;
	    Male : &nbsp; <input type="radio" name="gender" value="male" required="required"> 
	    &nbsp;&nbsp;&nbsp;&nbsp;
	    Female : &nbsp; <input type="radio" name="gender" value="female" required="required"> <br><br>
	    
	    
	    
	    
	    <label>
	      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
	    </label>
	    
	    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
	
	    <div class="clearfix">
	      <button type="button" class="cancelbtn">Cancel</button>
	      <button type="submit" class="signupbtn">Sign Up</button>
	    </div>
	  </div>
	</form>
</div>
</body>
</html>
