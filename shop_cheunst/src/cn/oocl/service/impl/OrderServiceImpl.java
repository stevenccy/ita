package cn.oocl.service.impl;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.oocl.dao.impl.OrderDaoImpl;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

// 用來處理訂單業務邏輯
@Service
public class OrderServiceImpl {
	@Resource
	private OrderDaoImpl orderDaoImpl;

	public Order addOrder(OrderItem newItem,Order order){
		// 通過item.product.id判斷購物車中是否有重複的商品
		return order;
	}
	// 通過購物車計算總價格
	public BigDecimal cluTotal(Order order) {
		BigDecimal total = new BigDecimal(0);
		for (OrderItem item : order.getItemList()) {
			// 購物項的單機*數量等於總價格
			total.add(BigDecimal.valueOf(item.getPrice().doubleValue()*(item.getNumber() )));
		}
		return total;
	}
	public void save (Order order){
		orderDaoImpl.save(order);
	}
	
	public String getMaxId(){
		return orderDaoImpl.getMaxId();
	}
}