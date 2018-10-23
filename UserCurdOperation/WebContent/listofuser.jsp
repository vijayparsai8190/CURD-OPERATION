<%@page import="java.io.IOException"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>

<body bgcolor="pink">
<table border="1" align="center" cellpadding="5" cellspacing="5">
<tr>
<td>Name</td>
<td>Date of Birth</td>
<td>Username</td>
<td align="center">Email</td>
<td>Operations</td>
</tr>

<%
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
			String query = "select * from employee";
			stmt = con.createStatement();
			
			//4 Process the Result
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
		%>
		
		<tr>
		<td><%=rs.getString("fname") %> <%=rs.getString("lname") %></td>
		<td><%=rs.getString("dob") %></td>
		<td><%=rs.getString("userName") %></td>
		<td><%=rs.getString("email") %></td>
		<td><a href="update.jsp?password=<%= rs.getString("upassword")%>">Edit</a> || <a href="delete.jsp?password=<%=rs.getString("upassword")%>">Delete</a></td>
		</tr>
		
		
		<%
			}
			}
			catch(SQLException e)
			{
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

</table>
</body>
</html>
