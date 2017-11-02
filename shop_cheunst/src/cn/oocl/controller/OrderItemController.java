package cn.oocl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.model.Product;

@Controller
@RequestMapping("/OrderItemController")
public class OrderItemController extends BaseController{

	@RequestMapping("/updateItemNum")
	@ResponseBody  // 需要加载json包,和在xml中配置
	public Object updateItemNum(String pid, int num) {
		Order order = (Order) session.getAttribute("order");
		orderItemService.updateItemNum(pid, num, order);
		// 更新购物项之后需要重新计算总价格
		order.setTotal(orderService.cluTotal(order));
		return order.getTotal();
	}

	@RequestMapping("/removeOrderItem")
	@ResponseBody
	public Object removeOrderItem(String pid) {
		Order order = (Order) session.getAttribute("order");
		orderItemService.removeOrderItem(pid, order);
		// 更新购物项之后需要重新计算总价格
		order.setTotal(orderService.cluTotal(order));
		return order.getTotal();
	}

	@RequestMapping("/addOrderItem")
	public String addOrderItem(String id) {
		Product product = productService.getByID(id);
		OrderItem newItem = new OrderItem();
		newItem.setName(product.getName());
		newItem.setNumber(1);
		newItem.setPrice(product.getPrice());
		newItem.setProduct(product); // 在判斷商品是否重複時需要商品的ID
		// 3:HttpSessionListener 在創建session時默認創建購物車
		Order order = (Order) session.getAttribute("order");
		// 4: 此處應該編寫一個方法來判斷當前OraderItem在購物車中是否已存在
		orderItemService.addOrderItem(newItem, order);
		// 5: 計算總價格並且賦值給total
		order.setTotal(orderService.cluTotal(order));
		// 5: 跳轉到購物車頁面,顯示購物數據
		return "redirect:/checkout.jsp";
	}
}
