<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<meta charset="ISO-8859-1">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="SignupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Enter Your Name" required>
    <input type="email" name="email" placeholder="Enter Your Email" required>
    <input type="number" name="mobilenumber" placeholder="Enter Your Mobile Number" required>
    <select name="securityQuestion">
    <option value="What was your favorite school teacher name?">What was your favorite school teacher name?</option>
    <option value="What was your first car?">What was your first car?</option>
    <option value="What is sibling middle name?">What is sibling middle name?</option>
    </select>
    <input type="text" name="answer" placeholder="Enter answer" required>
    <input type="password" name="password" placeholder="Enter Password" required>
    <input type="submit" value="SignUp">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
 String msg=request.getParameter("msg");
  if("valid".equals(msg))
  {
 %>

<h1>Successfully Registered</h1>
<%} %>
<% 
if("invalid".equals(msg))
{ 
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>