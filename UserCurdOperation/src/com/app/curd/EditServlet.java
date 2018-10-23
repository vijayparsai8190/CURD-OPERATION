package com.app.curd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.PreparedStatement;

public class EditServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		

		String fName = req.getParameter("fstnme");
		String lName = req.getParameter("lstnme");
		String dob = req.getParameter("dob");
				
		String userName = req.getParameter("usernme");
		String password = req.getParameter("pswd");
		String email = req.getParameter("email");
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// JDBC 5 Steps Follow to connect our Java Application with Database
		try {
			
			// 1 Load the Driver 
			Driver driref = new Driver();
			DriverManager.registerDriver(driref);
			
			//2 Get the DB Connection
			String dburl = "jdbc:mysql://localhost:3306/connect?user=root&password=root";
			con = (Connection)DriverManager.getConnection(dburl);
			
			//3 Issue SQL Query via Connection
			String query = "update employee set fname=?,lname=?,username=?,upassword=?,email=?"+" where dob = ?";
			pstmt = (PreparedStatement)con.prepareStatement(query);
		
			pstmt.setString(1, fName);
			pstmt.setString(2, lName);
			pstmt.setString(3, userName);
			pstmt.setString(4, password);
			pstmt.setString(5, email);
			pstmt.setString(6, dob);
			
			//4 Process the Result
			int count = pstmt.executeUpdate();
			
			if(count>0)
			{
				out.println("<html><body><br><br>Successfully Updated..</body></html>");
				resp.sendRedirect("listofuser.jsp");
			}
			else
			{
				System.out.println("<html><body><br><br>Not Updated Successfully ..</body></html>");
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
		
		
		}
	}


