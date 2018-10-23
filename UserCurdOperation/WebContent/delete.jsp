<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Servlet</title>
</head>
<body>
<%
String password = request.getParameter("password");
Connection con = null;
PreparedStatement pstmt = null;

//JDBC 5 Steps Follow to connect our Java Application with Database

	try
	{
	// 1 Load the Driver
	Driver driref = new Driver();
	DriverManager.registerDriver(driref);
	
	// 2 Get the DB Connection
	String url = "jdbc:mysql://localhost:3306/connect?user=root&password=root";
	con = DriverManager.getConnection(url);
	
	// 3 Issue SQL Query via Connection
	String query = "delete from employee  where upassword = ?";
	pstmt = con.prepareStatement(query);

	pstmt.setString(1, password);
	
	// 4 Process the Result
	int count = pstmt.executeUpdate();
	
	if(count>0)
	{
		out.println("<html><body><br><br>Successfully Deleted....</body></html>");
		response.sendRedirect("listofuser.jsp");
	}
	else
	{
		System.out.println("<html><body><br><br>Not Deleted Successfully ..</body></html>");
	}
	
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	// 5 Close all JDBC Connections
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
		
		if(pstmt!=null)
		{
			try
			{
				pstmt.close();
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}

%>
</body></html>
