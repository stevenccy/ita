package cn.oocl.service;

import java.util.List;

import cn.oocl.dao.OrderItemDaoImpl;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

// 用來處理訂單業務邏輯
public class OrderItemServiceImpl {

	private OrderItemDaoImpl orderItemDaoImpl = new OrderItemDaoImpl();

	public Order removeOrderItem(String pid, Order order) {
		List<OrderItem> itemList = order.getItemList();
		OrderItem del = null;
		for (OrderItem old : itemList) {
			if (old.getProduct().getId().equals(pid)) {
				del = old;
				break;
			}
		}
		itemList.remove(del);
		return order;
	}

	public int save(OrderItem orderItem) {
		return orderItemDaoImpl.save(orderItem);
	}

	public Order updateItemNum(String pid, int num, Order order) {
		for (OrderItem item : order.getItemList()) {
			if (item.getProduct().getId().equals(pid)) {
				item.setNumber(num);
				break;
			}
		}
		return order;
	}

	public Order addOrderItem(OrderItem newItem, Order order) {
		List<OrderItem> itemList = order.getItemList();
		int i = 0;
		for (; i < itemList.size(); i++) {
			OrderItem oldItem = itemList.get(i);
			if (oldItem.getProduct().getId().equals(newItem.getProduct().getId())) {
				oldItem.setNumber(oldItem.getNumber() + newItem.getNumber());
				break;
			}
		}
		if (i == itemList.size()) {
			order.getItemList().add(newItem);
		}
		return order;
	}
}