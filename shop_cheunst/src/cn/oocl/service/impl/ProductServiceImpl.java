package cn.oocl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import cn.oocl.dao.ProductDao;
import cn.oocl.model.Product;
import cn.oocl.service.ProductService;

@Service("productService") // 需要在xml中支持註解掃描機制
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductDao productDao = null;

	// -----開啟事務
	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#save(cn.oocl.model.Product)
	 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-bean.xml");
		ProductService productService = context.getBean("productService", ProductService.class);
		
		Page<Product> page = productService.queryByName("", 0, 5);
		System.out.println(page.getContent());
	}

	@Override
	public Product save(Product product) {
		System.out.println(product);
		return productDao.save(product);
	}

	// 提交事務
	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#update(cn.oocl.model.Product)
	 */
	// @Override
	// public Product update(Product product) {
	// return productDao.update(product);
	// }

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#count()
	 */
	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#delete(cn.oocl.model.Product)
	 */
	@Override
	public void delete(Product product) {
		productDao.delete(product.getId());
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#delete(java.lang.Iterable)
	 */
	@Override
	public void delete(Iterable<? extends Product> arg0) {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#deleteAll()
	 */
	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#exists(java.lang.String)
	 */
	@Override
	public boolean exists(String arg0) {

		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#findAll()
	 */
	@Override
	public Iterable<Product> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#findAll(java.lang.Iterable)
	 */
	@Override
	public Iterable<Product> findAll(Iterable<String> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#findOne(java.lang.String)
	 */
	@Override
	public Product findOne(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#save(java.lang.Iterable)
	 */
	@Override
	public <S extends Product> Iterable<S> save(Iterable<S> arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see cn.oocl.service.impl.ProductService#delete(java.lang.String)
	 */
	@Override
	public void delete(String id) {
		productDao.delete(id);
	}

	@Override
	public Product update(Product product) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Product> queryByName(String keyword, int currentPage, int size) {
		PageRequest request  = new PageRequest(currentPage, size);
		
		return productDao.queryByName("%"+keyword +"%", request);
	}

	// public List<Product> queryByCid(String cid) {
	// return productDao.queryByCid(cid);
	// }

	// public List<Product> queryByName(String name, int currentPage, int size)
	// {
	// return productDao.queryByName(name, currentPage, size);
	// }
}
