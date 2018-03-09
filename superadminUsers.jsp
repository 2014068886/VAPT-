<%-- 
    Document   : superadminUsers
    Created on : Nov 10, 2017, 3:57:19 PM
    Author     : JMB
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ADMIN USERS </title>
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
        <link rel="stylesheet" type="text/css" href="css/superAdmin.css"/>
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
                    <li> <a href="VAPT_HomePage.jsp"> <span class="glyphicon glyphicon-home"></span> Home </a> </li>
                    <li> <a href = "VAPT_USERS.jsp">  <span class="glyphicon glyphicon-user"></span> <b> Admin Users </b> </a> </li>
                    <li class = "dropdown"> <a class = "dropdown-toggle" data-toggle = "dropdown" href = "VAPT_Logs.jsp"> <span class="glyphicon glyphicon-list-alt"></span> Logs <span class = "caret"> </span></a>	
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
                    <li> <a href="superadminLogout.jsp" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
                </ul>
            </div>
        </nav> <br><br>    

        <div class = "container">
            <div class = "page-header col-md-20">
                <div id="custom-search-input">
                    <div class="input-group col-md-4 pull-right">  
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-search"></i>
                        </span>
                        <input type="text" class="form-control input-lg" id="myInput" onkeyup="myFunction()" placeholder = "Search User Account"/>           
                    </div>
                    <h2 align= "center"> <font face = "century gothic"> Admin Users </font> </h2>
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
                        <th> Team Name </th>
                        <th> User Type </th>
                        <th> Username </th>
                        <th> First Name </th>
                        <th> Last Name </th>
                        <th> Status </th>
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
                            <a href="superadminUsers.jsp?pageNumber=${pageNumber - 1}">Previous</a>
                        </c:if>

                        <c:forEach begin="1" end="${numberOfPages}" var="i">
                            <c:choose>
                                <c:when test="${i!=pageNumber}">
                                    <a href="superadminUsers.jsp?pageNumber=<c:out value="${i}"/>"><c:out value="${i}"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a class="active" href="#"> <c:out value="${i}"/> </a>
                                </c:otherwise>        
                            </c:choose>       
                        </c:forEach>  

                        <c:if test="${pageNumber lt numberOfPages}">
                            <a href="superadminUsers.jsp?pageNumber=${pageNumber + 1}">Next</a>
                        </c:if>
                    </div>
                </div>
            </center>

            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#myModal"> <span class="glyphicon glyphicon-plus"></span> Add User </button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#update"> <span class="glyphicon glyphicon-refresh"></span> Update User </button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#activate"> <span class="glyphicon glyphicon-check"></span> Activate User </button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#deactivate"> <span class="glyphicon glyphicon-minus"></span> Deactivate User </button>
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="modal" data-target="#generate"> <span class="glyphicon glyphicon-print"></span> Generate Report </button>

            <div class="modal fade" id="update" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Update User </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="VAPT_UpdateAdmin.jsp"  method="get" onSubmit="if (!confirm('Do you want to update this user?')) {
                                                     return false;
                                                 }"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Username </label> 
                                            <%
                                                try {

                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                    Statement st = (Statement) con.createStatement();
                                                    String query = "select * from users where status='Activated' and user_type='Maker' or user_type='Authorizer'";
                                                    ResultSet rs = st.executeQuery(query);
                                            %>
                                            <select id="id" name="id" class="form-control" required>
                                                <option value="">Please Select...</option>
                                                <% while (rs.next()) {%>
                                                <option value="<%= rs.getString("user_id")%>"> <%=rs.getString("username")%></option>
                                                <% } %>
                                            </select> <br><br>
                                            <%
                                                
                                                con.close();
                                                
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>

                                            <center><button type="submit" class="btn btn-primary">  Submit </button></center>
                                        </div>
                                    </div>													

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Add User </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="VAPT_InsertAdmin.jsp"  method="post" onSubmit="if (!confirm('Are you sure you want to add this user?')) {
                                                    return false;}"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class = "col-xs-3">
                                                <label for = "team"> Team: </label> <label style="color:red">*</label>
                                                <%
                                                    try {

                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                        Statement st = (Statement) con.createStatement();
                                                        String query = "select * from team";
                                                        ResultSet rs = st.executeQuery(query);
                                                %>
                                                <select id="team" name="team" class="form-control-static" required>
                                                    <option value="">Please Select...</option>
                                                    <%  while (rs.next()) {%>
                                                    <option value="<%=rs.getString(2)%>"> <%= rs.getString(2)%> </option>
                                                    <%  } %>
                                                </select> <br>
                                                <%
                                                        con.close();

                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %> 
                                            </div>

                                            <div class = "col-xs-4">
                                                <label for = "fname">First Name</label> <label style="color:red">*</label>
                                                <input type="text" id = "fname" name="firstName" placeholder="Enter First Name Here.." class="form-control" required><br> 
                                            </div>
                                            <div class = "col-xs-4">
                                                <label for = "lname">Last Name</label> <label style="color:red">*</label>
                                                <input type="text" id = "lname" name="lastName" placeholder="Enter Last Name Here.." class="form-control" required><br>
                                            </div>
                                            <div class = "col-xs-6">
                                                <label for = "uname"> Username: </label> <label style="color:red">*</label>
                                                <input type="text" id = "uname" name="username" placeholder="Enter Username Here.." class="form-control" required> <br>
                                            </div>	       
                                            <div class = "col-xs-6">
                                                <label for = "pword"> Password: </label> <label style="color:red">*</label>
                                                <%
                                                    try {
                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                        String length = "select * from system_parameters";
                                                        Statement check = (Statement) con.createStatement();
                                                                                                ResultSet passLength = check.executeQuery(length);
                                                                                                while (passLength.next()) {%>
                                                <input type = "password" class="form-control" id = "pword" name = "password"  placeholder="Enter Password Here.." maxlength="<%=passLength.getString("password_max_length")%>" minLength="<%=passLength.getString("password_min_length")%>" required> <br>
                                                <%
                                                        }

                                                        con.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>      

                                            </div>	  
                                            <div class = "col-xs-12">
                                                <label for = "address"> Address: </label>
                                                <textarea class = "form-control" name = "address" id = "address" placeholder = "Enter Address Here" required> </textarea> <br>
                                            </div>
                                            <div class = "col-xs-4">
                                                <label for = "mobile"> Mobile Number: </label>
                                                <input type="text" id = "mobile" name="mobileNum" placeholder="Enter Mobile Number Here.." class="form-control"> <br>
                                            </div>
                                            <div class = "col-xs-4">
                                                <label for = "phone">Phone Number:</label>
                                                <input type="tel" id = "phone" name="phoneNum" placeholder="Enter Phone Number Here.." class="form-control"><br>
                                            </div>
                                            <div class = "col-xs-4"> 
                                                <label for = "email"> Email Address: </label>  <label style="color:red">*</label>
                                                <input type="email" id = "email" name="emailAdd" placeholder="Enter Email Address Here.." class="form-control" required><br>
                                            </div>  
                                            <div class = "col-xs-4">                    
                                                <label> User Type: </label>
                                                <select id = "usertype" name = "usertype" class="form-control-static">
                                                    <option value = "Maker"> Admin (Maker) </option>
                                                    <option value = "Authorizer"> Admin (Authorizer) </option>
                                                </select> <br><br> 
                                            </div>	  	

                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type="reset" class="btn btn-primary"> Reset </button> </center>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Deactivate -->
            <div class="modal fade" id="deactivate" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Deactivate User </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="deactivate.jsp"  method="post" onSubmit="if (!confirm('Do you want to deactivate this user?')) {
                                                     return false;}"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                                <label> Username </label> <label style="color:red">*</label>
                                                <%
                                                    try {

                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                        Statement st = (Statement) con.createStatement();
                                                        String query = "select username from landbank.users where status = 'Activated' and user_type = 'Maker' or user_type='Authorizer'";
                                                        ResultSet rs = st.executeQuery(query);
                                                %>
                                                <select class="form-control" id="username" name="username" required>
                                                    <option value =""> Please Select... </option>
                                                    <%  while (rs.next()) {%>
                                                    <option value="<%=rs.getString(1)%>"> <%= rs.getString(1)%> </option>
                                                    <%  } %>
                                                </select> <br>
                                                <%
                                                        con.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                                <label> Remarks </label>		
                                                <textarea class = "form-control" name = "remarks" id = "remarks" rows = "2" placeholder = "Enter Remarks Here.."> </textarea> <br>					
                                  
                                        </div>
                                    </div>													
                                    <center><button type="submit" class="btn btn-primary">  Submit </button></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="activate" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Activate User </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="activate.jsp"  method="post" onSubmit="if (!confirm('Do you want to activate this user?')) {
                                                    return false;}"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <label> Username </label> <label style="color:red">*</label>
                                            <%
                                                try {

                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                                                    Statement st = (Statement) con.createStatement();
                                                    String query = "select username from landbank.users where status = 'Deactivated' and user_type='Maker' or user_type='Authorizer' ";
                                                    ResultSet rs = st.executeQuery(query);
                                            %>
                                            <select class="form-control" id="username" name="username" required>
                                                <option value =""> Please Select... </option> 
                                                <%  while (rs.next()) {%>
                                                <option value="<%=rs.getString(1)%>"> <%= rs.getString(1)%> </option>
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
                                    <center><button type="submit" class="btn btn-primary"> Submit </button></center>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="generate" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title"> Generate Report </h4>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <form action="GenerateAdminReport"  method="post" onSubmit="if (!confirm('Are you sure you want to generate this Report?')) {return false;
                                                 }"> 
                                    <div class="col-md-12">
                                        <div class="row">
                                            <select class ="form-control" name ="userReport" id="userReport">
                                                <option value ="admin"> Admin Users </option>
                                                <option value ="user"> Users </option>                                
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


        </div>
    </body>
</html>
