package cn.oocl.service;

import java.util.List;

import cn.oocl.dao.CategoryDaoImpl;
import cn.oocl.model.Category;

public class CategoryServiceImpl {
	CategoryDaoImpl categoryDaoImpl = new CategoryDaoImpl();
	
	public List<Category> queryAll (){
		return categoryDaoImpl.queryAll();
	}
	
	public List<Category> queryByHot (String hot){
		return categoryDaoImpl.queryByHot(hot);
	}
}
