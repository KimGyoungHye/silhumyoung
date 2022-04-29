package board.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardDao;
import utility.Responsing;

@Controller
public class BoardDeleteController {
	
	private final String command = "/delete.bd";
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping(command)
	public void doAction(
						@RequestParam("bnum") int bnum,
						@RequestParam("pageNumber") int pageNumber,
						@RequestParam(value="bimage", required=false) String bimage,
						HttpServletResponse response,
						HttpServletRequest request) {
		
		String uploadPath=servletContext.getRealPath("/resources"); // 업로드폴더 경로
		//System.out.println("왜 안보이는 거야");
		System.out.println("bimage:"+bimage);
		
		int cnt=boardDao.deleteArticle(bnum);
		
		Responsing responsing=new Responsing(response);
		if(cnt>0) {
			if(bimage!=null) {
				File file=new File(uploadPath+"\\"+bimage);
				file.delete();
			}
			responsing.useAlert("게시물을 삭제하였습니다");
			responsing.useRedirect("list.bd");
		}
		else {
			responsing.useAlert("게시물 삭제를 실패하였습니다");
			request.setAttribute("pageNumber",pageNumber);
			responsing.useHistory(-1);
		}
	}
}
