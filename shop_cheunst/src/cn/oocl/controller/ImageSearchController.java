package cn.oocl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.oocl.utils.BingImageSearch;

@Controller
@RequestMapping("/ImageController")
public class ImageSearchController {

	@RequestMapping("/search")
	@ResponseBody
	public Object imageSearch(String searchTerm) {
		return BingImageSearch.searchImage(searchTerm);
	}

}
