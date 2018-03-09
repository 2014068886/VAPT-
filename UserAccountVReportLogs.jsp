<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> VReport Logs </title>
</head>
<body>
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
		
        <sql:query var="categories" scope="session" dataSource = "${dbSource}">
		SELECT log_id, vapt_id, vapt_result, transaction_name, transaction_date, creator from landbank.vreport_logs
	</sql:query>

        <c:import url="uservreportLogs.jsp?pageNumber=1"/>
</body>
</html>