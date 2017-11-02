package cn.oocl.service;

import java.util.List;

import cn.oocl.model.Category;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;

public interface OrderItemService {
	OrderItem save(OrderItem orderItem);

	Order updateItemNum(String pid, int num, Order order);

	Order removeOrderItem(String pid, Order order);

	Order addOrderItem(OrderItem newItem, Order order);
}