package cn.oocl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName= "filter-1-EncodingFilter",urlPatterns="/*")
public class EncodingFilter implements Filter {
	
	public EncodingFilter(){
		System.out.println("----------EncodingFilter---------");
	}
	
	@Override
	public void destroy() {
		System.out.println("----------destroy---------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("----------Encoding doFilter----------");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
