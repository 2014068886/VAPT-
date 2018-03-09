<%-- 
    Document   : PasswordLength
    Created on : Oct 9, 2017, 4:07:45 PM
    Author     : JMB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel = "stylesheet" href = "css/bootstrap.min.css">
        <script src = "js/jquery.js"> </script>
        <script src = "js/bootstrap.min.js"> </script>
        <title>Password Update</title>
    </head>
    <style>
        label {
            font-family: "garamond";
            font-size: 13pt;
        }
    </style>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String maxLength = request.getParameter("maxLength");
            String minLength = request.getParameter("minLength");
        %>
    <center> <br>
        <form action="updatePass.html" method="POST">
            <table>
                <tr>
                    <th>  <label> New Password: </label> </th>
                    <td>  <input type="password" name="newPass" id="newPass" required> </td>
                </tr>
                <tr>
                    <th>  <label> Confirm Password: </label> </th>
                    <td>  <input type="password" name="confirmPass" id="confirmPass" required> </td>
                </tr>
                <tr>
                    <td>  <input type="hidden" name="username" value="<%=username%>"> </td>
                </tr>    
            </table>
            <br> <input type="submit" value="SUBMIT" class="btn btn-success">
        </form>
    </center>
    </body>
</html>
