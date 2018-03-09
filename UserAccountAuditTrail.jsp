<%-- 
    Document   : UserAccountAuditTrail
    Created on : Oct 25, 2017, 3:45:05 PM
    Author     : JMB
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Audit Trail </title>
</head>

<body>
         <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
	<sql:query var="categories" scope="session" dataSource = "${dbSource}">
		SELECT * from landbank.audit_trail
	</sql:query>
	
        <c:import url="userauditTrail.jsp?pageNumber=1"/>
</body>
</html>
