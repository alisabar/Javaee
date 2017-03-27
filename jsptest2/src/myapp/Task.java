package myapp;

import java.util.LinkedList;

import javax.persistence.*;

@Entity
@Table(name="Task")
public class Task
{
	
	private int id;
	private String task;
	
	
	public Task()
	{
		
	}
	
	Task( String taskVal)
	{
		
		task = taskVal;
	}
	@Id
	@GeneratedValue
	 @Column(name = "TASK_ID")
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	
	public String getTask()
	{
		return task;
	}
	@Column(unique=true)
	public void setTask(String name)
	{
		this.task = name;
	}
	public String toString()
	{
	return "[" + id + ", " + task + "]";
	}
}