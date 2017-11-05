package cn.oocl.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Product;

public interface ProductService {


	public Product save(Product product);

	public Product update(Product product);

	public void delete(String id);

	public Product getByID(String id);

	// 查询分页
	public Page<Product> queryByName(String keyword, int currentPage, int size);
	
	public Iterable<Product> queryByCid( String cid);

	@Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
	public Page<Product> queryCategoryForList(String cid, int currentPage, int size);

}