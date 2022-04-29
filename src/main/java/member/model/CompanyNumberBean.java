package member.model;

public class CompanyNumberBean {
	private int cregi_num;
	private String com_name;
	private int start_dt;
	
	public CompanyNumberBean() {
		super();
	}
	public CompanyNumberBean(int cregi_num, String com_name, int start_dt) {
		super();
		this.cregi_num = cregi_num;
		this.com_name = com_name;
		this.start_dt = start_dt;
	}
	public int getCregi_num() {
		return cregi_num;
	}
	public void setCregi_num(int cregi_num) {
		this.cregi_num = cregi_num;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public int getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(int start_dt) {
		this.start_dt = start_dt;
	}
}
