<%-- 
    Document   : auditLogs
    Created on : Aug 24, 2017, 11:33:44 AM
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
        <title> Audit Trail Logs </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <style>
            body {
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

            .btn-primary {
                background-color: #009900;
            }

            .pagination {
                display: inline-block
            }

            .pagination a {
                color: black;
                padding: 8px 16px;
                text-decoration: none;
                border: 1px solid #ddd;
            }

            .pagination a.active {
                color: white;
                background-color: green;
                border: 1px solid #4CAF50;
            }

            .pagination a:hover:not(.active) {
                background-color: #009900;
                color: white;
                border-radius: 5px;
            }
        </style>
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
                    <li class = "dropdown"> <a  class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_Logs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> <b> Logs </b> <span class = "caret"> </span></a>	
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

        <div class = "container">
            <div class = "page-header col-md-12">
                <div id="custom-search-input">
                    <div class="input-group pull-left">  
                        <div class="dropdown"> 
                            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> View Log Type <span class="caret"> </span> </button> 
                            <ul class="dropdown-menu">
                                <li> <a href="VAPT_AuditTrailLogs.jsp"> All Logs </a> </li>
                                <li> <a class="dropdown-toggle" data-toggle="modal" data-target="#specificPerson"> Specific Person </a> </li>
                                <li> <a class="dropdown-toggle" data-toggle="modal" data-target="#myModal" href="#"> Specific Date Logs </a> </li>
                                <li> <a href="VAPT_OwnAuditTrailLogs.jsp"> Own Logs </a> </li>
                            </ul>
                        </div> 
                    </div>
                    <div class="input-group col-md-4 pull-right">  
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-search"></i>
                        </span>
                        <input type="text" class="form-control input-lg" id="myInput" onkeyup="myFunction()" placeholder = "Search Audit Trail"/>           
                    </div>
                    <h2 align= "center"> <font face = "century gothic"> Audit Trail Logs </font> </h2>
                </div>	
            </div>

            <div class="modal fade" id="specificPerson" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> View Specific Person Logs </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form method="POST" action="VAPT_SpecificPersonAuditTrail.jsp">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Creator </label>
                                            <input class="form-control" type="text" name="username" id="username" /> <br>
                                        </div>
                                    </div>
                                    <center> <button type="submit" class="btn btn-primary"> Submit </button>  </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                    
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> View Specific Date Logs </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form method="POST" action="VAPT_SpecificAuditTrailLogs.jsp" onSubmit="if (!confirm('Are you sure you want to add this user?')) { return false;}"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Date Range: </label> <br>
                                            <p> From: </p> <input type="date" name="start" class = "form-control"> <br>
                                            <p> To: </p> <input type="date" name="end" class = "form-control"> <br> <br>
                                        </div>
                                    </div>
                                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type="reset" class="btn btn-primary"> Reset </button> </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="categories" value="${sessionScope.categories}" />
            <c:set var="rowsPerPage" value="15" />
            <c:set var="pageNumber" value="${param.pageNumber}"/>
            <c:set var="a">
                <fmt:formatNumber value="${categories.rowCount/rowsPerPage}" maxFractionDigits="0"/>
            </c:set>

            <c:set var="b" value="${categories.rowCount/rowsPerPage}" />
            <c:choose>
                <c:when test="${a==0}">
                    <c:set var="numberOfPages" value="1" scope="session"/>   
                </c:when>

                <c:when test="${b>a}">
                    <c:set var="xxx" value="${b%a}"/>
                    <c:if test="${xxx>0}">
                        <c:set var="numberOfPages" value="${b-xxx+1}" scope="session"/>   
                    </c:if>
                </c:when>

                <c:when test="${a>=b}">
                    <c:set var="numberOfPages" value="${a}" scope="session"/>    
                </c:when>
            </c:choose>

            <c:set var="start" value="${pageNumber*rowsPerPage-rowsPerPage}"/>
            <c:set var="stop" value="${pageNumber*rowsPerPage-1}"/> 

            <center>
                <div class="col-sm-12 well">        
                    <table id="myUserTable" name = "myUserTable" class="table table-bordred table-striped dt-responsive nowrap" border="1">                    
                        <c:set var="columns" value="0" scope="session"/>
                        <th> Log ID </th>
                        <th> Transaction Name </th>
                        <th> Transaction Date </th>
                        <th> Creator </th>
                        <c:forEach items="${categories.columnNames}" var="name">
                            <c:set var="columns" value="${columns+1}"/>
                        </c:forEach>
                        <c:set var="columns" value="${columns-1}"/>
                        <c:forEach items="${categories.rowsByIndex}" var="row" begin="${start}" end="${stop}">
                            <tbody> 
                                <tr>
                                    <c:forEach begin="0" end="${columns}" var="x">
                                        <td><c:out value="${row[x]}"/></td>
                                    </c:forEach>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>

                    <div class="pagination">
                        <c:if test="${pageNumber gt 1}">
                            <a href="auditLogs.jsp?pageNumber=${pageNumber - 1}">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${numberOfPages}" var="i">
                            <c:choose>
                                <c:when test="${i!=pageNumber}">
                                    <a href="auditLogs.jsp?pageNumber=<c:out value="${i}"/>"><c:out value="${i}"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="active" href="#"> <c:out value="${i}"/> </a>
                                </c:otherwise>        
                            </c:choose>       
                        </c:forEach>  

                        <c:if test="${pageNumber lt numberOfPages}">
                            <a href="auditLogs.jsp?pageNumber=${pageNumber + 1}">Next</a>
                        </c:if>
                    </div>
                </div>
            </center>

            <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="modal"  data-target="#userLogs"> <span class="glyphicon glyphicon-calendar"> </span> Generate Report </button> 
            <br><br>
            <div class="modal fade" id="userLogs" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Generate Report </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form method="POST" action="GenerateAuditTrailLogs"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <select id ="report" name="report" class="form-control">
                                                <option> Please Select... </option>
                                                <option value="all"> All </option>
                                                <option value="own"> Own </option>
                                            </select> <br><br>
                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type="reset" class="btn btn-primary"> Reset </button> </center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
