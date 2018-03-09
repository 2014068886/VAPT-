<%-- 
    Document   : AuthorizerVReport
    Created on : Nov 17, 2017, 11:20:39 AM
    Author     : JMB
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Authorizer VREPORT </title>
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
    </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/authVReport.css">
        <script src ="js/search.js"></script>  
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
            response.setHeader("Pragma", "no-cache");

            String username = (String) session.getAttribute("authorizer");
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
                <img height = 50px src = "Landbank - Logo.png"> <font color = "white" style = "font-size:16px;"> Land Bank of the Philippines </font><br/>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li> <a href="VAPT_AuthorizerHomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a></li>
                    <li> <a href="VAPT_AuthUser.jsp"> <span class ="glyphicon glyphicon-user"> </span> Users </a></li>
                    <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown"> System Parameters <span class="caret"> </span> </a>
                        <ul class="dropdown-menu">
                            <li> <a href="VAPT_AuthSystemParameters.jsp"> Application </a> </li>
                            <li> <a href="VAPT_AuthTeamApproval.jsp"> Team </a> </li>
                            <li> <a href="VAPT_AuthSeverity.jsp"> Severity </a> </li> 
                        </ul>
                    </li>

                    <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href="VAPT_AuthFindings.jsp"> <span class = "glyphicon glyphicon-search"> </span> Findings <span class = "caret"> </span> </a> 
                        <ul class = "dropdown-menu">
                            <li> <a href = "VAPT_AuthFindings.jsp"> View Findings </a> </li>
                            <li> <a href = "VAPT_AuthResolvedFindings.jsp"> View Resolved Findings </a> </li>
                        </ul>
                    </li>
                    <li> <a href="VAPT_AuthVReport.jsp"> <strong> VReports </strong> </a> </li>
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
                    <li> <a href = "VAPT_AuthorizerProfile.jsp"> <span class="glyphicon glyphicon-picture"> </span> Profile </a> </li>                
                    <li> <a href = "logout.jsp" target="main" class="leftnav"> <span class="glyphicon glyphicon-log-out"></span> Logout </a> </li>
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
                    <h2 align= "center"> <font face = "century gothic"> VReports </font> </h2>
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
                    <table id="myUserTable" name = "myUserTable" class="table table-bordred table-striped dt-responsive nowrap" border="1" width="90%">                    
                        <c:set var="columns" value="0" scope="session"/>
                        <th> VAPT ID </th>
                        <th> Quarter Report </th>
                        <th> VAPT Date </th>
                        <th> TCR </th>
                        <th> Received Date </th>
                        <th> Results </th>
                        <th> Remarks </th>
                        <th> Date Added </th>
                        <th> Date Modified </th>        
                            <c:forEach items="${categories.columnNames}" var="name">
                                <c:set var="columns" value="${columns+1}"/>
                                <!--<th><c:out value="${name}"/></th>-->
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
                            <a href="AuthorizerVReport.jsp?pageNumber=${pageNumber - 1}">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${numberOfPages}" var="i">
                            <c:choose>
                                <c:when test="${i!=pageNumber}">
                                    <a href="AuthorizerVReport.jsp?pageNumber=<c:out value="${i}"/>"> <c:out value="${i}"/> </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="active" href="#"><c:out value="${i}"/> </a>
                                </c:otherwise>        
                            </c:choose>       
                        </c:forEach>  

                        <c:if test="${pageNumber lt numberOfPages}">
                            <a href="AuthorizerVReport.jsp?pageNumber=${pageNumber + 1}"> Next </a>
                        </c:if>
                    </div>
                </div>
        </div>
    </body>
</html>
