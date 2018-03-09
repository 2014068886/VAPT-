<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "css/bootstrap.min.css">
<script src = "js/jquery.min.js"> </script>
<script src = "js/jquery.js"> </script>
<script src = "js/bootstrap.min.js"> </script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
<script>
    function myFunction() {
          var input, filter, table, tr, td, i;
          input = document.getElementById("myInput");
          filter = input.value.toUpperCase();
          table = document.getElementById("myUserTable");
          tr = table.getElementsByTagName("tbody");

         for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("tr")[0];
          if (td) {
            if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          } 
         }
        }   
</script>
<style> 
body {

	min-height: 1px;
	padding: 0;
	margin: 0;
	overflow-y:scroll;
	background-color:rgb(230,221,188);
	font-family:century gothic;
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

li:hover { 
	-webkit-box-shadow:0px 2px 0px white;
 	-moz-box-shadow:0px 2px 0px white;
 	-ms-box-shadow:0px 2px 0px white;
 	-o-box-shadow:0px 2px 0px white;
 	box-shadow:0px 2px 0px white;
 }

</style>
<title> Admin Logs </title>
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
				</ul>
			</li>
			<li> <a href="VAPT_VReports.jsp"> <span class="glyphicon glyphicon-file"></span> VReports </a></li>	
		    <li class = "dropdown"> <a  class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_AdminLogs.jsp"> <strong> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span> </strong> </a>	
		    	<ul class = "dropdown-menu">
		    		<li> <a href = "VAPT_AdminLogs.jsp"> User Logs </a> </li>
		    		<li> <a href = "VAPT_VReportLogs.jsp"> VReport Logs </a> </li>
		    		<li> <a href = "VAPT_FindingLogs.jsp"> Findings Logs </a> </li>
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
<div class = "container">
    <div class = "page-header col-md-12">
      <div id="custom-search-input">
            <div class="input-group pull-left">  
                <div class="dropdown"> 
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> View Log Type <span class="caret"> </span> </button> 
                        <ul class="dropdown-menu">
                             <li> <a href="VAPT_UserLogs.jsp"> All </a> </li>
                             <li> <a href="VAPT_SpecificLogs.jsp"> Specific </a> </li>
                        </ul>
                </div>  	  
            </div>
            <div class="input-group col-md-4 pull-right">  
                <span class="input-group-addon">
                    <i class="glyphicon glyphicon-search"></i>
   		</span>
                <input type="text" class="form-control input-lg" id="myInput" onkeyup="myFunction()" placeholder = "Search User Logs"/>           
            </div>
		<h2 align= "center"> <font face = "century gothic"> User Logs </font> </h2>
      </div>	
    </div>
<!--	
	<sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />
			
	<sql:query var="select" dataSource = "${dbSource}">
		SELECT * from landbank.logs;
	</sql:query>
	
	<div class="col-sm-12 well">
	    <table name = "myUserTable" id="myUserTable" class="table table-bordred table-striped dt-responsive nowrap">       
             <thead>             
                <tr>
                   <th> Log ID </th>
                   <th> User ID </th>
                   <th> Creator </th>
                   <th> Team </th>
                   <th> User Type </th>
                   <th> Transaction Name </th>
                   <th> Account Created/Updated </th>
                   <th> Transaction Date </th>
                   <th> <a href="sample.jsp"> SAMPLE </a> </th>
		</tr>
              </thead>
             
             	<c:forEach var = "row" items = "${select.rows}">
             	 <tbody>	
                        <tr>
				<td><c:out value = "${row.log_id}"> </c:out> </td>
				<td><c:out value = "${row.user_id}"> </c:out> </td>
                                <td><c:out value = "${row.creator}"> </c:out> </td>
				<td><c:out value = "${row.team_name}"> </c:out> </td>
				<td><c:out value = "${row.user_type}"> </c:out> </td>
             			<td><c:out value = "${row.transaction_name}"> </c:out></td>
             			<td><c:out value = "${row.account}"> </c:out> </td>
             			<td><c:out value = "${row.transaction_date}"> </c:out> </td>
                               
             		</tr>
                 </tbody>      
             	</c:forEach>
         </table>
    </div>
</div>
<%@ taglib prefix="datatables" uri="http://github.com/tduchateau/DataTables-taglib" %>
        <link rel ="stylesheet" type="text/css" href="css/jquery.dataTables.css">
        <script src ="js/jquery-min.js"> </script>
        <script src ="js/jquery.dataTables.min.js"> </script>
          
        <link rel="stylesheet" href="jquery.dataTables.min.css">
<script> 
$(document).ready(function(){
    $('#myUserTable').DataTable();
});
</script>
        
      -->
</body>
</html>