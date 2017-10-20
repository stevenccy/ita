package cn.oocl.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import cn.oocl.dao.ProductDaoImpl;
import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.CategoryServiceImpl;
import cn.oocl.service.ProductService;

/**
 * Application Lifecycle Listener implementation class InitDataListener
 *
 */
@WebListener
public class InitDataListener implements ServletContextListener {

	private CategoryServiceImpl categoryService = new CategoryServiceImpl();
	private ProductService productService = new ProductService();
	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Web container close now, will destroy");

	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	@Override
	public void contextInitialized(ServletContextEvent event) {
		System.out.println("Web container create now, will create");
		List<Category> catList = categoryService.queryAll();
		ServletContext application = event.getServletContext();
		application.setAttribute("catList", catList);
		
		catList = categoryService.queryByHot("Y");
		List<List<Product>> bigList = new ArrayList<List<Product>>();
		for (Category category:categoryService.queryByHot("Y")){
			bigList.add(productService.queryByCid(category.getId()));
		}
		application.setAttribute("bigList", bigList);
		System.out.println(bigList);
		
		
	}
}
