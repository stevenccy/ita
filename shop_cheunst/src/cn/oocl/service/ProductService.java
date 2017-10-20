package cn.oocl.service;

import java.util.List;

import cn.oocl.dao.ProductDaoImpl;
import cn.oocl.model.Product;

// 此類是商品的業務邏輯類，如果業務邏輯需要訪問數據庫則需要調用ProductDao
public class ProductService {

	private ProductDaoImpl productDao = new ProductDaoImpl();

	public int save(Product product) {
		// 此處以後會添加業務邏輯操作
		return productDao.save(product);
	}

	public List<Product> queryByName(String keyword, int page, int size)
			throws InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException {
		return productDao.queryByNamePaging(keyword, page, size);
	}
	
	public List<Product> queryByCid (String cid){
		return productDao.queryByCid(cid);
	}
	public Product getById(String id) {
		return productDao.getById(id);
	}

	public void delete(int id) {
		productDao.delete(id);
	}
	public int update(Product product) {
		// 此處以後會添加業務邏輯操作
		return productDao.update(product);
	}
	
	public int getPageCount(String keyword, int size) {
		// 此處以後會添加業務邏輯操作
		return productDao.getPageCount(keyword, size);
	}
}
