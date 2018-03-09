<%-- 
    Document   : superadminLogout
    Created on : Dec 12, 2017, 9:57:57 AM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.landbank.ebsd.Controller.ValidateLogin"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "javax.servlet.http.HttpSession" %>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");

String username = (String) session.getAttribute("username");
if(null == username) {
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

     rs.close();
     con.close();
} catch (Exception e){
    e.printStackTrace();
}

session.removeAttribute("username");
session.invalidate();
response.sendRedirect("index.jsp");

%>
</body>
</html>