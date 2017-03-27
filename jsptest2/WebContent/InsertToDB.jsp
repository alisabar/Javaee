<%@page import="myapp.UserHibernate"%>
<%@page import="myapp.HibernateToDoListDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>insert user to db</title>

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

String task=request.getParameter("task");
Integer taskId;
if(request.getParameter("task_id")!=null){
	 taskId = Integer.parseInt(request.getParameter("task_id"));
}
else{
	 taskId=0;
}
UserHibernate user=(UserHibernate)session.getAttribute("current_user");

if(user==null || task==null){
	response.sendRedirect("EnterUser.jsp");
	return;
}

HibernateToDoListDAO hibernateToDoListDAO= HibernateToDoListDAO.getInstance();
if(taskId==0){
	hibernateToDoListDAO.insertTask(task,user.getId());
}
else{
	hibernateToDoListDAO.updateTask(taskId,task,user.getId());
}
response.sendRedirect("Tasks.jsp");

%>
 

</body>
</html>