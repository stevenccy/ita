package cn.oocl.service;

import java.math.BigDecimal;

import cn.oocl.model.Order;

public interface OrderService {


	Order save(Order order);

	// 通過購物車計算總價格
	BigDecimal cluTotal(Order order);

}