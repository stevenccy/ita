package cn.oocl.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class CookieRequestListener
 *
 */
@WebListener
public class CookieRequestListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public CookieRequestListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
