package cn.oocl.dao;

import org.springframework.data.repository.CrudRepository;

import cn.oocl.model.Order;

public interface OrderDao extends CrudRepository<Order, String> {

}