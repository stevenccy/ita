package cn.oocl.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.oocl.model.Product;

@Controller
@RequestMapping("/ProductController") // 記錄了訪問當前Servlet的URL地址
public class ProductController extends BaseController {

	@RequestMapping("/save")
	public String save(MultipartFile file, Product product) throws IllegalStateException, IOException {
		if (file.getSize() > 0) {
			String fileName = file.getOriginalFilename();

			fileName = fileUpload.randomFileName(fileName);

			String basePath = application.getRealPath("/assets/images");
			System.out.println(basePath);
			File upload = new File(basePath, fileName);

			file.transferTo(upload);

			product.setImgurl(fileName);
		}
		productService.save(product);
		return "redirect:/admin/admin_query.jsp"; // no need project name
	}

	@RequestMapping("/query")
	public String query(String keyword) {
		Page<Product> page = productService.queryByName(keyword, 0, PAGE_SIZE);
		session.setAttribute("keyword", keyword);
		session.setAttribute("page", page);
		return "forward:/admin/admin_query.jsp";
	}

	@RequestMapping("/queryForList")
	public String queryForList(String keyword, int currentPage) {
		Page<Product> page = productService.queryByName(keyword, currentPage, 6);
		session.setAttribute("cid", null);
		session.setAttribute("keyword", keyword);
		session.setAttribute("queryList", page);
		return "forward:/contentpage.jsp";
	}
	

	@RequestMapping("/queryCategoryForList")
	public String queryCategoryForList(String cid,int currentPage) {
		Page<Product> page = productService.queryCategoryForList(cid, currentPage, 6);
		session.setAttribute("queryList", page);
		session.setAttribute("keyword", null);
		session.setAttribute("cid", cid);
		return "forward:/contentpage.jsp";
	}
	
	@RequestMapping("/update")
	public String update(Product product) {
		productService.update(product);
		return "forward:/ProductController/pagination.mvc?currentPage=1";
	}

	@RequestMapping("/delete/{id}/{currentPage}")
	public String delete(@PathVariable("id") String id,@PathVariable("currentPage") int currentPage) {

		productService.delete(id);
		String keyword = (String) session.getAttribute("keyword");
		Page<Product> page = productService.queryByName(keyword, 1, PAGE_SIZE);
		session.setAttribute("page", page);
		return "redirect:/admin/query.jsp";
	}

	@RequestMapping("/getById")
	public String getById(String id) {
		request.setAttribute("product", productService.getByID(id));
		return "forward:/admin/admin_update.jsp";
	}

	@RequestMapping("/detail")
	public String detail(String id) {
		request.setAttribute("product", productService.getByID(id));
		return "forward:/detail.jsp";
	}
	
	@RequestMapping("/pagination")
	public String pagination(int currentPage) {
		String keyword = (String) session.getAttribute("keyword");
		Page<Product> page = productService.queryByName(keyword, currentPage, PAGE_SIZE);
		session.setAttribute("page", page);
		return "forward:/admin/admin_query.jsp";
	}
}
