package cn.oocl.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import cn.oocl.model.Order;

/**
 * Application Lifecycle Listener implementation class MySessionListener
 *
 */
@WebListener
public class MySessionListener implements HttpSessionListener {

	/**
	 * Default constructor.
	 */
	public MySessionListener() {
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent event) {
		System.out.println("sessionCreated............");
		// 在創建session時,動態創建一個購物車
		event.getSession().setAttribute("order", new Order());
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent arg0) {
		System.out.println("sessionDestroyed............");		
	}

}
