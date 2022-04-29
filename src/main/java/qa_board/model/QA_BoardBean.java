package qa_board.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class QA_BoardBean {
   private int no;
   @NotBlank(message="카테고리를 선택하세요")
   private String category;   
   @NotBlank(message="제목을 입력하세요")
   private String title;
   @NotBlank
   private String writer;
   @NotBlank(message="비밀번호를 입력하세요")
   private String password;
   @NotBlank(message="보험회사를 선택하세요")
   private String company;
   @NotBlank(message="내용을 입력하세요")
   private String content;
   private String image;
   private int readcount;
   private String reg_date;
   private int ref ;
   private int re_step ;
   private int re_level ;
   private String ip;
   private MultipartFile upload;
   private String imageFlag;
   private String filename;


   public QA_BoardBean() {
      super();
   }
   public QA_BoardBean(int no, String category, String title, String writer, String password, String company,
         String content, String image, int readcount, String reg_date, int ref, int re_step, int re_level,
         String ip) {
      super();
      this.no = no;
      this.category = category;
      this.title = title;
      this.writer = writer;
      this.password = password;
      this.company = company;
      this.content = content;
      this.image = image;
      this.readcount = readcount;
      this.reg_date = reg_date;
      this.ref = ref;
      this.re_step = re_step;
      this.re_level = re_level;
      this.ip = ip;
   }
   public int getNo() {
      return no;
   }
   public void setNo(int no) {
      this.no = no;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getCompany() {
      return company;
   }
   public void setCompany(String company) {
      this.company = company;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   public int getReadcount() {
      return readcount;
   }
   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public int getRef() {
      return ref;
   }
   public void setRef(int ref) {
      this.ref = ref;
   }
   public int getRe_step() {
      return re_step;
   }
   public void setRe_step(int re_step) {
      this.re_step = re_step;
   }
   public int getRe_level() {
      return re_level;
   }
   public void setRe_level(int re_level) {
      this.re_level = re_level;
   }
   public String getIp() {
      return ip;
   }
   public void setIp(String ip) {
      this.ip = ip;
   }
   public MultipartFile getUpload() {
      return upload;
   }
   public void setUpload(MultipartFile upload) {
      this.upload = upload;
      setImage(upload.getOriginalFilename());
   }
   public String getImageFlag() {
      return imageFlag;
   }
   public void setImageFlag(String imageFlag) {
      this.imageFlag = imageFlag;
   }
   
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   
   
}