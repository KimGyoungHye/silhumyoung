package bohum.model;

public class BohumDataBean {
	private String basDt;		//YYYYMMDD ��������
	private String cmpyCd;		// ȸ���ڵ�
	private String cmpyNm;		// ȸ���
	private String ptrn;		//	����
	private String mog;			// �㺸
	private String prdNm;		// ��ǰ��
	private String age;			// ����
	private String mlInsRt;		// ���ں����
	private String fmlInsRt;	// ���ں����
	public BohumDataBean() {
		super();
	}
	public BohumDataBean(String basDt, String cmpyCd, String cmpyNm, String ptrn, String mog, String prdNm, String age,
			String mlInsRt, String fmlInsRt) {
		super();
		this.basDt = basDt;
		this.cmpyCd = cmpyCd;
		this.cmpyNm = cmpyNm;
		this.ptrn = ptrn;
		this.mog = mog;
		this.prdNm = prdNm;
		this.age = age;
		this.mlInsRt = mlInsRt;
		this.fmlInsRt = fmlInsRt;
	}
	public String getBasDt() {
		return basDt;
	}
	public void setBasDt(String basDt) {
		this.basDt = basDt;
	}
	public String getCmpyCd() {
		return cmpyCd;
	}
	public void setCmpyCd(String cmpyCd) {
		this.cmpyCd = cmpyCd;
	}
	public String getCmpyNm() {
		return cmpyNm;
	}
	public void setCmpyNm(String cmpyNm) {
		this.cmpyNm = cmpyNm;
	}
	public String getPtrn() {
		return ptrn;
	}
	public void setPtrn(String ptrn) {
		this.ptrn = ptrn;
	}
	public String getMog() {
		return mog;
	}
	public void setMog(String mog) {
		this.mog = mog;
	}
	public String getPrdNm() {
		return prdNm;
	}
	public void setPrdNm(String prdNm) {
		this.prdNm = prdNm;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getMlInsRt() {
		return mlInsRt;
	}
	public void setMlInsRt(String mlInsRt) {
		this.mlInsRt = mlInsRt;
	}
	public String getFmlInsRt() {
		return fmlInsRt;
	}
	public void setFmlInsRt(String fmlInsRt) {
		this.fmlInsRt = fmlInsRt;
	}
}

