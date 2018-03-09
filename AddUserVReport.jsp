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
<% 
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	String username = (String) session.getAttribute("user");
	if (null == username)
	{
		request.setAttribute("Error", "Session has ended. Please Login");
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}
	
	String userType = "User";
%>	
     <jsp:useBean id = "now" class = "java.util.Date" />
     <fmt:formatDate var = "year" value = "${now}" pattern = "yyyy-MM-dd" />
    
	 <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
	 url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	 
	 <sql:update dataSource = "${dbSource}" var = "insert"> 
	  INSERT INTO landbank.vreport (qtrReport, vapt_date, TCR, received_date, results, remarks, date_added, added_by, user_type) VALUES (?,?,?,?,?,?,?,?,?)
	  <sql:param value = "${param.qtr}" />
	  <sql:param value = "${param.vaptDate}" />
	  <sql:param value = "${param.tcr}" />
	  <sql:param value = "${param.reportDate}" />
	  <sql:param value = "${param.results}" />
	  <sql:param value = "${param.remarks}" />
	  <sql:param value = "${year}" />
	  <sql:param value = "<%=username %>" />
	  <sql:param value = "<%=userType%>" />
	</sql:update>
	
	<c:if test = "${insert>=1}">
		<c:redirect url = "VAPT_UserVReports.jsp"> 
			<c:param name = "success" value = "Data Inserted Successfully" />
		</c:redirect>	
	</c:if> 
</body>
</html>