package cn.oocl.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.oocl.model.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(filterName = "filter-0-LoginFilter", urlPatterns = "/admin/*", dispatcherTypes = { DispatcherType.FORWARD,
		DispatcherType.INCLUDE, DispatcherType.REQUEST, DispatcherType.ERROR, DispatcherType.ASYNC })
public class LoginFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		System.out.println("--------LoginFiltering------------");
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("--------LoginFiltering	destroy----");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("--------LoginFiltering	doFilter-----");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		User user =(User) req.getSession().getAttribute("user");
		
		if (user!=null && !"admin".equals(user.getRole())) {
			res.sendRedirect(req.getContextPath() + "/login.jsp");
		} else {
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("--------LoginFiltering----init--------");
	}

}
