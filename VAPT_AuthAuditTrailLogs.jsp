<%-- 
    Document   : VAPT_AuthAuditTrailLogs
    Created on : Aug 14, 2017, 4:50:01 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <% 
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");
	
            String username = (String) session.getAttribute("authorizer");
            if(null == username)
            {
		request.setAttribute("Error", "Session has ended. Please Login");
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
            }
        %>
        
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/landbank" user="root" password="12345" />
 
        <sql:query dataSource="${dataSource}" var="categories" scope="session">
                SELECT * FROM landbank.audit_trail;
        </sql:query>
                
        <c:import url="authAuditTrail.jsp?pageNumber=1"/>     
       
</div>                
</body>
</html>
