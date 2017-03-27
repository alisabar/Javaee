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
<%

String username,password;

username=request.getParameter("username");
password=request.getParameter("password");

if (username!=null &&password!=null){	
	HibernateToDoListDAO user= HibernateToDoListDAO.getInstance();
	UserHibernate current_user=user.insertUser(username,password);
	if(current_user==null)
	{
		out.println("You are already registered.<a href='LogIn.jsp'>Click here to log in</a> ");
	}
	else{
	session.setAttribute("current_user",current_user);
	response.sendRedirect("EnterTasks.jsp");
	}
}
	
%>



<div class="container">
	<FORM METHOD="POST" ACTION="EnterUser.jsp" class="form-signin">
	<h2 class="form-signin-heading">Welcome! Sign Up :)</h2>
	
	<label for="inputUserName" class="sr-only">user name</label>
    <input type="text" id="inputUserName" class="form-control" placeholder="user name" name="username" required autofocus>
    
    <label for="inputPassword" class="sr-only">password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="*******" name="password" required autofocus>
	<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	
	</FORM>
	
	<h3>Already registered?<a href="LogIn.jsp">LogIn</a> </h3>

</div>

</body>
</html>
