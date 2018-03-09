<%-- 
    Document   : sample
    Created on : Aug 10, 2017, 9:37:32 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/landbank" user="root" password="12345" />
 
        <sql:query dataSource="${dataSource}" var="categories" scope="session">
                SELECT * FROM landbank.logs
        </sql:query>
 
        <c:import url="dispresult.jsp?pageNumber=1"/>

    </body>
</html>
