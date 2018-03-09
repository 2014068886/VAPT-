<%-- 
    Document   : VAPT_AuditTrailLogs
    Created on : Aug 7, 2017, 2:26:35 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
        <meta name="author" content="">
        <title> Audit Trail </title>
    </head>
    <body>
   
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
	<sql:query dataSource = "${dbSource}" var="categories" scope="session">
                SELECT * FROM landbank.audit_trail 
              
        </sql:query>
	
    
        <c:import url="auditLogs.jsp?pageNumber=1"/>
    
    </body>
</html>
