package homeAdmin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomAdminGraphController {
	private final String command = "/graph.ha";
	private String getPage = "/graph";

		@RequestMapping(value=command)
		public String doAction() {

			return getPage;
		}

}
