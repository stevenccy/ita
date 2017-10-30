package cn.oocl.utils;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class BeanDefinitions {

	private final static ClassPathXmlApplicationContext context;

	static {
		context = new ClassPathXmlApplicationContext("spring-bean.xml");
	}

	public static ClassPathXmlApplicationContext getContext() {
		return context;
	}

	public static Object getBean(String beanName) {
		return context.getBean(beanName);
	}

}