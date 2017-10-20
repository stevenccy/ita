package cn.oocl.dao.test;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import cn.oocl.dao.ProductDaoImpl;
import cn.oocl.model.Product;

@Resource
public class ProductDaoImplTest {

	private static ProductDaoImpl productDaoImpl = null;
	
	@BeforeClass  // 测试之前此方法会执行,一般用来初始化测试对象
	public static void setUpBeforeClass() throws Exception {
		System.out.println("setUpBeforeClass....");
		productDaoImpl = new ProductDaoImpl();
	}

	@AfterClass  // 测试之后执行,一般用来释放资源
	public static void tearDownAfterClass() throws Exception {
		System.out.println("tearDownAfterClass....");
		productDaoImpl = null;
	}
	
	@Test   // @Test代表当前是一个测试方法
	public void testDelete() {
		System.out.println("Delete..........");  //  alt + ↓
		productDaoImpl.delete(4);
	}

	@Test   //ctrl + alt + ↓
	public void testUpdate() {
		Product product = new Product();
		product.setName("优盘");
		product.setId(2 + "");
		product.setPrice(new BigDecimal(28.00));
		product.setRemark("测试数据");
		productDaoImpl.update(product);
	}

	@Test
	public void testSave() {
		Product product = new Product();
		product.setName("优盘");
		product.setPrice(new BigDecimal(28.00));
		product.setRemark("测试数据");
		productDaoImpl.save(product);
	}
	@Test
	public void testGetById() {
		System.out.println(productDaoImpl.getById("1"));
	}
	@Test
	public void testQueryByName() throws InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException {
		System.out.println(productDaoImpl.queryByNamePaging("",1,3));
	}
	
	
	@Test
	public void getPageCount() {
		System.out.println("test pageCound");
		System.out.println(productDaoImpl.getPageCount("", 3));
	}

}









