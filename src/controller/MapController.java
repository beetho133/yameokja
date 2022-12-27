package controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.MapService;

@Controller
public class MapController {
	@Autowired
	private MapService service;
	
	@RequestMapping(value="/mapSearch.do")
	@ResponseBody
	public String mapSearch(String keyword) throws UnsupportedEncodingException {
		// 검색 키워드를 가지고 네이버한테 물어봐야함
		
		return URLEncoder.encode(service.searchMap(keyword), "UTF-8");

//		return service.searchMap(keyword);
		
//		Gson gson = new Gson();
//		
//		return gson.toJson(service.search(keyword));
		
	}

}
