<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.ConnectionProvider,java.sql.*"%>
    <%@include file="header.jsp" %>
    <%@include file="footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%int id=1;
try{
Connection con=ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from message");
while(rs.next()){
	id=rs.getInt(1);
	id=id+1;
}
}
catch(Exception e){
	System.out.println(e);
}%>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%String msg=request.getParameter("msg");
if("valid".equals(msg))
	{%>
<h3 style="text-align:center; color:yellow;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%if("invalid".equals(msg)){
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.print(id);%>">
<input class="input-style" type="text" name="subject" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter your Message" required></textarea>
<hr>
<button class="button" type="submit">Send<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<br><br><br>
</body>
</html>