package cn.oocl.service.impl;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.oocl.dao.OrderDao;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.service.OrderService;

//用來處理訂單業務邏輯
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Resource(name = "orderDao")
	private OrderDao orderDao = null;

	@Override
	public Order save(Order order) {
		// 在model中已经配置级联入库
		return orderDao.save(order);
	}

	@Override
	public BigDecimal cluTotal(Order order) {
		BigDecimal total = new BigDecimal(0.0);
		for (OrderItem item : order.getItemList()) {
			total = total.add(item.getPrice().multiply(new BigDecimal(item.getNumber())));
		}
		return total;
	}
}