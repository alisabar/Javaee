package myapp;

import java.util.LinkedList;
import java.util.Set;

import javax.persistence.Entity;

//import org.hibernate.mapping.Set;

import javax.persistence.*;


@Entity
@Table(name="USER")
@Access(AccessType.FIELD)
public class UserHibernate {
@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Task.class)
@JoinTable(name = "user_task", joinColumns = { @JoinColumn(name = "USER_ID") }, inverseJoinColumns = { @JoinColumn(name = "Task_ID") })
private Set<Task> tasks;
@Column(name = "USERNAME")
private String name;
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "USER_ID" , updatable=false, nullable=false)
private Integer id;
@Column(name = "PASSWORD")
private String password;

public UserHibernate()
{
}
public UserHibernate(String name, String pass)
{
this.name = name;
password=pass;
}


@Column(unique=true)
public String getName()
{
return name;
}
public String getPassword()
{
return password;
}
public void setPassword(String password)
{
this.password = password;
}
public void setName(String name)
{
this.name = name;
}
public int getId()
{
return id;
}

public void setTasks(Set<Task> tasks)
{
	this.tasks=tasks;
}

public Set<Task> getTasks(){
	return tasks;
}
public void setId(Integer id)
{
this.id = id;
}
public String toString()
{
return "[" + id + ", " + name + ", " + password + "]";
}
}