<%-- 
    Document   : userVReports
    Created on : Nov 6, 2017, 11:21:01 AM
    Author     : JMB
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> User VReports </title>

        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
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

        div.footer{
            position:absolute;
            z-index:3;
            height:51px;
            width:100%;
            background-color:rgba(76,175,80,0.6);
            overflow:hidden;
            opacity: 0.35;

        }

        div.footer > p {
            position:absolute;
            font-family:verdana;
            color:white;
            margin:auto;
            padding:0;
            text-align:center;
        }

        .panel-heading {
            background-color: #009900!important;
        }

        .panel-heading .panel-title {
            font-size: 18px;
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
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");

            String username = (String) session.getAttribute("user");
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
                    <li> <a href = "VAPT_Profile.jsp"> <span class="glyphicon glyphicon-picture"> </span> Profile </a>
                    <li> <a href = "userLogout.jsp" class="leftnav"> <span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                </ul>
            </div>
        </nav> <br><br>      

        <div class = "container">
            <div class = "page-header col-md-12">
                <div id="custom-search-input">
                    <div class="input-group col-md-4 pull-right">  
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-search"></i>
                        </span>
                        <input type="text" class="form-control input-lg" id="myInput" onkeyup="myFunction()" placeholder = "Search VReport"/>           
                    </div>
                    <h2 align= "center"> VReports </h2>
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

                        <th> VAPT ID </th>
                        <th> Quarter Report </th>
                        <th> VAPT Date </th>
                        <th> TCR </th>
                        <th> Received Date </th>
                        <th> Results </th>
                        <th> Remarks </th>
                        <th> Date Added </th>


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
                            <a href="userVReports.jsp?pageNumber=${pageNumber - 1}">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${numberOfPages}" var="i">
                            <c:choose>
                                <c:when test="${i!=pageNumber}">
                                    <a href="userVReports.jsp?pageNumber=<c:out value="${i}"/>"><c:out value="${i}"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="active" href="#"> <c:out value="${i}"/> </a>
                                </c:otherwise>        
                            </c:choose>       
                        </c:forEach>  

                        <c:if test="${pageNumber lt numberOfPages}">
                            <a href="userVReports.jsp?pageNumber=${pageNumber + 1}">Next</a>
                        </c:if>
                    </div>
                </div>
            </center>

<!--  <a href="VAPT_UpdateUserVReports.jsp?id=<c:out value="${row.vapt_id}"/>">Update</a> 
<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span> Add VReport </button> -->

            <a href="VAPT_AddUserVReport.jsp" class="btn btn-primary dropdown-toggle"> Add VREPORT </a>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#update"> <span class="glyphicon glyphicon-refresh"> </span> Update VREPORT </button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#generate"> <span class="glyphicon glyphicon-calendar"></span> Generate Report </button>

            <div class="modal fade" id="generate" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Generate Report </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="generateReport.html"  method="post" onSubmit="if (!confirm('Are you sure you want to add this Report?')) {
                                            return false;
                                        }"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <select class ="form-control" name ="vreport" id="vreport">

                                                <option value ="all"> All </option>

                                            </select> <br><br>
                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type = "reset" class = "btn btn-primary"> Reset </button></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="update" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Update VReport </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="VAPT_UpdateUserVReports.jsp" method="post" onSubmit="if (!confirm('Are you sure you want to add this Report?')) {
                                            return false;}"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Choose VREPORT: </label>
                                            <%
                                                try {
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                    String sqlQuery = "select * from landbank.vreport";
                                                    Statement st = (Statement) con.createStatement();
                                                    ResultSet rs = st.executeQuery(sqlQuery);

                                            %>        
                                            <select class="form-control" name="id" id="id">
                                                <option value=""> Please Select... </option>
                                                <%  while (rs.next()) {%>
                                                <option value="<%=rs.getString("keyId")%>"> <%= rs.getString("keyId")%> </option>
                                                <%  } %>

                                            </select> <br>
                                            <%
                                                    con.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type = "reset" class = "btn btn-primary"> Reset </button></center>
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
                            <h4 class="modal-title"> Add VReport </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="AddUserVReport.jsp" method="post" onSubmit="if (!confirm('Are you sure you want to add this Report?')) {
                                            return false;
                                        }"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Quarter Reported: </label>
                                            <select class = "form-control" id = "qtr" name = "qtr">
                                                <option value = "1st Quarter"> 1st Quarter </option>
                                                <option value = "2nd Quarter"> 2nd Quarter </option>
                                                <option value = "3rd Quarter"> 3rd Quarter </option>
                                                <option value = "4th Quarter"> 4th Quarter </option>
                                            </select> <br>
                                            <label> Date of VAPT </label>
                                            <input type="date" name="vaptDate" placeholder="Enter Date Here.." class="form-control" required> <br>
                                            <label> TCR </label>
                                            <input type="text" name="tcr" placeholder="Enter TCR Here.." class="form-control"> <br>
                                            <label> Report Received </label>
                                            <input type="date" name="reportDate" placeholder="Enter Date Received Here.." class="form-control" required><br>
                                            <label> Results </label>
                                            <input type="text" name="results" placeholder="Enter Results Here.." class="form-control" required> <br>
                                            <label> Remarks </label>
                                            <textarea class = "form-control" name = "remarks" id = "remarks" rows = "3" placeholder = "Enter Remarks Here.."> </textarea> <br>
                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-success"> Submit </button> <button type = "reset" class = "btn btn-primary"> Reset </button></center>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </body>
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
</html>
