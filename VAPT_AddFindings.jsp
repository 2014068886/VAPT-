<%-- 
    Document   : VAPT_AddFindings
    Created on : Aug 23, 2017, 3:49:32 PM
    Author     : JMB
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<title> FINDINGS </title>
<link rel = "stylesheet" href = "css/bootstrap.min.css">
<script src = "js/jquery.js"> </script>
<script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

</head>
<body>
    <link rel="stylesheet" type="text/css" href="css/addFindings.css"/>
    <%@page import="com.landbank.ebsd.Model.*" %> 
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
        <nav class="navbar navbar-inverse navbar-fixed-top">
             <div class="navbar-header">
                 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                 </button>
                    <img height = 50px src = "Landbank - Logo.png"> <font face = "Helvetica" color = "white" style="font-size:16px;"> Land Bank of the Philippines </font><br/>
             </div>
             <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                       <li> <a href="VAPT_AdminHomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
                       <li> <a href = "VAPT_AdminUsers.jsp">  <span class="glyphicon glyphicon-user"></span> Users </a> </li>
			<li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_Findings.jsp"> <strong> <span class = "glyphicon glyphicon-search"> </span> Findings <span class = "caret"> </span> </strong> </a> 
				<ul class = "dropdown-menu">
					<li> <a href = "VAPT_Findings.jsp"> View Findings </a> </li>
					<li> <a href = "VAPT_ViewResolvedFindings.jsp"> View Resolved Findings </a> </li>
				</ul>
			</li>
			<li> <a href="VAPT_VReports.jsp"> <span class="glyphicon glyphicon-file"></span> VReports </a></li>	
		    <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_AdminLogs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span></a>	
		    	<ul class = "dropdown-menu">
		    		<li> <a href = "VAPT_UserLogs.jsp"> User Logs </a> </li>
		    		<li> <a href = "VAPT_VReportLogs.jsp"> VReport Logs </a> </li>
		    		<li> <a href = "VAPT_FindingLogs.jsp"> Findings Logs </a> </li>
                                <li> <a href = "VAPT_AuditTrailLogs.jsp"> Audit Trail Logs </a> </li>
		    	</ul>
		    </li>
		  </ul>
		<ul class="nav navbar-nav navbar-right">
			<li> <a href = "VAPT_UserProfile.jsp"> <span class = "glyphicon glyphicon-picture"> </span> Profile </a> </li>
			<li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href = "VAPT_Settings.jsp"> <span class = "glyphicon glyphicon-cog"> </span>  Settings <span class ="caret"> </span> </a> 
                    <ul class = "dropdown-menu">
                        <li> <a href = "VAPT_Settings.jsp"> Change Password </a> </li>
                        <li> <a href = "VAPT_SystemParameters.jsp"> System Parameters </a> </li>
                        
                    </ul>
                </li>
            <li> <a href="adminLogout.jsp" target="main" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
        </ul>
       </div>
</nav> <br><br>
<%
    Object system = request.getAttribute("message");
%>
<div class = "container">
	<div class = "page-header col-md-12">
            <div id="custom-search-input">
                <div class="input-group pull-left">  
                    <a href="VAPT_Findings.jsp" class=" btn btn-primary btn-m"> &#10094; BACK </a> <br><br>	  
                </div>
                    <h2 align= "center"> <font face = "century gothic"> Add Findings </font> </h2>
            </div>	
	</div>
        <div class="form">
      		<form action="VAPT_InsertFindings.jsp"  method="post" onSubmit="if(!confirm('Are you sure you want to add this Finding?')){return false;}">  			 
                                   
  
                    <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
                    <sql:query var="select" dataSource = "${dbSource}">
                        select keyId, vapt_date, results from landbank.vreport where application=?
                        <sql:param value="<%=system%>" />
                    </sql:query>
                              <label> Select VREPORT </label>
                                <table class = "table table-responsive table-bordered">
                                  <thead>
                                    <tr>
                                        <td> </td>
                                        <th> VAPT ID </th>
                                        <th> VAPT Date </th>
                                        <th> Result </th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                     <c:forEach var="row" items="${select.rows}" >
                                        <tr>  
                                            <td> <input type = "radio" name = "VAPT_ID" checked = 'checked' value="${row.keyId}"> 
                                                 <input type ="hidden" name ="system" value="<%=system %>" /> </td>                                              
                                            <td> <c:out value="${row.keyId}" /> </td>
                                            <td> <c:out value="${row.vapt_date}" /> </td>    
                                            <td> <c:out value="${row.results}" /> </td>
                                        </tr>
                                     </c:forEach> 
                                  </tbody>
                                </table>   
                
			       <label for = "severity"> Severity: </label> <label style="color:red">*</label>
                               <%
                                   try {
                                      Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                      Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank","root","12345");
                                      Statement st = (Statement) con.createStatement();
                                      String query = "select * from severity";
                                      ResultSet rs = st.executeQuery(query);     
                                %>
                                <select class="form-control" id="severity" name="severity" required>
                                     <option value=""> Please Select.. </option>
                                      <%  while(rs.next()) { %>
                                        <option value="<%=rs.getString(2)%>"> <%= rs.getString(2) %> </option>
                                      <%  } %>
                                </select> <br>
                                <%
                                    con.close();
                                    } catch (Exception e) {
                                       e.printStackTrace();
                                    }
                                %> 
                       
                                <label for = "vulnerability">Vulnerability:</label> <label style="color:red">*</label>
                                <input type="text" name="vulnerability" id = "vulnerability" placeholder="Enter Vulnerability Here.." class="form-control" required> <br>
                                                               
                                <label for = "plan">Action Plan:</label> <label style="color:red">*</label>
                                <input type="text" name="actionPlan" id = "plan" placeholder="Enter Action Plan Here.." class="form-control" required> <br>
                                                                                    
                                <label for = "url">URL:</label> <label style="color:red">*</label>
                                <input type="url" name="url" id = "url" placeholder="Enter URL Here.." class="form-control" required> <br>
					
        			<label for = "status"> Status: </label> <label style="color:red">*</label>
                                
                                <%
                                   try {
                                      Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                      Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank","root","12345");
                                      Statement st = (Statement) con.createStatement();
                                      String query = "select * from status";
                                      ResultSet rs = st.executeQuery(query);     
                                %>
                                <select class="form-control" id="status" name="status" required>
                                     <option value=""> Please Select.. </option>
                                      <%  while(rs.next()) { %>
                                        <option value="<%=rs.getString(2)%>"> <%= rs.getString(2) %> </option>
                                      <%  } %>
                                </select> <br>
                                <%
                                    con.close();
                                    } catch (Exception e) {
                                       e.printStackTrace();
                                    }
                                %>                                                  
                                <center> <button type="submit" class="btn btn-primary"> Submit </button> <button type="reset" class="btn btn-primary"> Reset </button></center>
                                <br><br>
                    </form>                                                                   
        </div>                                                                                                                                                                                 
</div>
</div>
</body>
<script>
  
</script>
</html>
