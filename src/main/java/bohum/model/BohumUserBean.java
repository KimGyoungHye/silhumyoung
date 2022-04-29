package bohum.model;

import java.util.List;

import company.model.CompanyBean;

public class BohumUserBean {
	private int age;
	private String gender;
	private String disease;
	private int salary;
	private String whatColumn;
	private String keyword;
	public BohumUserBean() {
		super();
	}
	public BohumUserBean(int age, String gender, String disease, int salary, String whatColumn, String keyword) {
		super();
		this.age = age;
		this.gender = gender;
		this.disease = disease;
		this.salary = salary;
		this.whatColumn = whatColumn;
		this.keyword = keyword;
	}

	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getWhatColumn() {
		return whatColumn;
	}
	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
