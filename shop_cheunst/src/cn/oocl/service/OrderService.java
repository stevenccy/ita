package cn.oocl.service;

import java.math.BigDecimal;

import cn.oocl.dao.OrderDaoImpl;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

// 用來處理訂單業務邏輯
public class OrderService {
	private OrderDaoImpl orderDaoImpl = new OrderDaoImpl();

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
	public int save (Order order){
		return orderDaoImpl.save(order);
	}
	
	public String getMaxId(){
		return orderDaoImpl.getMaxId();
	}
}