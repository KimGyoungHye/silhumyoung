package bohum.model;

import org.springframework.web.multipart.MultipartFile;

public class BohumBean {
	private int insu;
	private String insucompany;
	private String insuname;
	private String category;
	private String insutype;
	private String insuprice;
	private String insuage;
	private String insuper;
	private String payper;
	private String paycyc;
	private String maincont;
	private String spccont;
	private MultipartFile image;
	private String link;
	private String image2;
	
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
		insuprice = image.getOriginalFilename();
	}
	
	public int getInsu() {
		return insu;
	}
	public void setInsu(int insu) {
		this.insu = insu;
	}
	public String getInsucompany() {
		return insucompany;
	}
	public void setInsucompany(String insucompany) {
		this.insucompany = insucompany;
	}
	public String getInsuname() {
		return insuname;
	}
	public void setInsuname(String insuname) {
		this.insuname = insuname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getInsutype() {
		return insutype;
	}
	public void setInsutype(String insutype) {
		this.insutype = insutype;
	}
	public String getInsuprice() {
		return insuprice;
	}
	public void setInsuprice(String insuprice) {
		this.insuprice = insuprice;
	}
	public String getInsuage() {
		return insuage;
	}
	public void setInsuage(String insuage) {
		this.insuage = insuage;
	}
	public String getInsuper() {
		return insuper;
	}
	public void setInsuper(String insuper) {
		this.insuper = insuper;
	}
	public String getPayper() {
		return payper;
	}
	public void setPayper(String payper) {
		this.payper = payper;
	}
	public String getPaycyc() {
		return paycyc;
	}
	public void setPaycyc(String paycyc) {
		this.paycyc = paycyc;
	}
	public String getMaincont() {
		return maincont;
	}
	public void setMaincont(String maincont) {
		this.maincont = maincont;
	}
	public String getSpccont() {
		return spccont;
	}
	public void setSpccont(String spccont) {
		this.spccont = spccont;
	}

}
