package board.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	private int bnum;
		
	@NotBlank(message="제목을 입력하세요")
	private String btitle;
	
	@NotBlank(message="내용을 입력하세요")
	private String bcontents;
	private String bimage;
	private int breadcount;
	private String bdate;
	
	@NotBlank(message="고정여부를 선택하세요")
	private String fix;
	private MultipartFile upload;
		
	private String filename;

	public BoardBean() {
		super();
	}

	public BoardBean(int bnum, String btitle, String bcontents, String bimage, int breadcount, String bdate,
			String fix, MultipartFile upload) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bimage = bimage;
		this.breadcount = breadcount;
		this.bdate = bdate;
		this.fix = fix;
		this.upload = upload;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getBimage() {
		return bimage;
	}

	public void setBimage(String bimage) {
		this.bimage = bimage;
	}

	public int getBreadcount() {
		return breadcount;
	}

	public void setBreadcount(int breadcount) {
		this.breadcount = breadcount;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getFix() {
		return fix;
	}

	public void setFix(String fix) {
		this.fix = fix;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		bimage=upload.getOriginalFilename();
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
		
	
}
