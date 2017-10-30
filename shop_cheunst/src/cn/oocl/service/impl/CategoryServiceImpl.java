package cn.oocl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import cn.oocl.dao.ProductDao;
import cn.oocl.dao.impl.CategoryDao;
import cn.oocl.model.Category;
import cn.oocl.model.Product;

//@Service("categoryService") // 需要在xml中支持註解掃描機制
public class CategoryServiceImpl {

	@Resource (name="categoryDao")
	private CategoryDao categoryDao;

	@Resource (name="productDao") //
	private ProductDao productDao;

	// -----開啟事務	
	public void save(Category category) {
		categoryDao.save(category);
		for (Product temp : category.getProList()) {
			productDao.save(temp);
		}
	}
	// 提交事務
	
	public List<Category> queryAll (){
		return categoryDao.queryAll();
	}
	
	public Category queryByCid (String id){
		return categoryDao.queryByCid(id);
	}
	
	public List<Category> queryByHot(char hot){
		return categoryDao.queryByHot(hot);
	}
}







