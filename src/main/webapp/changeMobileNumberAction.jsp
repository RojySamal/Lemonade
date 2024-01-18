<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="project.ConnectionProvider,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%String email=session.getAttribute("email").toString();
String mobileNumber=request.getParameter("mobileNumber");
String password=request.getParameter("password");
int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		st.executeUpdate("update users set mobileNumber='"+mobileNumber+"' where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
	}
}
catch(Exception e)
{
	System.out.println(e);
}%>

</body>
</html>