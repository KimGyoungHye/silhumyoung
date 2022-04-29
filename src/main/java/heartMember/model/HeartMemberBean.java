package heartMember.model;

public class HeartMemberBean {
	private String insuname;
	private String mid;
	private String name;
	private int phone1;
	private int phone2;
	private int phone3;
	private String email1;
	private String email2;
	
	
	public HeartMemberBean() {
		super();
	}
	
	public HeartMemberBean(String insuname, String mid, String name, int phone1, int phone2, int phone3, String email1,
			String email2) {
		super();
		this.insuname = insuname;
		this.mid = mid;
		this.name = name;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email1 = email1;
		this.email2 = email2;
	}

	public String getInsuname() {
		return insuname;
	}

	public void setInsuname(String insuname) {
		this.insuname = insuname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhone1() {
		return phone1;
	}

	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}

	public int getPhone2() {
		return phone2;
	}

	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}

	public int getPhone3() {
		return phone3;
	}

	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	
}
