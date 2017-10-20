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
import cn.oocl.service.ProductService;

/**
 * Servlet implementation class OrderItemServlet
 */
@WebServlet("/OrderItemServlet")
public class OrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderItemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		// TODO Auto-generated method stub
		// extract info from product to order item then to order then to session
		String id = request.getParameter("id");
		Product product = productService.getById(id);

		OrderItem item = new OrderItem();
		item.setName(product.getName());
		item.setNumber(1);
		item.setPrice(product.getPrice().doubleValue());
		if (request.getSession().getAttribute("order") == null) {
			request.getSession().setAttribute("order", new Order());
		}
		Order order = (Order) session.getAttribute("order");
		order.getOrderItems().add(item);
	}

}
