<%-- 
    Document   : AuthFindingsLogs
    Created on : Aug 4, 2017, 10:36:41 AM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
    <body>
     
    
	<sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
	<sql:query var="categories" scope="session" dataSource = "${dbSource}">
		SELECT * from landbank.findings_logs;
	</sql:query>
	
        <c:import url="authFindingsLogs.jsp?pageNumber=1" />
</body>
</html>
