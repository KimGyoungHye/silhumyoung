package member.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	
	private final String must_input = " 필수 입력입니다.";
	@NotBlank(message="id는" + must_input)
	private String id;
	@NotBlank(message="pw는" + must_input)
	private String password;
	@NotBlank(message="이름은" + must_input)
	private String name;
	@Pattern(regexp = "^[0-9]{6}$", message="숫자만 입력해주세요.")
	@NotBlank(message="주민번호 앞자리는" + must_input)
	@Length(min=6, max=6, message="주민번호 앞자리는 6자리 입니다.")
	private String regi_number1 ;
	@Pattern(regexp = "^[0-9]{7}$", message="숫자만 입력해주세요.")
	@Length(min=7, max=7, message="주민번호 뒷자리는 7자리 입니다.")
	@NotBlank(message="주민번호 뒷자리는" + must_input)
	private String regi_number2 ;
	//@NotBlank(message="전화번호는"+ must_input)
	private int phone1 ;
	private int phone2 ;
	private int phone3 ;
	@NotBlank(message="email은" + must_input)
	private String email1 ;
	private String email2 ;
	private String userState;
	private int userDetail;
	private String companyInfo;
	private String cname;
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(String id, String password, String name, String regi_number1, String regi_number2, int phone1,
			int phone2, int phone3, String email1, String email2, String userState, int userDetail,
			String companyInfo, String cname) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.regi_number1 = regi_number1;
		this.regi_number2 = regi_number2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.email1 = email1;
		this.email2 = email2;
		this.userState = userState;
		this.userDetail = userDetail;
		this.companyInfo = companyInfo;
		this.cname = cname;
	}


	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegi_number1() {
		return regi_number1;
	}

	public void setRegi_number1(String regi_number1) {
		this.regi_number1 = regi_number1;
	}

	public String getRegi_number2() {
		return regi_number2;
	}

	public void setRegi_number2(String regi_number2) {
		this.regi_number2 = regi_number2;
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

	public String getUserState() {
		return userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}

	public int getUserDetail() {
		return userDetail;
	}

	public void setUserDetail(int userDetail) {
		this.userDetail = userDetail;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}


	
}