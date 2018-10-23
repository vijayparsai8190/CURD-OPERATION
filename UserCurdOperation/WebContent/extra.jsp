
<%@page import="java.io.IOException"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<title> </title>
</head>
<body>
<%

String dob = request.getParameter("dob");
	
try {
	
	Connection con =  null;
	PreparedStatement ps = null;
	
	//1
	Driver driref = new Driver();
	DriverManager.registerDriver(driref);

	//2
	String url = "jdbc:mysql://localhost:3306/connect?user=root&password=root";
	con = DriverManager.getConnection(url);
	
	//3
	String query = "(select * from employee where dob = "+dob+")";
	Statement stmt = con.createStatement();
	
	//4
	ResultSet rs = stmt.executeQuery(query);
	
	while(rs.next())
	{
%>
<form action="EditServlet" method="post">

<table border="1" align="center" cellpadding="5" cellspacing="5">
<tr>
<td><label>First Name</label></td><td><label><input type="text" name="fstnme" value="<%=rs.getString("fname") %>"></label></td>
<td><label>Last Name</label></td><td><label><input type="text" name="lstnme" value="<%=rs.getString("lname") %>"></label></td>
<td><label>Date of Birth</label></td><td><label><input type="text" name="dob" value="<%=rs.getString("dob") %>"></label></td>
<td><label>Username</label></td><td><label><input type="text" name="usernme" value="<%=rs.getString("userName") %>"></label></td>
<td><label>Password</label></td><td><label><input type="text" name="pswd" value="<%=rs.getString("upassword") %>"></label></td>
<td><label>Email</label></td><td><label><input type="text" name="email" value="<%=rs.getString("email") %>"></label></td>
<td><input type="submit" value="Submit"><input type="submit" value="New"><input type="submit" value="Edit"></td>
</tr>
</table>
<%
	}
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
%>

</form>
</body>
</html>