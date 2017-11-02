package cn.oocl.dao.test;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-bean.xml")
public class OrderServiceImplTest {
	@Resource (name="orderService")
	private OrderService orderService;
	
	@Test
	public void test() {
		Order order = new Order();
		order.setTotal(new BigDecimal("100.1"));
		order.setAddress("ZHuHai");
		OrderItem item = new OrderItem();
		item.setName("Buy Item 1");
		item.setNumber(1);
		item.setPrice(new BigDecimal("100.1"));
		item.setOrder(order);
		order.getItemList().add(item);
//		orderService.save(item);
	
	}

}
