package cn.oocl.dao;

import java.util.List;

import cn.oocl.model.Category;

public class CategoryDaoImpl extends BaseDaoImpl<Category> {

	public List<Category> queryAll() {
		String sql = "select id as \"id\", name as \"name\" from category_cheunst";
		return super.queryByName(sql, Category.class);
	}

	public List<Category> queryByHot(String hot) {
		String sql = "select id as \"id\", name as \"name\" from category_cheunst where HOT Like ?";
		return super.queryByName(sql, Category.class, '%'+hot+'%');
	}

}
