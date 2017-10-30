package cn.oocl.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import cn.oocl.model.Category;

public interface CategoryDao extends CrudRepository<Category,String> {

	@Query ("Select c FROM Category c wher c.hot=:hot")
	List<Category> queryByHot(@Param("hot") String hot);

}