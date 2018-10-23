
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
<body bgcolor="pink">
<%

String password = request.getParameter("password");
Connection con =  null;
Statement stmt = null;
		
	// JDBC 5 Steps Follow to connect our Java Application with Database
	
	try
	{
	// 1 Load the Driver
	Driver driref = new Driver();
	DriverManager.registerDriver(driref);
	
	// 2 Get the DB Connection
	String url = "jdbc:mysql://localhost:3306/connect?user=root&password=root";
	con = DriverManager.getConnection(url);
	
	//3 Issue SQL Query via Connection
	String query = "(select * from employee where upassword = "+password+")";
	stmt = con.createStatement();
	
	//4 Process the Result
	ResultSet rs = stmt.executeQuery(query);
	
	while(rs.next())
	{
%>
		<form action="EditServlet" method="post">
		
		<table align="center" cellpadding="5" cellspacing="5">
		<tr>
		<td><label>First Name</label></td><td><label><input type="text" name="fstnme" value="<%=rs.getString("fname") %>"></label></td></tr>
		<tr><td><label>Last Name</label></td><td><label><input type="text" name="lstnme" value="<%=rs.getString("lname") %>"></label></td></tr>
		<tr><td><label>Date of Birth</label></td><td><label><input type="text" name="dob" value="<%=rs.getString("dob") %>"></label></td></tr>
		<tr><td><label>Username</label></td><td><label><input type="text" name="usernme" value="<%=rs.getString("userName") %>"></label></td></tr>
		<tr><td><label>Password</label></td><td><label><input type="password" name="pswd" value="<%=rs.getString("upassword") %>"></label></td></tr>
		<tr><td><label>Email</label></td><td><label><input type="text" name="email" value="<%=rs.getString("email") %>"></label></td></tr>
		<tr><td></td><td><input type="submit" value="Edit"></td></tr>
		
		</table>
		<%
			}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		//5 Close all JDBC Connections
					finally
					{
						if(con!=null)
						{
							try {
								con.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
						
						if(stmt!=null)
						{
							try
							{
								stmt.close();
							}
							catch(SQLException e)
							{
								e.printStackTrace();
							}
						}
					}
%>

</form>
</body>
</html>