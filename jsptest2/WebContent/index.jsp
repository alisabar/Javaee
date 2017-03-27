<%@page import="myapp.*"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Sign-up new user</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8"> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="css/signin.css" rel="stylesheet">


</head>
<body>


<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Task To Do!</a>
          
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           
            <li><a href="LogIn.jsp">Login</a></li>
            <li><a href="EnterUser.jsp">Register</a></li>
          </ul>
        </div>
      </div>
    </nav>




<div class="container">
	<h1>Task Todo</h1>
	<p>Welcome to Task To do , the place to do any task!</p>
	
	<h3>New to the site? <a href="EnterUser.jsp">Create new account now!</a> </h3>
		
	<h3>Already registered? <a href="LogIn.jsp">LogIn</a> </h3>

</div>

</body>
</html>
