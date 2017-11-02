package cn.oocl.dao.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.oocl.model.Category;
import cn.oocl.service.CategoryService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-bean.xml")
public class CategoryServiceTest {

	@Resource
	private CategoryService categoryService;
	
	
	@Test
	public void testSave() {
		
		Category c = new Category();
		c.setName("asdsadadas");
		categoryService.save(c);
	}

}
