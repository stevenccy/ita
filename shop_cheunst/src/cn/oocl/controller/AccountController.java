package cn.oocl.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.oocl.model.Account;
import cn.oocl.service.impl.AccountServiceImpl;

@Controller
@RequestMapping("/AccountController")
public class AccountController extends BaseController{

	
	@RequestMapping("/login")
	public String login(Account account) {
		request.getSession().setAttribute("user", accountService.login(account));	
		return "redirect:/admin/admin_query.jsp"; // no need project name
	}
	
}
