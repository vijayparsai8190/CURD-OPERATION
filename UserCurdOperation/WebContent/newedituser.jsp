<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New/Edit User</title>
</head>
<body bgcolor="pink">
<pre>
<form action="RegisterServlet" method="post">
<table align="center" cellpadding="5" cellspacing="5">
<tr>
<td><label>First Name</label></td><td><label><input type="text" name="fstnme" ></label></td></tr>
<tr><td><label>Last Name</label></td><td><label><input type="text" name="lstnme" ></label></td></tr>
<tr><td><label>Date of Birth</label></td><td><label><input type="text" name="dob" >(YYYY-MM-DD)</label></td></tr>
<tr><td><label>Username</label></td><td><label><input type="text" name="usernme" ></label></td></tr>
<tr><td><label>Password</label></td><td><label><input type="password" name="pswd" ></label></td></tr>
<tr><td><label>Email</label></td><td><label><input type="text" name="email"></label></td></tr>
<tr><td></td><td><input type="submit" value="Submit">  <input type="reset" value="Reset"> <input type="button" value="Edit" onclick="window.location.href='listofuser.jsp'" /></td></tr>

</table>
</form>
</pre>
</body>
</html>