package cn.oocl.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Product;

public interface ProductDao extends CrudRepository<Product,String> {

	
	@Query ("SELECT p from Product p where p.name like :name")
	public Page<Product> queryByName (@Param("name") String keyword, Pageable pageable);
	
//	Product update(Product product);

//	List<Product> queryName(String name, int currentPage, int size);
//
//	List<Product> queryByCid(String cid);
//
//	List<Product> queryByName(String name, int currentPage, int size);
//
//	Product find(String id);
//
//	void delete(String id);
//
//	// 更新記錄本質就是更新對象(ORM映射機制)
//	void update(Product product);
//
//	// orm中,以後操作class就是操作table
//	Product save(Product product);

}