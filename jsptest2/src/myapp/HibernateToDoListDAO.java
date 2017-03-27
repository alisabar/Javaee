package myapp;
import javax.persistence.Entity;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
//import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.HibernateException;
import org.hibernate.Query;
//import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateToDoListDAO implements IToDoListDAO{
	

	private static HibernateToDoListDAO instance=null;
	private static Object instancelock=new Object();
	public static HibernateToDoListDAO getInstance(){
		if(instance==null){
			synchronized(instancelock){
				if(instance==null){
					instance= new HibernateToDoListDAO();
				}
			}
		}
		return instance;
	}
	private HibernateToDoListDAO(){}
	 public void insertTask(String task, Integer id){
		 
		 	SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			session.beginTransaction();
			Task t1= new Task(task);
			UserHibernate user= (UserHibernate)session.get(UserHibernate.class, id);
			Set<Task> tasks = user.getTasks();
			if(tasks==null)
			{
				tasks=new HashSet<Task>();
			}
			
			tasks.add(t1);
			user.setTasks(tasks);
			session.saveOrUpdate(user);
			session.getTransaction().commit();
			session.close();
			
	 }
	 public String getTaskById(Integer taskId)
	 {
		 SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			Task task= (Task)session.get(Task.class, taskId);
			session.close();
		 return task.getTask();
		 
	 }
	public UserHibernate searchUser(String username,String password){
		 SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			
			String hql = "FROM UserHibernate  WHERE username ='"+username+"' and password='"+password+"'";
			Query query = session.createQuery(hql);
			List results = query.list();
			UserHibernate user=null;
			if(results!=null && results.size()>0){
				user=(UserHibernate)results.get(0);
				return user;
				}
			else{
				return null;
			}
	}
	 public void updateTask(Integer taskId, String task_val , Integer userId){
		 SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			session.beginTransaction();
			//UserHibernate user= (UserHibernate)session.get(UserHibernate.class, userId);
			Task task= (Task)session.get(Task.class, taskId);
			task.setTask(task_val);
			session.saveOrUpdate(task);
			session.getTransaction().commit();
			session.close();
			
	 }
	 public void deleteTask(Integer taskId , Integer userId){
		 
		 	SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			session.beginTransaction();
			//Task t1= new Task(task);
			UserHibernate user= (UserHibernate)session.get(UserHibernate.class, userId);
			Set<Task> tasks = user.getTasks();
			
			if(tasks==null)
			{
				session.close();
				return;
				
			}
			
			for (Iterator<Task> iter = tasks.iterator(); iter.hasNext(); ) {
			    Task task = iter.next();
			    if (task.getId()==taskId) {
			        iter.remove();
			    }
			}

			user.setTasks(tasks);
			session.saveOrUpdate(user);
			Task task= (Task)session.get(Task.class, taskId);
			
			session.delete(task);
			session.getTransaction().commit();
			session.close();
			
	 }
	 
	 public Set<Task> getTasks(Integer userId){
		 
		 	SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			UserHibernate user= getUser(session,userId);
			session.close();
			return user.getTasks();
	 }
	 
	 private UserHibernate getUser(Session session, Integer userId) {
		 return (UserHibernate)session.get(UserHibernate.class, userId);
	}
	public UserHibernate insertUser(String user_name, String password)
	 {
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
			
			Session session = factory.openSession();
			session.beginTransaction();
			String hql = "FROM UserHibernate  WHERE username ='"+user_name+"'";
			Query query = session.createQuery(hql);
			List results = query.list();
			UserHibernate user=null;
			if(results!=null && results.size()>0){
				
					session.getTransaction().commit();
					session.close();
					return null;
				
			}
			UserHibernate p1 = new UserHibernate(user_name, password);
			session.save(p1);
			session.getTransaction().commit();
			session.close();
			return p1;
			
			
	 }
	
	
}
