<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.ConnectionProvider,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");
int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * from users where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set password='"+newPassword+"' where mail='"+email+"'");
		response.sendRedirect("forgotPassword.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>