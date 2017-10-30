package cn.oocl.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import cn.oocl.model.Category;
import cn.oocl.model.OrderItem;

@Repository ("orderItemDao")
public class OrderItemDaoImpl implements OrderItemDao  {

	@PersistenceContext
	private EntityManager em = null;
	
	public void save (OrderItem orderItem){
		em.persist(orderItem);
	}
}
