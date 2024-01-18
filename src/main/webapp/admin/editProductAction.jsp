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
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
Double price=Double.parseDouble(request.getParameter("price"));
String active=request.getParameter("active");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("UPDATE product SET name='"+name+"',category='"+category+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	if(active.equals("No")){
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NUlL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
</body>
</html>