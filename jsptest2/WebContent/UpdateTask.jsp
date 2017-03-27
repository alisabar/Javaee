<%@page import="myapp.*"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update task</title>

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

UserHibernate user=(UserHibernate)session.getAttribute("current_user");

if(user==null){
	response.sendRedirect("EnterUser.jsp");
	return;
}
Integer taskId = Integer.parseInt(request.getParameter("task_id"));

String task=request.getParameter("task");

if(task!=null){

	
HibernateToDoListDAO.getInstance().updateTask(taskId,task,user.getId());
response.sendRedirect("Tasks.jsp");
}
%>

<div class="container">
	<FORM METHOD="POST" ACTION="InsertToDB.jsp" class="form-signin">
	<h2 class="form-signin-heading">Update task</h2>
	
	<label for="inputTaskName" class="sr-only">Task Name</label>
    <input type="text" id="inputTaskName" class="form-control" placeholder="task name" name="task" value="<%=HibernateToDoListDAO.getInstance().getTaskById(taskId) %>" required autofocus>
    <INPUT TYPE=hidden NAME="task_id" value=<%=taskId %>>
    
    <button class="btn btn-lg btn-primary btn-block" type="submit">Update this task!</button>
	
	</FORM>
	
</div>

</body>
</html>