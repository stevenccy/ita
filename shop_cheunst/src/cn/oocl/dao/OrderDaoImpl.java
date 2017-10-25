package cn.oocl.dao;

import cn.oocl.model.Order;
import cn.oocl.model.Product;

public class OrderDaoImpl extends BaseDaoImpl<Order> {

	public int save(Order order) {
		String sql = "insert into orders_cheunst (total,name,address,phone) values (?,?,?,?)";
		return super.executeUpdate(sql, new Object[] { order.getTotal(), order.getName(),
				order.getAddress(), order.getPhone() });
	}
	
	public String getMaxId(){
		String sql = "select max(id) from orders_cheunst";
		return String.valueOf(super.getCount(sql, new Object[]{}));
	}
}