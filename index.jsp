<%-- 
    Document   : index
    Created on : Aug 16, 2017, 2:06:30 PM
    Author     : JMB
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
<link rel = "stylesheet" href = "css/bootstrap.min.css">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
</head>
<style>
body {
    background-size: cover;
    font-family: Montserrat;
}

/*.logo {
    width: 300px;
    height: 100px;
    margin: 35px auto;
} */

img {
    display: inline-block;
}

.login-block h1 {
    text-align: center;
    font-family: Microsoft JhengHei;
    font-weight: bolder;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 11px;
  	font-family: Microsoft JhengHei;
    padding: 0 20px 0 50px;
    outline: none;
}

.login-block input#username {
    background: #fff url('u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#username:focus {
    background: #fff url('u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#password {
    background: #fff url('Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#password:focus {
    background: #fff url('Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #a6c778;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #009900;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #73ad21;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #f32b08;
}

div.left{
    width:20%;
    float:left;
    padding: 0px;
    margin: 0px;
    border: 0px;
}

div.main{
    text-align: center;
    padding: 0;
    margin: 0;
    border: 0;   
}
  
.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 4px;
    /*border: 2px solid #009900; */
    margin: 0 auto;
}

div.submit button[type=submit]{
    font-family: Microsoft JhengHei;
    width: 100%;
    height: 40px;
    background: #009900;
    box-sizing: border-box;
    border-radius: 4px;
    border: 1px solid #73ad21;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 16px;
    outline: none;
    cursor: pointer;
    padding:0;
}

div.submit button[type=submit]:hover{
	opacity: 0.8;
	background: #005555;
}

div.submit button[type=submit]:active{
	opacity: 0.6;
}

#left {
    width:40%;
    float:left;
    padding-left:20%;
    margin: 0px;
    border: 0px;
}

#right {
    float:right;
    width: 40%;    
    padding: 0;
    margin: 0;
    border: 0;
}

img.lbp {
    width:260px;
    height:130px;
}

td.leftPane{
    width: 25%;
}

td.leftPane ul {
	list-style-image: none;
	list-style-position: outside;
	list-style-type: none;
	margin: 0;
	padding: 10px;
}

td.leftPane ul li {
	border-bottom: 1px solid #999999;
	line-height: 24px;
}

</style>
<script>
    function redirect(){
		window.location.href = "https://www.landbank.com/";
    }
</script>
<body>
<link href="css/materialize.min.css" type="text/css" rel="stylesheet">
<div class="section"></div>
    <main>
      <center>
        <sql:setDataSource var = "dbSource" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost:3306/landbank" user="root" password="12345" />

        <sql:query dataSource = "${dbSource}" var = "insert"> 
           select * from system_parameters 
        </sql:query>
           
        <div  class="z-depth-3 y-depth-3 x-depth-3 grey green-text lighten-4 row" style="display: inline-block; padding: 32px 48px 0px 48px; border: 1px; margin-top: 100px; solid #EEE;">
        <div class="section"></div>
        <form action = "Validate" id ="loginForm" name = "loginForm" class="login" method = "post"> 
        <div class="row">
          <div class="input-field col s12 center">
            <img src="Landbank.png" height="150" width="300">
          </div>
        </div>
            <div class='row'>
              <div class='input-field col s12'>
                <input type="text" name = "username" value="" id="username" placeholder="Username" required/>     
              </div>
            </div>
            <div class='row'>
              <div class='input-field col m12'>
                <input type="password" name = "password" id="password" placeholder="Password" required/>
              </div>
            </div>
            <br/>
            <center>
              <div class='row'>
                  <div class="submit">
                    <button style="margin-left:65px;"  type="submit" name='btn_login' class='col s6 buttons buttons-small white black-text  waves-effect z-depth-1 y-depth-1'>Login</button>
                  </div> 
              </div>
            </center>
        </form>
        </div>   
      </center>
    </main>
<!--<div class="container">
   
    <div class = "page-header col-md-12">
	<div id="custom-search-input">
            <div class="input-group col-md-4 pull-right">  
               <img style="float: right; width:200px; height:200px;" src="images\vapt.png" />
            </div>
            <div class="input-group col-md-6 pull-left">
                
            </div>
            <h2 align= "center"> <font face = "century gothic"> Users </font> </h2>
        </div>	
    </div> 
        
    <table class="table table-condensed">
        <tr>
            <td> <div id="header" class="header">
                 <div id="left" class="bgcol"> <img class="lbp" src = "Landbank.png"/> </div>  
            </td>
            <td>
                <div id="right" class="bgcol"> <img style="width:180px; height:180px;" src="images\vapt.png" /> </div>
                </div>
            </td>
        </tr>
        <tr style="padding-left:20%">
            <td class="leftPane">
                    <ul>
                        <li><a href="#"> What is VAPT?</a></li>				
                        <li><a href="#" onclick="redirect();">LANDBANK Website</a></li>
                    </ul>   
            </td>
            <td> 
                <div class="login-block"> <h1>Login</h1>
                 
                  
                    <input type="password" name = "password" placeholder="Password" id="password" required/>
            
                    <input type = "submit" value = "SUBMIT" >  
                 </form>
        
                 </div> 
            </td>       
        </tr>
        
    </table> -->
       
</div>
</body>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script type="text/javascript" src = "js/jquery.js"> </script>
<script type="text/javascript" src = "js/bootstrap.min.js"> </script>
<script type="text/javascript" src = "js/jquery-min.js"> </script>
</html>