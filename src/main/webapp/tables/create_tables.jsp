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
try{
Connection con=ConnectionProvider.getCon();
Statement st = con.createStatement();
String qry = "CREATE TABLE users(name varchar2(100), email varchar2(100)primary key,mobileNumber varchar2(20),securityQuestion varchar2(200),answer varchar2(200),password varchar2(100),address varchar2(500),city varchar2(100),state varchar2(100),country varchar2(100))";
String qry2 = "CREATE TABLE product(id integer, name varchar2(500),category varchar2(200),price number(10,2),active varchar2(10))";
String qry3 = "CREATE TABLE cart(email varchar2(100),product_id int,quantity integer,price integer,total integer ,address varchar2(500),city varchar(100),state varchar(100),country varchar2(100),mobileNumber varchar2(20),orderDate varchar2(100),deliveryDate varchar2(100),paymentMethod varchar2(100),transaction varchar2(100),status varchar2(10))";
String qry4 = "CREATE TABLE message(id integer primary key,email varchar2(100),subject varchar2(200),body varchar2(1000))";
System.out.println(qry);
System.out.println(qry2);
System.out.println(qry3);
System.out.println(qry4);
// st.executeUpdate(qry);
// st.executeUpdate(qry2);
// st.executeUpdate(qry3);
st.executeUpdate(qry4);
System.out.println("Table Created");
st.close();
con.close();
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>