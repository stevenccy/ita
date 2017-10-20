package cn.oocl.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.model.User;
import cn.oocl.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserService userService = new UserService();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		User user = new User();
		user.setUser_name(request.getParameter("user_name"));
		user.setPassword(request.getParameter("password"));
		user.setRole(request.getParameter("role"));
		
		HttpSession session = request.getSession();
		
		if (userService.login(user,"admin")>0){
			session.setAttribute("user", user);	
		}else{
			session.setAttribute("user", user);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin.jsp");
		dispatcher.forward(request, response);
	}

}
