package cn.oocl.listener;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.CategoryService;
import cn.oocl.service.ProductService;
import cn.oocl.utils.MyTimerTask;

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
	private MyTimerTask myTimerTask = null;

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// 从application全局唯一的内置对象中获取相关的bean
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		categoryService = context.getBean("categoryService", CategoryService.class);
		myTimerTask = context.getBean("myTimerTask", MyTimerTask.class);

		System.out.println("web容器啟動時候,方法會執行");
		// 1: 調用CategoryService.query(); 獲取所有的類別信息
		Iterable<Category> catList = categoryService.queryAll();
		System.out.println(catList);
		// 2: 應該要存儲在任何地方可以訪問的區域(全局唯一),application
		ServletContext application = event.getServletContext();
		application.setAttribute("catList", catList);

		// 解决思路: 判断Redis缓存中是否存在商品的数据,如果不存在则查询,否则直接从Redis中获取

		myTimerTask.setApplication(application); // 此对象必须交给Spring创建,才能有IOC功能
		new Timer(true).schedule(myTimerTask, 0, 1000 * 5); // 配置为守护线程,tomcat关闭之后此线程也会终止

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