<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.Connection,java.sql.DriverManager,java.sql.ResultSet,com.mysql.jdbc.Statement" %>
<% 
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	String username = (String) session.getAttribute("admin");
	if (null == username) {
		request.setAttribute("Error", "Session has ended. Please Login");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
%> 
     <jsp:useBean id = "now" class = "java.util.Date" />
     <fmt:formatDate var = "year" value = "${now}" pattern = "yyyy-MM-dd" />
    
	 <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
	 url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
	 <sql:update dataSource = "${dbSource}" var = "insert"> 
	  INSERT INTO landbank.vreport (qtrReport, vapt_date, TCR, received_date, results, remarks, date_added, added_by, user_type, fileName) VALUES (?,?,?,?,?,?,?,?,?,?)

	  <sql:param value = "${param.qtr}" />
	  <sql:param value = "${param.vaptDate}" />
	  <sql:param value = "${param.tcr}" />
	  <sql:param value = "${param.reportDate}" />
	  <sql:param value = "${param.results}" />
	  <sql:param value = "${param.remarks}" />
	  <sql:param value = "${year}" />
	  <sql:param value = "<%=username %>" />

	  <%      
              
        try {
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        Connection  con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank","root","12345");
        String query = "select user_type from landbank.admin where username= '"+username+"'";
        Statement st = (Statement) con.createStatement();
        ResultSet rs = st.executeQuery(query);
      
        if (rs.next()) { 
        %> <sql:param value = '<%= rs.getString("user_type")%>' />
        <% 
        }
        
        rs.close();
        st.close();
        con.close();
		} catch (Exception e) {
		    e.printStackTrace();
		} 
	%>
        <sql:param value = "${param.vaptFile}" />
	</sql:update>
	
	<c:if test = "${insert>=1}">
		<c:redirect url = "VAPT_VReports.jsp"> 
			<c:param name = "success" value = "Data Inserted Successfully" />
		</c:redirect>	
	</c:if> 
</body>
</html>