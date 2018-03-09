<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
     <% String status = "For Deactivation";%>
     
     <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
	 <sql:update dataSource = "${dbSource}" var = "update"> 
	      update landbank.users set accountStatus=?, remarks=? where username="${param.username}"	 
	      <sql:param value = "<%=status%>"/>
	      <sql:param value = "${param.remarks}"/>
         </sql:update>
	
     <c:if test = "${update>=1}">
	 	<c:redirect url = "VAPT_AdminUsers.jsp"> 
			 <c:param name = "success" value = "You Successfully Deactiavted Account" />
	 	</c:redirect>	
     </c:if> 
</body>
</html>