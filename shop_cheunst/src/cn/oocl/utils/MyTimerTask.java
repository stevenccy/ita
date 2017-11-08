package cn.oocl.utils;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;

import com.sun.glass.ui.Application;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.CategoryService;
import cn.oocl.service.ProductService;

@Component
public class MyTimerTask extends TimerTask {
	@Resource
	private ProductService productService = null;
	@Resource
	private CategoryService categoryService = null;
	@Resource
	private RedisService redisService = null;
	
	private ServletContext application = null ;
	
	// 创建MyTimerTask之后通过set方法吧application内置对象传入进来
	public void setApplication(ServletContext application) {
		this.application = application;
	}
	

	@Override
	public void run() {
		
		Object hget = redisService.hget("index", "proList");
		
		if(hget==null) {
			System.out.println("redis緩存中沒有數據 ...............................");
			// 聲明一個用來存儲集合的集合
			List<Iterable<Product>> bigList = new ArrayList<Iterable<Product>>();
			// Map<String, List<Product>> proMap = new HashMap<String,
			// List<Product>>();
			// 查詢首頁要顯示的熱點類別
			for (Category category : categoryService.queryByHot('Y')) {
				// 根據當前熱點類別的ID查詢出首頁要顯示的熱點商品
				Iterable<Product> proList = productService.queryByCid(category.getId());
				bigList.add(proList);
				// proMap.put(category.getName(), proList);
			}
			
			redisService.hput("index", "proList", bigList);
			application.setAttribute("bigList", bigList);
			
		}else {
			System.out.println("redis緩存中已經有數據，直接交給application ...............................");
			application.setAttribute("bigList", hget);
		}		
	}
}
