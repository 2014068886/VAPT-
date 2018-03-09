<%-- 
    Document   : VAPT_AddUserVReport
    Created on : Nov 8, 2017, 3:50:22 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <link rel = "stylesheet" href = "css/addVReport.css">
        <script src = "js/jquery.js"> </script>
        <script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
        <title> User VReport </title>
</head>
<body>

<% 
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	
	String username = (String) session.getAttribute("user");
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
            <li> <a href ="VAPT_UsersHomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href ="VAPT_UserFindings.jsp"> <span class="glyphicon glyphicon-search"></span> Findings <span class = "caret"> </span> </a>
		<ul class = "dropdown-menu">
		    <li> <a href = "VAPT_UserFindings.jsp"> View Findings </a> </li>
                    <li> <a href ="VAPT_UsersResolvedFindings.jsp"> View Resolved Findings </a> </li>
		</ul>
            </li>
            <li> <a href ="VAPT_UserVReports.jsp"> <span class="glyphicon glyphicon-file"></span> <strong> VReports </strong> </a> </li>
            <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href = "UserAccountLogs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span> </a>
		<ul class = "dropdown-menu">
                    <li> <a href = "UserAccountLogs.jsp"> User Logs </a> </li>
                    <li> <a href = "UserAccountVReportLogs.jsp"> VReport Logs </a> </li>
                    <li> <a href = "UserAccountFindingsLog.jsp"> Findings Logs </a> </li>
                    <li> <a href = "UserAccountAuditTrail.jsp"> Audit Trail Logs </a> </li>
                </ul>
            </li>
        </ul>
	<ul class="nav navbar-nav navbar-right">
            <li> <a href = "VAPT_Profile.jsp"> Profile </a>
            <li> <a href = "userLogout.jsp" class="leftnav"> <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        </ul>
    </div>
</nav> <br><br>      
<div class = "container">
	<div class = "page-header col-md-12">
            <div id="custom-search-input">
                <div class="input-group pull-left">  
                    <a href="VAPT_UserVReports.jsp" class=" btn btn-primary btn-m"> &#10094; BACK </a> <br><br>	  
                </div>
                <div class="input-group pull-right">  
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> Type of Report <span class="caret"> </span> </button> 
                    <ul class="dropdown-menu">
                        <li> <a href="VAPT_UserAddQuarter.jsp"> Quarter </a> </li>
                        <li> <a href="VAPT_UserAddMonthlyReport.jsp"> Monthly </a> </li>
                        <li> <a href="VAPT_UserInitiatedReport.jsp"> User Initiated </a> </li>
                       
                    </ul>     
                </div>
		<h2 align= "center"> Add VReports </h2>
            </div>	
	</div>
            
</div>
</body>
</html>
