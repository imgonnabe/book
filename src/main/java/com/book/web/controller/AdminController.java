package com.book.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.web.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/stock")
	public String stock(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		System.out.println(cate);
		System.out.println(map);
		List<Map<String, Object>> list = adminService.stocklist(map);
		model.addAttribute("list", list);
		return "/admin/stock";
	}
}
