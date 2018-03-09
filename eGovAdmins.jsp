<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title> EGOV ADMIN ACCOUNTS </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
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

            .page-header {
                border-bottom: 1px solid #009900;
            }

            .btn-primary {
                background-color: #009900;
            }

            div.container {
                width: 90%;
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

            String username = (String) session.getAttribute("username");
            if (null == username) {
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
                <li> <a href="VAPT_HomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
                <li> <a href = "VAPT_USERS.jsp">  <span class="glyphicon glyphicon-user"></span> Admin Users </a> </li>
                <li class = "dropdown"> <a  class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_Logs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span></a>	
                    <ul class = "dropdown-menu">
                        <li> <a href = "VAPT_Logs.jsp"> User Logs </a> </li>
                        <li> <a href = "VAPT_SuperAdminVReportLog.jsp"> VReport Logs </a> </li>
                        <li> <a href = "VAPT_SuperAdminFindingsLog.jsp"> Findings Logs </a> </li>
                        <li> <a href = "VAPT_SuperAdminAuditTrail.jsp"> Audit Trail Logs </a> </li> 
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li> <a href = "VAPT_SuperAdminProfile.jsp"> <span class ="glyphicon glyphicon-picture"> </span> Profile </a> </li>
                <li> <a href="logout.jsp" target="main" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
            </ul>
        </div>
    </nav> <br><br>
    <div class = "container">
        <div class = "page-header col-md-20">
            <div id="custom-search-input">
                <div class="input-group pull-left">  
                    <a href="VAPT_HomePage.jsp" class=" btn btn-primary btn-m"> &#10094; BACK </a> <br><br>	  
                </div>
                <h2 align= "center"> eGOV Admin Accounts </h2>
            </div>	
        </div>

        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />

        <sql:query var="select" dataSource = "${dbSource}">
            SELECT * from landbank.users where team_name = 'eGov' and user_type = 'Maker' or user_type = 'Authorizer' 
        </sql:query>

        <div class="col-sm-20 well">
            <table id="myTable" class="table table-bordred table-striped dt-responsive nowrap">       
                <thead>             
                    <tr>
                        <th> ID </th>
                        <th> Team </th> 
                        <th> User Type </th> 
                        <th> Username </th>
                        <th> First Name </th>
                        <th> Last Name </th>
                        <th> Mobile Number </th>
                        <th> Email </th>
                        <th> Status </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "row" items = "${select.rows}">
                        <tr>
                            <td><c:out value = "${row.user_id}"> </c:out></td>
                            <td><c:out value = "${row.team_name}"> </c:out> </td>
                            <td><c:out value = "${row.user_type}"> </c:out> </td>
                            <td><c:out value = "${row.username}"> </c:out> </td>
                            <td><c:out value = "${row.firstName}"> </c:out> </td>
                            <td><c:out value = "${row.lastName}"> </c:out> </td>
                            <td><c:out value = "${row.mobile_num}"> </c:out> </td>
                            <td><c:out value = "${row.email}"> </c:out> </td>
                            <td><c:out value = "${row.status}"></c:out></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>