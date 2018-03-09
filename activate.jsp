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
 <% String status = "Activated"; %>
	
  <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
	url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
  <sql:update dataSource = "${dbSource}" var = "update"> 
	  Update landbank.users set status=?  where username="${param.username}"	 
	  <sql:param value = "<%=status%>" />
  </sql:update>
	
  <c:if test = "${update>=1}">
        <%
          out.println("<html> <head> <script>");
          out.println("alert('You successfully Activated Account')");
          out.println("</script> </head> </html>");
          RequestDispatcher rd = request.getRequestDispatcher("VAPT_USERS.jsp");
          rd.include(request, response);

        %>
  </c:if> 
</body>
</html>