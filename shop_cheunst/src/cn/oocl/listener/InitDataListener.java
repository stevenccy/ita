//package cn.oocl.listener;
//
//import java.io.File;
//import java.io.FilenameFilter;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.web.context.WebApplicationContext;
//import org.springframework.web.context.support.WebApplicationContextUtils;
//
//import cn.oocl.model.Category;
//import cn.oocl.model.Product;
//import cn.oocl.service.impl.CategoryServiceImpl;
//import cn.oocl.service.impl.ProductService;
//import cn.oocl.utils.BeanDefinitions;
//
///**
// * Application Lifecycle Listener implementation class InitDataListener
// *
// */
//@WebListener
//public class InitDataListener implements ServletContextListener {
//
//	private CategoryServiceImpl categoryService;
//
////	private ProductService productService;
//
//	private ClassPathXmlApplicationContext springContext;
//
//	/**
//	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
//	 */
//	@Override
//	public void contextDestroyed(ServletContextEvent arg0) {
//		System.out.println("Web container close now, will destroy");
//
//	}
//
//	/**
//	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
//	 */
//	@Override
//	public void contextInitialized(ServletContextEvent event) {
//		/*
//		 * Different type of listener
//		 * 
//		 * +ve: create one instance --> user visit index will get these item -->
//		 * save it in the local when start up --> -ve: not refresh when new item
//		 * --> timer--> create thread not unique when multiple tomcat solution :
//		 * redis (singleton) --> as cache to solve this problem.
//		 */
//
//		// ServletContext servletContext = event.getServletContext();
//
//		// springContext =
//		// WebApplicationContextUtils.getWebApplicationContext(servletContext);
//
//		System.out.println("Web container create now, will create");
//
//		categoryService = (CategoryServiceImpl) BeanDefinitions.getBean("categoryService");
//		productService = (ProductService) BeanDefinitions.getBean("productService");
//
//		List<Category> catList = categoryService.queryAll();
//		ServletContext application = event.getServletContext();
//		application.setAttribute("catList", catList);
//
//		catList = categoryService.queryByHot('T');
//		List<List<Product>> bigList = new ArrayList<List<Product>>();
//		for (Category category : categoryService.queryByHot('T')) {
//			bigList.add(productService.queryByCid(category.getId()));
//		}
//		application.setAttribute("bigList", bigList);
//
//		String[] bankName = new File(application.getRealPath("images/bank")).list(new FilenameFilter() {
//
//			@Override
//			public boolean accept(File dir, String name) {
//				return name.endsWith(".gif");
//			}
//		});
//		application.setAttribute("bankName", bankName);
//	}
//}
