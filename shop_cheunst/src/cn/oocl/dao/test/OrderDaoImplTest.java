package cn.oocl.dao.test;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import cn.oocl.dao.OrderDaoImpl;
import cn.oocl.dao.OrderItemDaoImpl;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.model.Product;
import cn.oocl.utils.JdbcUtils;

public class OrderDaoImplTest {
	
	private static OrderDaoImpl orderDaoImpl = null;
	private static OrderItemDaoImpl orderItemDaoImpl = null;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDaoImpl = new OrderDaoImpl();
		orderItemDaoImpl = new OrderItemDaoImpl();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDaoImpl = null;
		orderItemDaoImpl = null;
	}

	@Test
	public void test() throws SQLException {
		Connection connection = JdbcUtils.getConnection();
		connection.setAutoCommit(false);
		Order order = new Order();
		order.setAddress("1232222@gmail.com");
		order.setPhone("12312312");
		order.setTotal(new BigDecimal(200));
		orderDaoImpl.save(order);
		String id = orderDaoImpl.getMaxId();
		order.setId(id);
		
		OrderItem item = new OrderItem();
		item.setName("Apple");
		item.setNumber(1);
		item.setPrice(new BigDecimal (1000));
		item.setId(id);
		
		
		Product product = new Product();
		product.setId("20017001");
		item.setProduct(product);
		item.setOrder(order);
		orderItemDaoImpl.save(item);
		connection.commit();
	}

}
