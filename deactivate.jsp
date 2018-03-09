<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Deactivate </title>
</head>
<body>

  <% String status = "Deactivated"; %>
  
   <jsp:useBean id = "now" class = "java.util.Date" />
   <fmt:formatDate var = "year" value = "${now}" pattern = "yyyy-MM-dd" />
    
  <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
  <sql:update dataSource = "${dbSource}" var = "update"> 
	  update landbank.users	set status=?, remarks=? where username=?	 
	  <sql:param value = "<%=status%>" />
	  <sql:param value = "${param.remarks}" />
          <sql:param value = "${param.username}" />
  </sql:update>
	
  <c:if test = "${update>=1}">
      <%
          out.println("<html> <head> <script>");
          out.println("alert('You successfully Deactivated Account')");
          out.println("</script> </head> </html>");
          RequestDispatcher rd = request.getRequestDispatcher("VAPT_USERS.jsp");
          rd.include(request, response);

      %>
  </c:if> 
</body>
</html>