<%-- 
    Document   : VAPT_AuthApplicationDelete
    Created on : Sep 25, 2017, 2:11:04 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> For Deletion </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"> </script>
        <script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
</head>
<style>
body
{
	min-height: 1px;
	padding: 0;
	margin: 0;
	overflow-y:scroll;
	background-color:rgb(230,221,188);
	font-family:century gothic;
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

.page-header {
	border-bottom: 1px solid #009900;
}

div.container {
	width: 90%;
}

#team {
	width: 150px;
	height: 25px;
}

#usertype {
    width: 150px;
	height: 25px;
}

#team option {
	width: 100px;
}

li:hover { 
	-webkit-box-shadow:0px 2px 0px white;
 	-moz-box-shadow:0px 2px 0px white;
 	-ms-box-shadow:0px 2px 0px white;
 	-o-box-shadow:0px 2px 0px white;
 	box-shadow:0px 2px 0px white;
 }
 
</style>
<body>
     <%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma", "no-cache");

String username = (String) session.getAttribute("authorizer");
if(null == username)
{
        out.print("<script type='text/javascript>");
        out.print("alert('Session has ended. Please Login')");
        out.print("</script>");
	RequestDispatcher rd = request.getRequestDispatcher("index.html");
	rd.include(request, response);
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
          <img height = 50px src = "Landbank - Logo.png"> <font color = "white" style = "font-size:16px;"> Land Bank of the Philippines </font><br/>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li> <a href="VAPT_AuthorizerHomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
            <li> <a href="VAPT_AuthUser.jsp"> <span class ="glyphicon glyphicon-user"> </span> Users </a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown"> System Parameters <span class="caret"> </span> </a>
                <ul class="dropdown-menu">
                    <li> <a href="VAPT_AuthSystemParameters.jsp"> Application </a> </li>
                    <li> <a href="VAPT_AuthSeverity.jsp"> Severity </a> </li> 
                </ul>
            </li>
            <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_AuthFindings.jsp"> <span class = "glyphicon glyphicon-search"> </span> Findings <span class = "caret"> </span> </a> 
		<ul class = "dropdown-menu">
                    <li> <a href = "VAPT_AuthFindings.jsp"> View Findings </a> </li>
                    <li> <a href = "VAPT_AuthResolvedFindings.jsp"> View Resolved Findings </a> </li>
		</ul>
            </li>
            <li> <a href="VAPT_AuthVReport.jsp"> VReports </a> </li>
            <li class ="dropdown"> <a class = "dropdown-toggle" data-toggle ="dropdown" href = "#"> <span class = "glyphicon glyphicon-list-alt"> </span> Logs <span class = "caret"> </span> </a>
                <ul class = "dropdown-menu">
                    <li> <a href = "VAPT_AuthUserLogs.jsp"> User Logs </a> </li>
                    <li> <a href = "VAPT_AuthVreportLogs.jsp"> VReport Logs </a> </li>
                    <li> <a href = "VAPT_AuthFindingsLogs.jsp"> Findings Logs </a> </li>
                    <li> <a href = "VAPT_AuthAuditTrailLogs.jsp"> Audit Trail Logs </a> </li>
		</ul>
            </li>
          </ul>
            <ul class="nav navbar-nav navbar-right">
                <li> <a href = "VAPT_AuthorizerProfile.jsp"> <span class="glyphicon glyphicon-picture"> </span> Profile </a>

                <li> <a href = "logout.jsp" target="main" class="leftnav"> <span class="glyphicon glyphicon-log-out"></span> Logout </a> </li>
            </ul> </div>
</nav> <br><br>

<div class="container">
    <div class = "page-header col-md-20">
    <div id="custom-search-input">     
   
            <div class="input-group col-md-4 pull-left">  
                <div class="dropdown"> 
                        <button class="btn btn-default dropdown-toggle" style="color:white; background-color: #009900;" type="button" data-toggle="dropdown"> List of Approvals <span class="caret"> </span> </button> 
                             <ul class="dropdown-menu">
                                <li> <a href="VAPT_AuthSystemParameters.jsp"> For Approval </a> </li>
                                <li> <a href="VAPT_AuthApplicationDelete.jsp"> For Deletion </a> </li>
                                
                             </ul>
                </div> 
            </div>
        
            <div class="input-group col-md-4 pull-right">  
                
            </div> 
          
        <h2 align= "center"> <font face = "century gothic"> System Parameters </font> </h2> 
              
    </div>
</div>          
         <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
                url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
         <sql:query var="delete" dataSource = "${dbSource}">
                    	SELECT * from landbank.system where status = 'For Deletion'
         </sql:query> 
    <div class="col-sm-20 well">
      <table name = "myUserTable" id="myUserTable" class="table table-bordred table-striped dt-responsive nowrap"> 
            <thead>
                <th> System Name </th>
                <th> Application </th>
                <th> Status </th>
            </thead>   
            <tbody>
                <c:forEach var = "row" items = "${delete.rows}">
                    <tr>
                        <td> <c:out value = "${row.system_name}"> </c:out> </td>
                        <td> <c:out value = "${row.application}"> </c:out> </td>
                        <td> <c:out value = "${row.status}"> </c:out> </td>
                        <td> <input type="hidden" name ="creator" value="<%=username%>" /> </td>
                        <td> <a href="#" name="button" class="btn btn-primary" data-username="${row.application}"> <span class="glyphicon glyphicon-ok"> </span> </a> 
                            <a href="#" name="button" class="btn btn-danger" data-username="${row.application}"> <span class="glyphicon glyphicon-remove"> </span> </a> 
                        </td>
                    </tr>
                </c:forEach>
            </tbody> 
      </table>        
    </div>
</div>                       
</body>
</html>
