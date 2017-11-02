package cn.oocl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.oocl.dao.CategoryDao;
import cn.oocl.model.Category;
import cn.oocl.service.CategoryService;

@Service("categoryService") // 需要在xml中支持註解掃描機制
public class CategoryServiceImpl implements CategoryService {

	//@Resource(name = "categoryDao")
	@Resource
	private CategoryDao categoryDao = null;

	/* (non-Javadoc)
	 * @see cn.oocl.service.impl.CategoryService#queryAll()
	 */
	@Override
	public Iterable<Category> queryAll() {
		return categoryDao.findAll();
	}

	/* (non-Javadoc)
	 * @see cn.oocl.service.impl.CategoryService#queryByHot(java.lang.String)
	 */
	@Override
	public List<Category> queryByHot(char hot) {
		return categoryDao.queryByHot(hot);
	}

	@Override
	public Category save(Category category) {
		return categoryDao.save(category);
	}
}







