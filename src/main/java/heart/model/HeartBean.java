package heart.model;

public class HeartBean {
	private String mid;
	private int insu_num;
	private String rowcheck;
	
	public HeartBean() {
		super();
	}

	public HeartBean(String mid, int insu_num) {
		super();
		this.mid = mid;
		this.insu_num = insu_num;
	}
	
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getInsu_num() {
		return insu_num;
	}

	public void setInsu_num(int insu_num) {
		this.insu_num = insu_num;
	}

	public String getRowcheck() {
		return rowcheck;
	}

	public void setRowcheck(String rowcheck) {
		this.rowcheck = rowcheck;
	}
	
}
