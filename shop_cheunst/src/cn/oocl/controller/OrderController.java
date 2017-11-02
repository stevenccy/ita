package cn.oocl.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.oocl.model.Order;
import cn.oocl.service.OrderService;

@Controller
@RequestMapping("/OrderController")
public class OrderController extends BaseController {

	
	
	@RequestMapping("/save")
	public String save(Order order) {
		orderService.save(order);
		
		return "redirect:/checkout.jsp"; // no need project name
	}
}
