<%-- 
    Document   : VAPT_AddMonthVReport
    Created on : Sep 4, 2017, 10:15:10 AM
    Author     : JMB
--%>

<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"></script>
        <script src = "js/bootstrap.min.js"></script>
      <link rel = "stylesheet" href = "css/bootstrap-datepicker.css"/>
      <script src="js/bootstrap-datepicker.js"> </script>
        <style> 
            body {

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

            li:hover { 
                -webkit-box-shadow:0px 2px 0px white;
                -moz-box-shadow:0px 2px 0px white;
                -ms-box-shadow:0px 2px 0px white;
                -o-box-shadow:0px 2px 0px white;
                box-shadow:0px 2px 0px white;
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

            a.logo {
                float: left;
                display: block;
            }

            div.form {
                position: relative;
                left: 30%;
                right: 10%;
                width: 30%;
                height: 120px;
                align-content: center;

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
                            <li> <a href = "VAPT_UserLogs.jsp"> User Logs </a> </li>
                            <li> <a href = "VAPT_VReportLogs.jsp"> VReport Logs </a> </li>
                            <li> <a href = "VAPT_FindingLogs.jsp"> Findings Logs </a> </li>
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
                    <li> <a href="adminLogout.jsp" class="leftnav"> <span class="glyphicon glyphicon-log-out"> </span> Logout</a></li>    
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
                    <center> <h2 align= "center"> <font face = "century gothic"> Add Monthly VReport </font> </h2> </center>
                </div>	
            </div>

            <div class="form" >
                <form method="POST" action ="ProcessMonthlyVReport" enctype="multipart/form-data" onSubmit="if (!confirm('Are you sure you want to add this Report?')) {
                        return false;
                    }">  
                    <label> APPLICATION: </label> <label style="color:red">*</label>
                    <%
                        try {

                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/landbank", "root", "12345");
                            Statement st = (Statement) con.createStatement();
                            String query = "select * from system GROUP BY system_name ASC";
                            ResultSet rs = st.executeQuery(query);
                    %>
                    <select class="form-control" id="system" name="system" required>
                        <option value=""> Please Select.. </option>
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
                    <%
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate ld = LocalDate.now();
                        String date = dtf.format(ld);

                    %>
                    
                  <label> Date of VAPT </label> <label style="color:red">*</label>
                  <input type="number" name="vaptDate" placeholder="Enter Day Here.." class="form-control" required> 
                  <select class="form-control" id="month" name="month" required>
                      <option value=""> Please Select.. </option>
                      <option value="January"> January </option>
                      <option value="February"> February </option>
                      <option value="March"> March </option>
                      <option value="April"> April </option>
                      <option value="May"> May </option>
                      <option value="June"> June </option>
                      <option value="July"> July </option>
                      <option value="August"> August </option>
                      <option value="September"> September </option>
                      <option value="October"> October </option>
                      <option value="November"> November </option>
                      <option value="December"> December </option>
                  </select>
                  <input type="text" name="year" class="date-own form-control" placeholder="Enter Year" required> <br>
                    
                    <label> Report Received </label> <label style="color:red">*</label>
                    <input type="date" name="reportDate" placeholder="Enter Date Received Here.." class="form-control" max=<%=date%> required><br>
                    <label> Results </label> <label style="color:red">*</label>
                    <input type="text" name="results" placeholder="Enter Results Here.." class="form-control"> <br>
                    <label> VAPT FILE </label> <label style="color:red">*</label>
                    <input type="file" name="file" class="form-control" placeholder="Choose File Here.." /> <br> 

                    <input type="hidden" name="destination" value="C:\Uploaded Files" />
                    <label> Remarks </label>
                    <textarea class = "form-control" name = "remarks" id = "remarks" rows = "3" placeholder = "Enter Remarks Here.."> </textarea> <br> <br>

                    <center><button type="submit" class="btn btn-primary"> Submit </button> <button type = "reset" class = "btn btn-primary"> Reset </button></center> <br><br>
                </form>
            </div>
</div>
    </body>
    <script>
var _validFileExtensions = [".pdf"];    
function Validate(oForm) {
    var arrInputs = oForm.getElementsByTagName("input");
    for (var i = 0; i < arrInputs.length; i++) {
        var oInput = arrInputs[i];
        if (oInput.type == "file" || oInput.type == "text") {
            var sFileName = oInput.value;
            if (sFileName.length > 0) {
                var blnValid = false;
                for (var j = 0; j < _validFileExtensions.length; j++) {
                    var sCurExtension = _validFileExtensions[j];
                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                        blnValid = true;
                        break;
                    }
                }
                
                if (!blnValid) {
                    alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                    return false;
                }
            }
        }
    }
    alert("Are you sure you want to add this Report?");
    return true;
    
    $('.date-own').datepicker({
		minViewMode: 2,
		format: 'yyyy'
	});
}
</script>
</html>
