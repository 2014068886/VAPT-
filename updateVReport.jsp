<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title> Update VREPORT </title>
    </head>
    <body>
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

        <sql:update dataSource="${dbSource}" var = "update">
            update landbank.vreport set qtrReport=?, vapt_date=?, TCR=?, received_date=?, remarks=?, date_modified=?, updated_by=? where keyId="${param.id}"
            <sql:param value="${param.quarter}" />
            <sql:param value="${param.vapt_date}" />
            <sql:param value="${param.tcr}" />
            <sql:param value="${param.received_date}" />
            <sql:param value="${param.remarks}" />
            <sql:param value="${year}" />
            <sql:param value="<%=username%>" />
        </sql:update>

        <c:if test = "${update>=1}">

            <%
                out.println("<html> <head> <script>");
                out.println("alert('Report Successfully Updated')");
                out.println("</script> </head> </html>");
                RequestDispatcher rd = request.getRequestDispatcher("VAPT_VReports.jsp");
                rd.include(request, response);
            %>

        </c:if> 
    </body>
</html>