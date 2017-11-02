package cn.oocl.service.impl;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cn.oocl.dao.ProductDao;
import cn.oocl.model.Product;
import cn.oocl.service.ProductService;

@Service(value = "productService")
public  class ProductServiceImpl implements ProductService {

	@Resource(name = "productDao")
	private ProductDao productDao = null;

	public static void main(String[] args) {
		// 必須使用spring來創建對象才會有ioc功能
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-bean.xml");
		ProductService serviceImpl = context.getBean("productService", ProductService.class);
		Page<Product> page = serviceImpl.queryByName("",1,2);
		System.out.println(page);
	}

	@Override
	public Page<Product> queryByName(String keyword, int currentPage, int size) {
		PageRequest pageRequest = new PageRequest(currentPage, size);
		return productDao.queryByName("%" + keyword + "%", pageRequest);
	}

	@Override
	public Product update(Product product) {
		// 如果插入时已有主键,则执行更新操作
		return productDao.save(product);
	}

	@Override
	public void delete(String id) {
		// 根据主键执行删除操作
		productDao.delete(id);
	}

	@Override
	public Product getByID(String id) {
		return productDao.findOne(id);
	}

	@Override
	public Product save(Product product) {
		System.out.println(product);
		product = productDao.save(product);
		System.out.println(product);
		return product;
	}

	@Override
	public Iterable<Product> queryByCid(String cid) {
		return productDao.queryByCid(cid);
	}

}
