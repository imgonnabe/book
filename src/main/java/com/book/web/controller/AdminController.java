package com.book.web.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.web.service.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;

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
	
	@ResponseBody
	@PostMapping("/updateStock")
	public void updateStock(Model model, @RequestParam Map<String, Object> map) {
		System.out.println(map);// {bkno=11, bstock=20, cate=}
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		adminService.updateStock(map);
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		System.out.println(cate);
		System.out.println(map);
		List<Map<String, Object>> list = adminService.boardlist(map);
		model.addAttribute("list", list);
		return "/admin/board";
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) throws JsonProcessingException {
		Map<String, Object> detail = adminService.bdetail(bno);
		List<Map<String, Object>> comment = adminService.comment(bno);
		JSONObject json = new JSONObject();
		json.put("detail", detail);
		json.put("comment", comment);
		// System.out.println(comment);
		return json.toString();
	}
	
	@ResponseBody
	@PostMapping("/memberOut")
	public void memberOut(@RequestParam(value = "mid", required = true) String mid) {
		System.out.println(mid);
		adminService.memberOut(mid);
	}
	
	@ResponseBody
	@PostMapping("/bdel")
	public void bdel(@RequestParam(value = "bno", required = true) int bno) {
		System.out.println(bno);
		adminService.bdel(bno);
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		System.out.println(cate);
		System.out.println(map);
		List<Map<String, Object>> list = adminService.rentlist(map);
		model.addAttribute("list", list);
		return "/admin/rent";
	}
}
