<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");

String username = (String) session.getAttribute("user");
if(null == username)
{
	request.setAttribute("Error", "Session has ended. Please Login");
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	rd.forward(request, response);
} 

try {
    
     Class.forName("com.mysql.jdbc.Driver").newInstance(); 
     Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank","root","12345");
     String query = "insert into landbank.audit_trail(transaction_name, transaction_date, creator) values ('Logout to System', NOW(), '"+username+"')";
     PreparedStatement st = (PreparedStatement) con.prepareStatement(query);
     st.executeUpdate();
     ResultSet rs = st.executeQuery();
     rs.next();
     
} catch (Exception e){
    e.printStackTrace();
}
        
session.removeAttribute("user");
session.invalidate();

response.sendRedirect("index.jsp");

%>
</body>
</html>