package cn.oocl.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.service.OrderItemServiceImpl;
import cn.oocl.service.OrderService;
import cn.oocl.utils.JdbcUtils;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private OrderService orderService = new OrderService();
	private OrderItemServiceImpl orderItemServiceImpl = new OrderItemServiceImpl();
	
    public OrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order order = (Order) request.getSession().getAttribute("order");
		order.setAddress(request.getParameter("address"));
		order.setPhone(request.getParameter("phone"));
		order.setName("name");
		Connection conn = JdbcUtils.getConnection();
		
		orderService.save(order);
		for (OrderItem item:order.getItemList()){
			item.setOrder(order);
			orderItemServiceImpl.save(item);
		}
		
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
