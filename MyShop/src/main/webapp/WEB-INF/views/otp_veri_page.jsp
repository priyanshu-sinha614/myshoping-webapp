<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  
<html>
  <head>
  	<jsp:include page="bootstrap/bcdn.jsp"></jsp:include>
	<link href="/css/ind.css" rel="stylesheet" crossorigin="anonymous">
	
    <title>OTP-Verification</title>
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
    <form action="/otp/verifyOTP" method="post">
    
      <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OTP Password</h2>
      <div class="formcontainer">
      <hr/>
      <div class="container">
      	<h4>${OTPstatus }</h4>
        <br>
        <label for="otp"><strong>One Time Password (OTP) </strong></label>
        <input type="text" placeholder="Please Enter OTP:" name="otp" required>
        
        
      </div>
      
      <button type="submit">VERIFY</button>
      
    </form>
    
    </div>
  </body>
</html>
