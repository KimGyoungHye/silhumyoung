package utility;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Responsing {
	private HttpServletResponse response;
	private PrintWriter out;
	
	public Responsing(HttpServletResponse response) {
		super();
		this.response = response;
	}
	public void useAlert(String alertContent) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<script>alert('"+alertContent+"');</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void useRedirect(String redirectUrl) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<script>location.href='"+redirectUrl+"';</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void useHistory(int historyNum) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			out = response.getWriter();
			out.println("<script>history.go("+historyNum+");</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
