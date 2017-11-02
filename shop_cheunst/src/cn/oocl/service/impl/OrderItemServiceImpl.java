package cn.oocl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.oocl.dao.OrderItemDao;
import cn.oocl.model.Category;
import cn.oocl.model.Order;
import cn.oocl.model.OrderItem;
import cn.oocl.service.OrderItemService;

//用來處理訂單業務邏輯
@Service("orderItemService")
public class OrderItemServiceImpl implements OrderItemService {
	
	@Resource(name = "orderItemDao")
	private OrderItemDao orderDaoItem = null;

	
	@Override
	public OrderItem save(OrderItem orderItem) {
		return orderDaoItem.save(orderItem);
	}
	
	@Override
	public Order updateItemNum(String pid, int num, Order order) {
		for (OrderItem item : order.getItemList()) {
			if (item.getProduct().getId().equals(pid)) {
				// 把当前item数量更新为新的num即可
				item.setNumber(num);
				break;
			}
		}
		return order;
	}

	@Override
	public Order removeOrderItem(String pid, Order order) {
		List<OrderItem> itemList = order.getItemList();
		OrderItem delItem = null;
		for (OrderItem old : itemList) {
			if (old.getProduct().getId().equals(pid)) {
				// 找到了要删除的商品,执行删除操作
				delItem = old;
				break;
			}
		}
		itemList.remove(delItem);
		return order;
	}
	
	@Override
	public Order addOrderItem(OrderItem newItem, Order order) {
		List<OrderItem> itemList = order.getItemList(); // 当前购物车
		// 通過item.product.id判斷購物車中是否有重複的商品
		int i = 0;
		for (; i < itemList.size(); i++) {
			// 获取购物车的购物项
			OrderItem oldItem = itemList.get(i);
			if (oldItem.getProduct().getId().equals(newItem.getProduct().getId())) {
				oldItem.setNumber(oldItem.getNumber() + newItem.getNumber());
				break;
			}
		}
		if (i == itemList.size()) { // 说明当前购物车中并未此商品,直接添加即可
			order.getItemList().add(newItem);
		}
		return order;
	}
}