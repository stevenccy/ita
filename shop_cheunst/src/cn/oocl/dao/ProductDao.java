package cn.oocl.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Product;

// 在运行时候,会根据当前Dao动态生成DaoImpl,而且DaoImpl的ID名称就是当前dao的类名
public interface ProductDao extends CrudRepository<Product, String> {
	
	@Query ("SELECT p from Product p where p.name like :name")
	public Page<Product> queryByName (@Param("name") String keyword, Pageable pageable);
	
	@Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
	public Iterable <Product> queryByCid(@Param("categoryId") String cid);
}