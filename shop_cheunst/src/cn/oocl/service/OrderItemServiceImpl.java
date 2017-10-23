package cn.oocl.service;

import java.util.List;

import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

// 用來處理訂單業務邏輯
public class OrderItemServiceImpl {
	
	public Order addOrderItem(OrderItem newItem,Order order){
		List<OrderItem> itemList = order.getItemList();
		int i =0;
		for (; i<itemList.size();i++){
			OrderItem oldItem = itemList.get(i);
			if (oldItem.getProduct().getId().equals(newItem.getProduct().getId())){
				oldItem.setNumber(oldItem.getNumber()+newItem.getNumber());
				break;
			}
		}
		if (i==itemList.size()){
			order.getItemList().add(newItem);
		}
		return order;
	}
}