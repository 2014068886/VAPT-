<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Update User </title>
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
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}
%>
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
            url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
	<sql:update dataSource = "${dbSource}" var = "update"> 
	  update landbank.users	set username=?, firstName=?, lastName=?, address=?, mobile_num=?, phone_num=?, email=?, updated_by=? where user_id="${param.id}"	 
	  <sql:param value = "${param.username}" />
	  <sql:param value = "${param.firstName}" />
	  <sql:param value = "${param.lastName}" />
	  <sql:param value = "${param.address}" />
	  <sql:param value = "${param.mobileNum}" />
	  <sql:param value = "${param.phoneNum}" />
	  <sql:param value = "${param.email}" />
          <sql:param value = "<%=username %>" />
	</sql:update>
	
	<c:if test = "${update>=1}">
		<c:redirect url = "VAPT_AdminUsers.jsp"> 
			<c:param name = "success" value = "Data Updated Successfully" />
		</c:redirect>	
	</c:if>
</body>
</html>