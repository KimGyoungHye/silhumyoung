package utility;

import java.text.SimpleDateFormat;
import java.util.Date;

import member.model.MemberBean;

public class AgeAndGender {
   
   public int calculateAge(MemberBean memberBean) {
      
      SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
      String today=sdf.format(new Date()); 
      
      int today_year=Integer.parseInt(today.substring(0,4));
      int today_month=Integer.parseInt(today.substring(4,6));
      int today_day=Integer.parseInt(today.substring(6));
      
      String regi_num1 = String.valueOf(memberBean.getRegi_number1());
      String regi_num2 = String.valueOf(memberBean.getRegi_number2());
      if(regi_num1.length()<6) {
          while(regi_num1.length()!=6) {
             regi_num1 = "0"+regi_num1;
          }
       }
      int regi_year=Integer.parseInt(regi_num1.substring(0,2));
      int regi_month=Integer.parseInt(regi_num1.substring(2,4));
      int regi_day=Integer.parseInt(regi_num1.substring(4,6));
      
      if(regi_num2.charAt(0)=='1' || regi_num2.charAt(0)=='2') { 
         regi_year+=1900;
      }
      else if(regi_num2.charAt(0)=='3' || regi_num2.charAt(0)=='4') { 
         regi_year+=2000;
      }
      
      int manAge=today_year-regi_year;
      if(regi_month>today_month) {
         manAge=manAge-1;
      }
      else if(regi_month==today_month) {
         if(regi_day>today_day) {
            manAge=manAge-1;
         }
      }
      return manAge;
   }// calculateAge
   
   
   public String whatIsGender(MemberBean memberBean) {
      String gender=null;
      String regi_num2=String.valueOf(memberBean.getRegi_number2());
      
      System.out.println("getRegi_number2 : "+memberBean.getRegi_number2());
      
      if(regi_num2.charAt(0)=='1' || regi_num2.charAt(0)=='3') { //ï¿½ê¶“ï¿½ì˜„
         gender="³²ÀÚ";
      }
      else if(regi_num2.charAt(0)=='2' || regi_num2.charAt(0)=='4') { //ï¿½ë¿¬ï¿½ì˜„
         gender="¿©ÀÚ";
      }
      
      System.out.println("gender : "+gender);

      return gender;
   }//whatIsGender
}