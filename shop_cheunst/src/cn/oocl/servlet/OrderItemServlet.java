package cn.oocl.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.model.Product;
import cn.oocl.service.OrderItemServiceImpl;
import cn.oocl.service.OrderService;
import cn.oocl.service.ProductService;

/**
 * Servlet implementation class OrderItemServlet
 */
@WebServlet("/OrderItemServlet")
public class OrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductService productService = new ProductService();

	private OrderService orderService = new OrderService();
	
	private OrderItemServiceImpl orderItemService = new OrderItemServiceImpl();

	public OrderItemServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 1:根據product.id獲取product對象
		String id = request.getParameter("id");
		Product product = productService.getById(id);
		// 2:把product對象的信息,添加到orderItem中
		OrderItem item = new OrderItem();
		item.setName(product.getName());
		item.setNumber(1);
		item.setPrice(product.getPrice().doubleValue());
		item.setProduct(product); // 在判斷商品是否重複時需要商品的ID
		// 3:HttpSessionListener 在創建session時默認創建購物車
		Order order = (Order) session.getAttribute("order");
		// 4: 此處應該編寫一個方法來判斷當前OraderItem在購物車中是否已存在
		orderItemService.addOrderItem(item, order);
		// 5: 計算總價格並且賦值給total
		order.setTotal(orderService.cluTotal(order));
		// 5: 跳轉到購物車頁面,顯示購物數據
		response.sendRedirect(request.getContextPath() + "/checkout.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

}