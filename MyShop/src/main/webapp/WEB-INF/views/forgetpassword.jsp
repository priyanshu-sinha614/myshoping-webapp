<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

  
<html>
  <head>
  	<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">
	
    <title>Forget</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
      html, body {
      display: flex;
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password] {
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
      
      
    </style>
  </head>
  
  <body  class="container-fluid bg-light " style="margin: 0%;padding: 0%;">
  	 
  <div class="mt-5">
    <form action="/password/forgetpasswordhandler" method="post">
    
      <h1>Forget Form</h1>
      <div class="formcontainer">
      <hr/>
      <div class="container">
      	<h3 class="text-center" style="color: red;">${status }</h3>
      	
        <label for="uname"><strong>Username</strong></label>
        <input type="text" placeholder="Enter Username" name="uname"  required>
        
        <label for="psw"><strong>Mobile </strong></label>
        <input type="text" placeholder="Enter Password" name="mobile" required>
      </div>
      
      <button type="submit">Check</button>
      
    </form>
     <h4><a href="/">home</a></h4>
    </div>
  </body>
</html>



