<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> UPDATING FINDINGS </title>
</head>
<body>
<% 
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	String username = (String) session.getAttribute("admin");
	if(null == username)
	{
		request.setAttribute("Error", "Session has ended. Please Login");
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
%> 
    
    <jsp:useBean id = "now" class = "java.util.Date" />
    <fmt:formatDate var = "year" value = "${now}" pattern = "yyyy-MM-dd" />
    
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
    
        <c:if test="${param.status == 'Not Yet Resolved'}" >
		<sql:update dataSource="${dbSource}" var = "update">
			update landbank.findings set system_name=?, vulnerability=?, URL=?, actionPlan=?, severity=?, quarter_report=?, date_updated=?, updated_by=?, date_resolved=?, status=? where finding_id='${param.id}'
                        <sql:param value="${param.application}" />
                        <sql:param value="${param.vulnerability}" />
			<sql:param value="${param.url}" />
			<sql:param value="${param.actionPlan}" />
			<sql:param value="${param.severity}" />
			<sql:param value="${param.qtrReport}" />
			<sql:param value="${year}" />
			<sql:param value="<%=username%>" />
			<sql:param value="${year}" />
                        <sql:param value="${param.status}"/>

		</sql:update>
        </c:if>
                        
        <c:if test="${param.status == 'Resolved'}" >
               <sql:update dataSource="${dbSource}" var = "update">
			update landbank.findings set system_name=?, vulnerability=?, URL=?, actionPlan=?, severity=?, quarter_report=?, date_updated=?, updated_by=?, date_resolved=?, status=? where finding_id='${param.id}'
                        <sql:param value="${param.application}" />
                        <sql:param value="${param.vulnerability}" />
			<sql:param value="${param.url}" />
			<sql:param value="${param.actionPlan}" />
			<sql:param value="${param.severity}" />
			<sql:param value="${param.qtrReport}" />
			<sql:param value="${year}" />
			<sql:param value="<%=username%>" />
			<sql:param value="${year}" />
                        <sql:param value="${param.status}"/>
		</sql:update>             
        </c:if>
    <c:if test = "${update>=1}">
		<c:redirect url = "VAPT_Findings.jsp"> 
			<c:param name = "success" value = "Data Updated Successfully" />
		</c:redirect>	
    </c:if> 
</body>
</html>