package bohum.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bohum.model.BohumDao;
import bohum.model.BohumDataBean;
import bohum.model.BohumDetail;
import member.model.MemberBean;
import utility.Responsing;


@Controller
public class BohumDataDetailController {
	private final String command = "/bohumDataDetail.bh";
	//이름 꼭 바꾸기!!
	private String getPage = "/bohumDetailInfo";
	
	@Autowired
	BohumDao bohumDao;
	
	@RequestMapping(value=command)
	public String doAction(BohumDataBean bohumTestBean,
			HttpServletRequest request,
			HttpSession session) {
		//cmpyNm=${test.cmpyNm }&ptrn=${test.ptrn }&prdNm=${test.prdNm }
		System.out.println("(bohumTestBean.getCmpyNm()"+bohumTestBean.getCmpyNm());
		List<BohumDataBean> bohumDataDetailInfoArr = bohumDao.selectBohumDetail(bohumTestBean);
		request.setAttribute("bohumDataDetailInfoArr",bohumDataDetailInfoArr);
		
		System.out.println("bohumTestBean.getAge()"+bohumTestBean.getAge());
		
		List<BohumDataBean> avgByAgeArr = bohumDao.getAvgByAge(Integer.parseInt(bohumTestBean.getAge()));
		System.out.println(avgByAgeArr.size());
		session.setAttribute("avgByAgeArr",avgByAgeArr);
		
		return getPage;
	
	}
}
