package cn.oocl.service;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

// 用來處理訂單業務邏輯
public class OrderService {
	
	public Order addOrder(OrderItem newItem,Order order){
		// 通過item.product.id判斷購物車中是否有重複的商品
		return order;
	}
	// 通過購物車計算總價格
	public double cluTotal(Order order) {
		double total = 0.0;
		for (OrderItem item : order.getItemList()) {
			// 購物項的單機*數量等於總價格
			total+=item.getPrice() * item.getNumber();
		}
		return total;
	}
}