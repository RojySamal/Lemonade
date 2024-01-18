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
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try	
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into message values(?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,email);
	ps.setString(3,subject);
	ps.setString(4,body);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}
catch(Exception e)
	{
	System.out.println(e);
	response.sendRedirect("messageUs.jsp?msg=invalid");
	}
%>
</body>
</html>