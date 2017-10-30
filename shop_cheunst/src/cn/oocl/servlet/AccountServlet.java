package cn.oocl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.oocl.model.Account;
import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.impl.AccountServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/AccountServlet")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Resource
	private AccountServiceImpl accountService;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		List<Product> proList = new ArrayList<Product>();
		Product product = new Product();
		product.setId("10100");
		product.setName("Notebook");
		product.setpdate(new Date());
		Category category = new Category();
		category.setId("12");
		category.setName("Digital");
		product.setCategory(category);
		proList.add(product);
		proList.add(product);
		Gson gson = new Gson();
		out.write(gson.toJson(proList));
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account user = new Account();
		user.setUser_name(request.getParameter("user_name"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
				
		if (accountService.login(user)!=null){
			request.getSession().setAttribute("user", user);	
			response.sendRedirect(request.getContextPath() + "/admin/admin_add.jsp");

		}else{
			request.getSession().setAttribute("user", null);
			request.getSession().setAttribute("error", "Login failed.");	
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

}
