package company.model;

import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class CompanyBean {

	private int cnum;
	
	@NotBlank(message="회사명은 필수로 입력해야 합니다")
	private String cname;
	
	private String cimage;
	private String cinsurance;
	private String cadmin;
	private MultipartFile upload;
	private String image2;
	private String clink;
	
	public String getClink() {
		return clink;
	}
	public void setClink(String clink) {
		this.clink = clink;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	private String cregi_num;

	@Pattern( regexp = "^\\d{3}$", message="사업자 등록 번호는 첫번째 칸은 3자리 숫자 입력")
	private String cregi_num1;
	
	@Pattern( regexp = "^\\d{2}$", message="사업자 등록 번호는  두번째 칸은 2자리 숫자 입력")
	private String cregi_num2;
	
	@Pattern( regexp = "^\\d{5}$", message="사업자 등록 번호는  세번째 칸은 5자리 숫자 입력")
	private String cregi_num3;
	
	public CompanyBean() {
		super();
	}
	public CompanyBean(int cnum, String cname, String cimage, String cinsurance, String cadmin, String clink) {
		super();
		this.cnum = cnum;
		this.cname = cname;
		this.cimage = cimage;
		this.cinsurance = cinsurance;
		this.cadmin = cadmin;
		this.clink = clink;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCimage() {
		return cimage;
	}
	public void setCimage(String cimage) {
		this.cimage = cimage;
	}
	public String getCinsurance() {
		return cinsurance;
	}
	public void setCinsurance(String cinsurance) {
		this.cinsurance = cinsurance;
	}
	public String getCadmin() {
		return cadmin;
	}
	public void setCadmin(String cadmin) {
		this.cadmin = cadmin;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		cimage = upload.getOriginalFilename();
	}
	public String getCregi_num() {
		return cregi_num;
	}
	public void setCregi_num(String cregi_num) {
		this.cregi_num = cregi_num;
//		cregi_num=getCregi_num1()+getCregi_num2()+getCregi_num3();
	}
	public String getCregi_num1() {
		return cregi_num1;
	}
	public void setCregi_num1(String cregi_num1) {
		this.cregi_num1 = cregi_num1;
	}
	public String getCregi_num2() {
		return cregi_num2;
	}
	public void setCregi_num2(String cregi_num2) {
		this.cregi_num2 = cregi_num2;
	}
	public String getCregi_num3() {
		return cregi_num3;
	}
	public void setCregi_num3(String cregi_num3) {
		this.cregi_num3 = cregi_num3;
	}
	
}
