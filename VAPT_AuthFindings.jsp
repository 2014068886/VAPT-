<%-- 
    Document   : VAPT_AuthFindings
    Created on : Aug 4, 2017, 9:39:45 AM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title> FINDINGS </title>
        </head>
        <body>
           
                <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
                                   url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />

                <sql:query var="categories" scope="session" dataSource = "${dbSource}">
                    SELECT finding_id, VAPT_ID, system_name, URL, vulnerability, actionPlan, severity, status, date_added, date_updated from landbank.findings where status = 'Not Yet Resolved'
                </sql:query>
                    
                <c:import url="authorizerFindings.jsp?pageNumber=1"/>
        </body>
    </html>
