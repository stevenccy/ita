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
	public String save(String name,String address,String phone) {
		Order order = (Order)session.getAttribute("order");
		order.setAddress(address);
		order.setName(name);
		order.setPhone(phone);
		// 购物车与购物项目会级联入库
		orderService.save(order);
		session.setAttribute("order", new Order());
//		session.removeAttribute("order");
		return "redirect:/bank.jsp"; // 无论转发还是重定向都不需要工程名
	}
}
