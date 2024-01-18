<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.ConnectionProvider,java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
try	
{
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String category=request.getParameter("category");
	Double price=Double.parseDouble(request.getParameter("price"));
	String active=request.getParameter("active");
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("insert into product values(?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setDouble(4,price);
	ps.setString(5,active);
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
	{
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
	}
%>
</body>
</html>