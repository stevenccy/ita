package cn.oocl.listener;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.CategoryService;
import cn.oocl.service.ProductService;

/*
 * web組件: Servlet Filter Listener
 * 
 *    1： Servlet 用來接收http的请求, 单例模式, 第一次请求时候创建
 *    2： Filer 用來过滤http请求, 单例模式, 项目启动时创建
 *    3：ServletContextListener: 启动时用来加载数据,单例模式, 优先级比Filter要高
 * 
 * */

public class InitDataListener implements ServletContextListener {

	private CategoryService categoryService = null;
	private ProductService productService = null;

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// 从application全局唯一的内置对象中获取相关的bean
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		categoryService = context.getBean("categoryService",CategoryService.class);
		productService = context.getBean("productService",ProductService.class);
		
		System.out.println("web容器啟動時候,方法會執行");
		// 1: 調用CategoryService.query(); 獲取所有的類別信息
		Iterable<Category> catList = categoryService.queryAll();
		System.out.println(catList);
		// 2: 應該要存儲在任何地方可以訪問的區域(全局唯一),application
		ServletContext application = event.getServletContext();
		System.out.println("application:" + application);
		application.setAttribute("catList", catList);
		// 聲明一個用來存儲集合的集合
		List<Iterable<Product>> bigList = new ArrayList<Iterable<Product>>();
		// 查詢首頁要顯示的熱點類別
		for (Category category : categoryService.queryByHot('Y')) {
			// 根據當前熱點類別的ID查詢出首頁要顯示的熱點商品
			Iterable<Product> proList = productService.queryByCid(category.getId());
			bigList.add(proList);
		}
		application.setAttribute("bigList", bigList);
		// 加载银行的图标,并且存储到application中
		String[] bankName = new File(application.getRealPath("/images/bank")).list(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				// System.out.println("dir:" + dir + ",name:" + name);
				if (name.endsWith(".gif")) {
					return true;
				}
				return false;
			}
		});
		application.setAttribute("bankName", bankName);
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("web容器關閉時候,方法會執行");

	}

}