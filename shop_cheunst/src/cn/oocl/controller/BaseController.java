package cn.oocl.controller;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import cn.oocl.service.OrderItemService;
import cn.oocl.service.OrderService;
import cn.oocl.service.ProductService;
import cn.oocl.service.impl.AccountServiceImpl;
import cn.oocl.utils.FileUploadUtils;

@Controller
public class BaseController {

	@Resource
	protected HttpServletRequest request;
	@Resource
	protected HttpSession session;
	@Resource
	protected ServletContext application;

	@Resource
	protected FileUploadUtils fileUpload;

	protected static int PAGE_SIZE = 4;

	@Resource
	protected ProductService productService = null;

	@Resource
	protected AccountServiceImpl accountService = null;
	
	@Resource
	protected OrderService orderService = null;

	@Resource
	protected OrderItemService orderItemService;
}
