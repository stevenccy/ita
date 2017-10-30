package cn.oocl.service;

import java.util.List;

import org.springframework.data.domain.Page;

import cn.oocl.model.Product;

public interface ProductService {

	// -----開啟事務
	public Product save(Product product);

	// 提交事務
	public Product update(Product product);
	
	public Page<Product> queryByName (String keyword, int currentPage, int size);

	long count();

	public void delete(Product product);

	void delete(Iterable<? extends Product> arg0);

	void deleteAll();

	boolean exists(String arg0);

	Iterable<Product> findAll();

	Iterable<Product> findAll(Iterable<String> arg0);

	Product findOne(String arg0);

	<S extends Product> Iterable<S> save(Iterable<S> arg0);

	void delete(String id);


}