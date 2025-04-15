package main;

import java.util.Date;

public class Professor {
	private int no;
	private String name;
	private String id;
	private String position;
	private int salary;
	private int bonus;
	private int deptno;
	private Date hiredate;
	private String email;
	private String url;
	//getter ,setter, toString 구현하기
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getBonus() {
		return bonus;
	}
	public void setBonus(int bonus) {
		this.bonus = bonus;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Professor [no=" + no + ", name=" + name + ", id=" + id + ", position=" + position + ", salary=" + salary
				+ ", bonus=" + bonus + ", deptno=" + deptno + ", hiredate=" + hiredate + ", email=" + email + ", url="
				+ url + "]";
	}
	
	
	

}
