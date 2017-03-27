package myapp;

import java.util.Set;

import org.hibernate.Session;

public interface IToDoListDAO {
	public void insertTask(String task, Integer id);
	public String getTaskById(Integer taskId);
	public UserHibernate searchUser(String username,String password);
	public void updateTask(Integer taskId, String task_val , Integer userId);
	public void deleteTask(Integer taskId , Integer userId);
	public Set<Task> getTasks(Integer userId);
	public UserHibernate insertUser(String user_name, String password);
}
