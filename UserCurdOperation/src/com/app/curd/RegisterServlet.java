package com.app.curd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Driver;
import com.mysql.jdbc.PreparedStatement;
import com.sun.javafx.scene.layout.region.Margins.Converter;

public class RegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Connection con = null;
		PreparedStatement pstmt = null;
			
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String fName = req.getParameter("fstnme");
		String lName = req.getParameter("lstnme");
		String dob = req.getParameter("dob");
				
		String userName = req.getParameter("usernme");
		String password = req.getParameter("pswd");
		String email = req.getParameter("email");
		
		
		// JDBC 5 Steps Follow to connect our Java Application with Database
				
		try
		{
		// 1 Load the Driver
		Driver driref = new Driver();
		DriverManager.registerDriver(driref);
		
		// 2 Get the DB Connection
		String dburl = "jdbc:mysql://localhost:3306/connect?user=root&password=root";
		con = (Connection)DriverManager.getConnection(dburl);
		
		//3 Issue SQL Query via Connection
		String query = "insert into employee values(?,?,?,?,?,?)";
		pstmt = (PreparedStatement)con.prepareStatement(query);
		
		pstmt.setString(1, fName);
		pstmt.setString(2, lName);
		pstmt.setString(3, dob);
		pstmt.setString(4, userName);
		pstmt.setString(5, password);
		pstmt.setString(6, email);
		
		// 4 process the Result
		int count = pstmt.executeUpdate();
		if(count>0)
		{
			out.println("<html><body><br><br>Successfully Inserted..</body></html>");
			
			resp.sendRedirect("newedituser.jsp");
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
