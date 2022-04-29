package graph.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import graph.model.GraphBean;
import graph.model.GraphDao;
import graph.model.GraphJsonBean;
import member.model.MemberDao;

@Controller
public class GraphDataGenderController {
	private final String command = "gender.gp";

	@Autowired
	GraphDao graphDao;

	@RequestMapping(value=command)
	public void doAction(
			HttpServletResponse response) {
		System.out.println(command);
		
		List<GraphBean> genderArr = new ArrayList<GraphBean>();
		
		genderArr = graphDao.getGraphDataGender();
		
		GraphJsonBean graphJsonBean = new GraphJsonBean(genderArr);
		
		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();
		json.put("myLabels", graphJsonBean.getMyLabels());
		json.put("myData", graphJsonBean.getMyData());
		jsonArray.add(json);
		
		try {
			PrintWriter out = response.getWriter();
			response.setContentType("application/json; charset=utf-8");
			System.out.println(jsonArray);
			out.print(jsonArray);
			out.flush();
			out.close();
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


}
