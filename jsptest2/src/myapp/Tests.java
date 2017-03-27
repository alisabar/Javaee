package myapp;

import java.util.Date;

public class Tests {
	public static void main(String[] args)
	{
		HibernateToDoListDAO dao = HibernateToDoListDAO.getInstance();
		
		String userName="test_user"+System.currentTimeMillis();
		UserHibernate user = dao.insertUser(userName, "123");
		
		assert user!=null;
		assert user.getName().equals(userName);
		assert user.getPassword().equals("123");
		
		UserHibernate foundUser = dao.searchUser(userName, "123");
		
		assert foundUser!=null;
		assert foundUser.getName().equals(userName);
		assert foundUser.getPassword().equals("123");
		
		UserHibernate duplicate_user = dao.insertUser(userName, "1234");
		
		assert duplicate_user==null;
		
		dao.insertTask("testTask", user.getId());
		UserHibernate foundUser2 = dao.searchUser(userName, "123");
		
		assert foundUser2.getTasks()!=null;
		assert foundUser2.getTasks().size()>0;
		
		Task task = (Task)foundUser2.getTasks().toArray()[0];
		
		assert task.getTask().equals("testTask");
		
		dao.updateTask(task.getId(), "updated_task", user.getId());
		
		UserHibernate foundUser3 = dao.searchUser(userName, "123");
		Task task2 = (Task)foundUser3.getTasks().toArray()[0];
		
		assert task2.getTask().equals("updated_task");
		
	}
}
