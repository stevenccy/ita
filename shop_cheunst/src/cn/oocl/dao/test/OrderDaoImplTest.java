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
@ContextConfiguration(locations = "classpath:spring-bean.xml")
public class OrderDaoImplTest {

	@Resource(name="orderService")
	private OrderService orderService; 
	
	@Test // 测试级联入库,并且测试如果出现异常则回滚
	public void testSave() {
		// 订单与订单项级联入库: 1: 订单插入成功,则会生成Order ID, 2: OrderItem --->关联Order
		Order order = new Order();
		order.setTotal(new BigDecimal("100.1"));
		order.setAddress("广东珠海");
		OrderItem orderItem = new OrderItem();
		orderItem.setName("购买商品1");
		orderItem.setNumber(1);
		orderItem.setPrice(new BigDecimal("100.1"));
		// 购物项需要关联购物车()
		orderItem.setOrder(order);
		order.getItemList().add(orderItem);
		orderService.save(order);
	}
}
