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
String password=request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password))
{
	session.setAttribute("email",email);
	response.sendRedirect("admin/adminHome.jsp");
}
else
{
	int z=0;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs=st.executeQuery("SELECT * from users where email='"+email+"' and password='"+password+"'");
		while(rs.next())
		{
			z=1;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
		{
			response.sendRedirect("login.jsp?msg=notexist");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
}
%>
</body>
</html>