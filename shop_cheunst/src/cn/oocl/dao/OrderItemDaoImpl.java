package cn.oocl.dao;

import java.util.List;

import cn.oocl.model.Category;
import cn.oocl.model.OrderItem;

public class OrderItemDaoImpl extends BaseDaoImpl<Category> {

	public int save (OrderItem orderItem){
		String sql = "insert into orderItem_cheunst (num,name,price,pid,oid) values (?,?,?,?,?)";
		return super.executeUpdate(sql, new Object[] { orderItem.getNumber(),orderItem.getName(),orderItem.getPrice(),
				orderItem.getProduct().getId(), orderItem.getOrder().getId() });
	}
}
