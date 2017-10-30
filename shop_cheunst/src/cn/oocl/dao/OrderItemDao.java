package cn.oocl.dao;

import org.springframework.data.repository.CrudRepository;

import cn.oocl.model.OrderItem;

public interface OrderItemDao extends CrudRepository<OrderItem, String> {

}