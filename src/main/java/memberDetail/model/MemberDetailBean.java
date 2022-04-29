package memberDetail.model;

import org.hibernate.validator.constraints.NotBlank;

public class MemberDetailBean {
	private int num;
	private int age;
	@NotBlank
	private String gender;
	@NotBlank
	private String job;
	private int salary;
	@NotBlank
	private String marriage;
	private int height;
	private int weight;
	private String disease;
	@NotBlank
	private String family_history;
	public MemberDetailBean() {
		super();
	}
	public MemberDetailBean(int num, int age, String gender, String job, int salary, String marriage, int height,
			int weight, String disease, String family_history) {
		super();
		this.num = num;
		this.age = age;
		this.gender = gender;
		this.job = job;
		this.salary = salary;
		this.marriage = marriage;
		this.height = height;
		this.weight = weight;
		this.disease = disease;
		this.family_history = family_history;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public String getFamily_history() {
		return family_history;
	}
	public void setFamily_history(String family_history) {
		this.family_history = family_history;
	}
	
}
