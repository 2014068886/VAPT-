<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> User Logs </title>
</head>
<body>

        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
	<sql:query dataSource = "${dbSource}" var="categories" scope="session">
		SELECT * from landbank.logs 
	</sql:query>
                
        <c:import url="userlogreport.jsp?pageNumber=1"/>         
   
</div>
</body>
</html>