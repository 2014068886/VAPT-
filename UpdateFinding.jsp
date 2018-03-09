<%-- 
    Document   : UpdateFinding
    Created on : Aug 14, 2017, 2:13:47 PM
    Author     : JMB
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "css/bootstrap.min.css">
<script src = "js/jquery.js"> </script>
<script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
<title> Update Findings Page </title>
<style>
body {
	min-height: 1px;
	padding: 0;
	margin: 0;
	overflow-y:scroll;
	background-color:rgb(230,221,188);
	font-family:century gothic;
}

li:hover { 
	-webkit-box-shadow:0px 2px 0px white;
 	-moz-box-shadow:0px 2px 0px white;
 	-ms-box-shadow:0px 2px 0px white;
 	-o-box-shadow:0px 2px 0px white;
 	box-shadow:0px 2px 0px white;
}

div.footer{
	position:relative;
	z-index:3;
	height:79px;
	width:100%;
	background-color:rgba(76,175,80,0.6);
	overflow:hidden;
	
}

div.footer > p {
	position:absolute;
	font-family:verdana;
	color:white;
	margin:auto;
	padding:0;
	text-align:center;
}

textarea {
	resize:none;
}

.btn-primary {
	background-color: #009900;
}

div.container {
	width: 90%;
}

.page-header {
	border-bottom: 1px solid #009900;
}

.navbar-inverse {
	background: #009900;
	border-color: #a6c778;
	padding-left: 90px;
	padding-right: 85px;
}

.navbar-inverse .navbar-nav>li>a {
    color: white;
}

</style>
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
            <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_Findings.jsp"> <strong> <span class = "glyphicon glyphicon-search"> </span> <b> Findings </b> <span class = "caret"> </span> </strong> </a> 
				<ul class = "dropdown-menu">
					<li> <a href = "VAPT_Findings.jsp"> View Findings </a> </li>
					<li> <a href = "VAPT_ViewResolvedFindings.jsp"> View Resolved Findings </a> </li>
				</ul>
			</li>
                        <li> <a href="VAPT_VReports.jsp"> <span class="glyphicon glyphicon-file"></span> VReports </a></li>	
                        <li class = "dropdown"> <a  class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_AdminLogs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span></a>	
		    	<ul class = "dropdown-menu">
		    		<li> <a href = "VAPT_UserLogs.jsp"> User Logs </a> </li>
		    		<li> <a href = "VAPT_VReportLogs.jsp"> VReport Logs </a> </li>
		    		<li> <a href = "VAPT_FindingLogs.jsp"> Finding Logs </a> </li>
                                <li> <a href = "VAPT_AuditTrailLogs.jsp"> Audit Trail Logs </a> </li>
		    	</ul>
		    </li>
		  </ul>
		<ul class="nav navbar-nav navbar-right">
                    <li> <a href = "VAPT_UserProfile.jsp"> <span class = "glyphicon glyphicon-picture"> </span> Profile </a> </li>
                    <li> <a href = "VAPT_Settings.jsp">  <span class = "glyphicon glyphicon-cog"> </span>  Settings </a> </li>
                    <li> <a href="adminLogout.jsp" target="main" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
        </ul>
       </div>
</nav> <br><br>
<div class = "container">
	<div class = "page-header col-md-12">
		<div id="custom-search-input">
                     <div class="input-group pull-left">  
                         <a href="VAPT_Findings.jsp" class=" btn btn-primary btn-m"> &#10094; BACK </a> <br><br>	
                     </div> 
                         <h2 align= "center"> <font face = "century gothic"> Update Findings </font> </h2>
                </div>	
	</div>
    
	<sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
	 url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
	
	<sql:query dataSource="${dbSource}" var = "result">
		select * from landbank.findings where finding_id=?;
		<sql:param value="${param.id}"/>
	</sql:query>
	
	<form action = "javascript:void(0);" name="myForm" id ="myForm" method = "post">
	   <table name = "myUserTable" id="myUserTable">                    
                <c:forEach var = "row" items="${result.rows}">      
           		<tr>
		           <th> Application: </th>
			   <td>  <input type = "hidden" value="${param.id}" name = "id" /> 
				 <input type = "text" class="form-control" value="${row.system_name}" name = "application" id="field"/> </td>
                        </tr>
                        <tr>
                            <th> Vulnerability: </th>
                            <td> <input type = "text" class="form-control" value="${row.vulnerability}" name = "vulnerability" id="field" /> </td>
                        </tr>
                        <tr>
                            <th> URL: </th>
                            <td> <input type = "url" class="form-control" value="${row.URL}" name = "url" id="field" /> </td>
			</tr>
                        <tr>
                            <th> Action Plan: </th>
                            <td> <input type = "text" class="form-control" value="${row.actionPlan}" name = "actionPlan" id="field" /> </td>
                        </tr>
			<tr>
                            <th> Severity: </th> 
                            <td> <input type = "text" class="form-control" value="${row.severity}" name = "severity" id="field"  /> </td>
			</tr>
			<tr>
                            <th> Quarter Reported: </th>
                            <td> <input type = "text" class="form-control" value="${row.quarter_report}" name = "qtrReport"  id="field" /> </td>
			</tr>
                        <tr>
                            <th> Status </th>
                            <td> 
                                <% 
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank","root","12345");
                                        Statement st = (Statement) con.createStatement();
                                        String query = "select * from status";
                                        ResultSet rs = st.executeQuery(query);     
                                %>
                                    <select class="form-control" id="status" name="status" required>
                                        <option value=""> Please Select.. </option>
                                        <%  while(rs.next()) { %>
                                                <option value="<%=rs.getString("status")%>"> <%= rs.getString("status") %> </option>
                                        <%  } %>
                                    </select> <br>
                                <%            
                                    con.close();
                    
                                    } catch (Exception e) {
                                        e.printStackTrace();  
                                    }                                                         
                                %>
                                   
                            </td>    
                        </tr>
          		<tr>
                            <th> <br> <input type = "submit" onclick="javascript:Redirect();" value = "Update" class="btn btn-primary"> </th>
                            <th> <br> <input type = "reset" value = "Reset" class="btn btn-primary"> </th>
 			</tr>
            </c:forEach>
       </table>
</form>
</div>
</body>
<script>
function Redirect() {
                var update = confirm("Are you sure you would like to update?");
                if (update === true) {
                    document.getElementById("myForm").action = "updateFindings.jsp?id=${param.id}";
                    document.getElementById("myForm").submit();
                }
    }
</script>
</html>
