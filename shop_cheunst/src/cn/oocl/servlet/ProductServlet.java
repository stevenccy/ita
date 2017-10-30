package cn.oocl.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import cn.oocl.model.Category;
import cn.oocl.model.Product;
import cn.oocl.service.impl.ProductServiceImpl;
import cn.oocl.utils.FileUploadUtils;
import cn.oocl.utils.PropUtils;

@WebServlet("/ProductServlet") // 記錄了訪問當前Servlet的URL地址
public class ProductServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4626879839918857018L;
	@Resource
	private ProductServiceImpl productServiceImpl ;
	private static final String pageSize = PropUtils.getValue("pageSize");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// MVC设计模式： Model: product, C: ProductServlet V: index.jsp
		// UI提交的数据进了需要存储到ｍｏｄｅｌ中
		// Servlet --> Service ---> Dao --> DB

		String type = request.getParameter("type");

		try {
			Method declaredMethod = this.getClass().getDeclaredMethod(type, HttpServletRequest.class,
					HttpServletResponse.class);
			declaredMethod.invoke(this, request, response);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private void getById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

//		Product product = productService.getById(id);

//		request.setAttribute("product", product);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_update.jsp");
		dispatcher.forward(request, response);
	}
	
	private void detail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

//		Product product = productService.getById(id);

//		request.setAttribute("product", product);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detail.jsp");
		dispatcher.forward(request, response);
	}

	protected void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product product = new Product();
		product.setName(request.getParameter("name"));
		product.setPrice(new BigDecimal(request.getParameter("price")));
		product.setRemark(request.getParameter("remark"));
		
		Part filePart = request.getPart("image");
	    String fileName = Paths.get(FileUploadUtils.getSubmittedFileName(filePart)).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    
	    String outputPath = PropUtils.getValue("imageStore")+fileName;
	    System.out.println("Output Path -> " +outputPath);
	    OutputStream outputStream= new FileOutputStream(outputPath);
	    
	    byte[] buffer = new byte[1024];
	        int bytesRead;
	        //read from is to buffer
	        while((bytesRead = fileContent.read(buffer)) !=-1){
	         outputStream.write(buffer, 0, bytesRead);
	        }
	        fileContent.close();
	        //flush OutputStream to write any buffered data to file
	        outputStream.flush();
	        outputStream.close();
	     
	product.setImgurl(fileName);
		productServiceImpl.save(product);
	}

	protected void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Product product = new Product();
		product.setId(request.getParameter("id"));
		product.setName(request.getParameter("name"));
		product.setPrice(new BigDecimal(request.getParameter("price")));
		product.setRemark(request.getParameter("remark"));
		product.setCategory(new Category(request.getParameter("cid"), null));
		productServiceImpl.update(product);
		response.sendRedirect(request.getContextPath() + "/admin/admin_query.jsp");
	}

//	protected void delete(HttpServletRequest request, HttpServletResponse response)
//			throws IOException, ServletException, InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException {
//		// 1: 獲取要刪除的id
//		String id = request.getParameter("id");
//		// 2: 調用 Service ---> Dao --> DB
//		productServiceImpl.delete(id);
//		// 2: 調用service --> dao
//		
//		HttpSession session = request.getSession();
//		String keyword = (String) session.getAttribute("keyword");
//		
//		List<Product> proList = productServiceImpl.queryByName(keyword, 1, Integer.parseInt(pageSize));
//		System.out.println(proList.size());
//
//		request.setAttribute("proList", proList);
//		// servlet -->jsp 訪問所有資料都要，如果沒有，就是自帶的
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/query.jsp");
//		dispatcher.forward(request, response);
//
//	}

//	protected void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,
//			InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException {
//		String keyword = request.getParameter("keyword");
//		HttpSession session = request.getSession();
//		
//		// 2: 調用service --> dao
//		
//		if (keyword == null){
//			keyword = (String) session.getAttribute("keyword");
//		}
//		session.setAttribute("keyword", keyword);
//		Map<String, Object> pageMap = new HashMap<String, Object>();
//		pageMap.put("keyword", keyword);
////		pageMap.put("pageCount", productService.getPageCount(keyword,Integer.parseInt(pageSize)));  // 假設從頁數為7
//		pageMap.put("currentPage", request.getParameter("currentPage"));
//		session.setAttribute("pageMap",pageMap);
//		
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		List<Product> proList = productServiceImpl.queryByName(keyword,currentPage , Integer.parseInt(pageSize));		
//		request.setAttribute("proList", proList);
//		// servlet -->jsp 訪問所有資料都要，如果沒有，就是自帶的
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin_query.jsp");
//		dispatcher.forward(request, response);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
