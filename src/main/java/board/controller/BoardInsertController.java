package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.model.BoardBean;
import board.model.BoardDao;
import utility.Responsing;

@Controller
public class BoardInsertController {
	
	private final String command = "/insert.bd";
	private String getPage = "/b_insertForm";
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
								@Valid BoardBean boardBean,
								BindingResult result,
								HttpServletResponse response) {
		
		ModelAndView mav=new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		String uploadPath=servletContext.getRealPath("/resources/board"); //서버의 물리적 경로
		MultipartFile mf=boardBean.getUpload(); //객체 얻기
		
		System.out.println("업로드 파일 이름:"+boardBean.getBimage());
		
		Responsing responsing=new Responsing(response);
		
		int cnt=boardDao.insertArticle(boardBean);
		if(cnt>0) {
			if(!(boardBean.getBimage()==null||boardBean.getBimage().equals(""))) {//파일을 첨부한 경우
				File file=new File(uploadPath+"\\"+boardBean.getBimage());
				try {
					mf.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			responsing.useAlert("게시물을 작성하였습니다");
			responsing.useRedirect("list.bd");
		}//if
		else {
			responsing.useAlert("게시물 작성을 실패하였습니다");
			responsing.useHistory(-1);
		}//else
		return null;
	}
	
}
