<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title> ADMIN HOMEPAGE </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="jquery.js"></script>
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

            div.footer {
                position:absolute;
                left: 0;
                bottom: 0;
                height:30px;
                width:100%;
                overflow:hidden;
                background-color: #009900;
                opacity:0.5;

            }

            div.footer > p {
                position:relative;
                font-family:verdana;
                color:whitesmoke;
                margin:auto;
                padding:0;
                text-align:center;
            }

            /*
            ul.navigation {
                    position:fixed;
                    width:100%;
                    min-width:100%;
                    height:55px;
                    list-style:none;
                    text-align:right;
                    font-family:verdana;
                    font-size:13px;
                    background-color: #009900;
                    color:white;
                    top:-15px;
                    line-height: 50px;
                    overflow:hidden;
            }
            
            ul.navigation > li{
                    position:relative;
                    padding-top:9px;
                    padding-right:22px;
                    padding-left:22px;
                    display:inline-block;
                    top:-10%;
                    right:10%;
                    
                    -webkit-transition: all 900ms ease;
                    -moz-transition: all 900ms ease;
                    -ms-transition: all 900ms ease;
                    -o-transition: all 900ms ease;
                    transition: all 900ms ease;
            }
            
            */

            .page-header {
                border-bottom: 1px solid #009900;
            }

            .panel-heading {
                background-color: #009900!important;
            }

            .panel-heading .panel-title {
                font-size: 18px;
            }

            a.logo {
                float: left;
                display: block;
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
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");

            String username = (String) session.getAttribute("admin");
            if (null == username) {
                request.setAttribute("Error", "Session has ended. Please Login");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        %> 
        <div> 			
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
                        <li> <a href="VAPT_AdminHomePage.jsp"> <span class="glyphicon glyphicon-home"></span> <b> Home </b> </a></li>
                        <li> <a href = "VAPT_AdminUsers.jsp">  <span class="glyphicon glyphicon-user"></span>  Users  </a> </li>
                        <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_Findings.jsp"> <span class = "glyphicon glyphicon-search"> </span> Findings <span class = "caret"> </span> </a> 
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
                        <li> <a href="adminLogout.jsp" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
                    </ul>
                </div>
            </nav> <br><br>
        </div>   
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/landbank" user = "root" password = "12345" />

        <sql:query var="activated" dataSource = "${dbSource}">
            select COUNT('status') as count from users where status = 'Activated' and user_type='User'; 
        </sql:query>

        <sql:query var="vreport" dataSource = "${dbSource}">
            select COUNT('vapt_id') as count from vreport; 
        </sql:query>

        <sql:query var="findings" dataSource = "${dbSource}">
            select COUNT('finding_id') as count from findings where status = 'Not Yet Resolved'; 
        </sql:query>

        <sql:query var="resolved" dataSource = "${dbSource}">
            select COUNT('status') as count from findings where status = 'Resolved'; 
        </sql:query>

        <sql:query var="deactivated" dataSource = "${dbSource}">
            select COUNT('status') as count from users where status = 'Deactivated'; 
        </sql:query>

        <sql:query var="ibt" dataSource = "${dbSource}">
            select COUNT('status') as count from users where team_name = 'IBT' and user_type='User'; 
        </sql:query>

        <sql:query var="mbt" dataSource = "${dbSource}">
            select COUNT('status') as count from users where team_name = 'MBT' and user_type='User'; 
        </sql:query>

        <sql:query var="egov" dataSource = "${dbSource}">
            select COUNT('status') as count from users where team_name = 'eGov' and user_type='User'; 
        </sql:query>

        <sql:query var="total" dataSource = "${dbSource}">
            select COUNT('status') as count from users where user_type = 'User'; 
        </sql:query>

        <div class = "container">
            <div class = "page-header">
                <h3 align = "center"> 
                    Welcome, <%= username%> 
                </h3>
            </div>
            <div class = "row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"> <font face = "century gothic" color = "white"> Inventory Status </font> </h3>
                    </div>
                    <div class="panel-body">
                        <label> TOTAL NO. OF RESOLVED FINDINGS: <a href = "VAPT_ViewResolvedFindings.jsp"> <c:forEach var = "row" items = "${resolved.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> TOTAL NO. OF UNRESOLVED FINDINGS: <a href = "VAPT_Findings.jsp"> <c:forEach var = "row" items = "${findings.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> TOTAL NO. OF VREPORTS: <a href = "VAPT_VReports.jsp"> <c:forEach var = "row" items = "${vreport.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        </div>
                        <div class="panel-heading">
                            <h3 class="panel-title"> <font face = "century gothic" color = "white"> User Status </font></h3>
                        </div>
                        <div class="panel-body">
                        <label> NO. OF ACTIVATED USERS: <a href = "VAPT_ActivatedUsers.jsp"> <c:forEach var = "row" items = "${activated.rows}"> ${row.count} </c:forEach> </a> </label> <br> 
                        <label> NO. OF DEACTIVATED USERS: <a href = "VAPT_DeactivatedUsers.jsp"> <c:forEach var = "row" items = "${deactivated.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> NO. OF USERS IN IBT: <a href = "IbtUsers.jsp"> <c:forEach var = "row" items = "${ibt.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> NO. OF USERS IN MBT: <a href = "MbtUsers.jsp"> <c:forEach var = "row" items = "${mbt.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> NO. OF USERS IN eGov: <a href = "eGovUsers.jsp"> <c:forEach var = "row" items = "${egov.rows}"> ${row.count} </c:forEach> </a> </label> <br>
                        <label> TOTAL NO. OF USERS: <a href = "VAPT_AdminUsers.jsp"> <c:forEach var = "row" items = "${total.rows}"> ${row.count} </c:forEach> </a> </label> <br> 
                    </div>
                </div>
            </div>


        </div> <br><br>
        <div class = "footer">
            <p> Copyright &#9400 2017 Land Bank of the Philippines. All Rights Reserved </p>
        </div>
    </body>
</html>