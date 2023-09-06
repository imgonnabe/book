package com.book.web.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.web.service.MyPageService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping({"/", "/main"})
	public String main(Model model) {
		List<Map<String, Object>> list = myPageService.booklist();
		model.addAttribute("list", list);
		return "/mypage/main";
	}
	
	@GetMapping("/zzim")
	public String zzim(Model model) {
		List<Map<String, Object>> list = myPageService.zzimlist();
		model.addAttribute("list", list);
		return "/mypage/zzim";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam(value="valueArr") String[] del, Model model) {
		System.out.println(Arrays.toString(del));
		for (int i = 0; i < del.length; i++) {
			int result = myPageService.delete(del[i]);
			model.addAttribute("data", result);
		}
		return "redirect:/mypage/zzim";
	}
	
	@GetMapping("/buy")
	public String buy(Model model, @RequestParam Map<String, Object> map) {
		System.out.println(map);
		List<Map<String, Object>> list = myPageService.buylist(map);
		model.addAttribute("list", list);
		return "/mypage/buy";
	}
	
	@GetMapping("/rent")
	public String rent(Model model) {
		List<Map<String, Object>> list = myPageService.rentlist();
		model.addAttribute("list", list);
		return "/mypage/rent";
	}
}
