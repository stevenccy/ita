package cn.oocl.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.CategoryService;
import cn.oocl.service.ProductService;

public class MyTimerTask extends TimerTask{
	
	
	@Resource
	private CategoryService categoryService = null;
	
	@Resource 
	private ProductService productService = null;
	
	@Resource
	private RedisService redisService = null;
	
	@Override
	public void run(){
		Object hget = redisService.hget("index","proList");
		if(hget== null){
			
		}
		List<Iterable<Product>> bigList = new ArrayList <Iterable<Product>>();
		for (Category category : categoryService.queryByHot('Y')){
			
		}
		
	}
}
