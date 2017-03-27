<%@page import="myapp.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tasks</title>

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
          <a class="navbar-brand" href="#">Task To Do!</a>
          <span class="navbar-brand" >Welcome! <%=((UserHibernate)session.getAttribute("current_user")).getName()%></span>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
           
            <li><a href="EnterTasks.jsp">Add Task</a></li>
            <li><a href="index.jsp">Log-out</a></li>
          </ul>
        </div>
      </div>
    </nav>

<div class="container-fluid">

<div class='table-responsive'>
	<table class='table table-striped'>
		<tr>
			<th>task Name</th>
			<th>delete</th>
			<th>update</th>
		</tr>
<%
UserHibernate user=(UserHibernate)session.getAttribute("current_user");

if(user==null){
	response.sendRedirect("EnterUser.jsp");
	return;
}

HibernateToDoListDAO hibernateToDoListDAO= HibernateToDoListDAO.getInstance();
Set<Task> tasks = hibernateToDoListDAO.getTasks(user.getId());
Iterator<Task> iterator = tasks.iterator();
while(iterator.hasNext()){
	Task task = iterator.next();

	out.println("<tr>");
	out.println("<td>"+task.getTask()+"</td>");
	out.println("<td><a href='DeleteTask.jsp?task_id="+task.getId()+"'>delete</a></td>");
	out.println("<td><a href='UpdateTask.jsp?task_id="+task.getId()+"'>update</a></td>");
	out.println("</tr>");	
}
%>
		</table>
	</div>
</div>
</body>
</html>