package qa_board.model;

public class QA_UserStateAndCategory {
   
   private String userState;
   private String id;
   private String company;
   private String category;
   
   public QA_UserStateAndCategory() {
      super();
   }

   public QA_UserStateAndCategory(String userState, String id, String company, String category) {
      super();
      this.userState = userState;
      this.id = id;
      this.company = company;
      this.category = category;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getCompany() {
      return company;
   }

   public void setCompany(String company) {
      this.company = company;
   }

   public String getUserState() {
      return userState;
   }

   public void setUserState(String userState) {
      this.userState = userState;
   }

   public String getCategory() {
      return category;
   }

   public void setCategory(String category) {
      this.category = category;
   }
   
   
   
   
   
   
}