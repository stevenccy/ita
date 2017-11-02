package cn.oocl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.service.OrderService;
import cn.oocl.service.ProductService;
import cn.oocl.service.impl.OrderItemServiceImpl;
import cn.oocl.utils.CookieUtils;

/**
 * Servlet implementation class OrderItemServlet
 */
@WebServlet("/OrderItemServlet")
public class OrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource
	private ProductService productServiceImpl;
	// private ProductDaoImpl productDao = ;

	@Resource
	private OrderService orderServiceImpl;

	@Resource
	private OrderItemServiceImpl orderItemServiceImpl;

	public OrderItemServlet() {
		super();

	}

	protected void removeOrderItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String pid = request.getParameter("id");
		Order order = (Order) request.getSession().getAttribute("order");
		orderItemServiceImpl.removeOrderItem(pid, order);
		order.setTotal(orderServiceImpl.cluTotal(order));
		PrintWriter out = response.getWriter();
		out.write(order.getTotal() + "");
		out.close();
	}

	protected void updateOrderItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Order order = (Order) request.getSession().getAttribute("order");
		String pid = request.getParameter("pid");
		int num = Integer.parseInt(request.getParameter("num"));

		orderItemServiceImpl.updateItemNum(pid, num, order);
		// 更新购物项之后需要重新计算总价格
		order.setTotal(orderServiceImpl.cluTotal(order));
		// ajax请求,返回的是数据而非页面
		PrintWriter out = response.getWriter();
		out.write(order.getTotal() + "");
		out.close();

	}

	protected void addOrderItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Gson gson = new Gson();
		Order order = null;
		Cookie cookie = CookieUtils.getCookie(request, "order");

		if (cookie == null) {
			// New Order
			order = new Order();
			cookie = new Cookie("order", gson.toJson(order));
		} else {
			order = gson.fromJson(cookie.getValue(), Order.class);
		}

		// 1:根據product.id獲取product對象
		String id = request.getParameter("id");
		// Product product = productService.getById(id);
		// 2:把product對象的信息,添加到orderItem中
		OrderItem item = new OrderItem();
		// item.setName(product.getName());
		// item.setNumber(1);
		// item.setPrice(product.getPrice());
		// item.setProduct(product); // 在判斷商品是否重複時需要商品的ID

		// 4: 此處應該編寫一個方法來判斷當前OraderItem在購物車中是否已存在
		orderItemServiceImpl.addOrderItem(item, order);
		// 5: 計算總價格並且賦值給total
		order.setTotal(orderServiceImpl.cluTotal(order));
		// 5: 跳轉到購物車頁面,顯示購物數據
		cookie.setValue(gson.toJson(order));
		cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
		response.addCookie(cookie);

		response.sendRedirect(request.getContextPath() + "/checkout.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");

		try {
			Method declaredMethod = this.getClass().getDeclaredMethod(type, HttpServletRequest.class,
					HttpServletResponse.class);
			declaredMethod.invoke(this, request, response);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}