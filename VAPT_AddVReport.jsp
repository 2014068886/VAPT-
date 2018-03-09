<%-- 
    Document   : VAPT_AddVReport
    Created on : Aug 10, 2017, 10:34:24 AM
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
        <title> ADD VREPORT </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <link rel = "stylesheet" href = "css/addVReport.css">
        <script src = "js/jquery.js"> </script>
        <script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
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
            <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_Findings.jsp"> <span class = "glyphicon glyphicon-search"> </span> Findings <span class = "caret"> </span> </a> 
		<ul class = "dropdown-menu">
                    <li> <a href = "VAPT_Findings.jsp"> View Findings </a> </li>
                    <li> <a href = "VAPT_ViewResolvedFindings.jsp"> View Resolved Findings </a> </li>
		</ul> </li>
	    <li> <a href="VAPT_VReports.jsp"> <span class="glyphicon glyphicon-file"></span> <strong> VReports </strong> </a></li>	
            <li class = "dropdown"> <a  class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_AdminLogs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span></a>	
		<ul class = "dropdown-menu">
		    <li> <a href = "VAPT_AdminLogs.jsp"> User Logs </a> </li>
		    <li> <a href = "VAPT_VReportLogs.jsp"> VReport Logs </a> </li>
                    <li> <a href = "VAPT_FindingLogs.jsp"> Finding Logs </a> </li>
                    <li> <a href = "VAPT_AuditTrailLogs.jsp"> Audit Trail Logs </a> </li>
		</ul> </li>
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
<div class = "container">
	<div class = "page-header col-md-10">
          <div id="custom-search-input">
               <div class="input-group pull-left">  
                    <a href="VAPT_VReports.jsp" class=" btn btn-primary btn-m"> &#10094; BACK </a> <br><br>	  
               </div>
               <div class="input-group pull-right">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> Type of Report <span class="caret"> </span> </button> 
                    <ul class="dropdown-menu">
                        <li> <a href="VAPT_AddQuarterVReport.jsp"> Quarter </a> </li>
                        <li> <a href="VAPT_AddMonthVReport.jsp"> Monthly </a> </li>
                        <li> <a href="VAPT_AddVReportUserInitiated.jsp"> User Initiated </a> </li>
                    </ul>
               </div>
              <center> <h2 align= "center"> <font face = "century gothic"> Add VReport </font> </h2> </center>
          </div>	
	</div>
  
    
</div>
</body>
</html>
