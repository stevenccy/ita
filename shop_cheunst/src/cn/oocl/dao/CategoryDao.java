package cn.oocl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Category;

public interface CategoryDao extends CrudRepository<Category, String> {
	
	@Query("SELECT c FROM Category c WHERE c.hot = :hot")
	List<Category> queryByHot(@Param("hot") char hot);

}