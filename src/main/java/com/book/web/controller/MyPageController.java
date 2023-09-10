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
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.web.service.MyPageService;
import com.book.web.utils.SmsUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private SmsUtil smsUtil;
	
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
			int result = myPageService.zdelete(del[i]);
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
	public String rent(Model model, @RequestParam Map<String, Object> map) {
		System.out.println(map);
		List<Map<String, Object>> list = myPageService.rentlist(map);
		model.addAttribute("list", list);
		return "/mypage/rent";
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		System.out.println(cate);
		System.out.println(map);
		List<Map<String, Object>> list = myPageService.boardlist(map);
		model.addAttribute("list", list);
		return "/mypage/board";
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno) throws JsonProcessingException {
		Map<String, Object> map = myPageService.bdetail(bno);
		
		ObjectMapper mapp = new ObjectMapper();
		String json = mapp.writeValueAsString(map);
		return json;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, Map<String, Object> map) {
		// System.out.println(bno);
		map.put("bno", bno);
		map.put("mid", 1);
		System.out.println(map);
		myPageService.bdelete(map);
		return "redirect:/mypage/board";
	}
	
	@GetMapping("/comment")
	public String comment(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
			map.put("cate", 0);
		}
		System.out.println(cate);
		System.out.println(map);
		List<Map<String, Object>> list = myPageService.commentlist(map);
		model.addAttribute("list", list);
		return "/mypage/comment";
	}
	
	@ResponseBody
	@PostMapping("/cdetail")
	public String cdetail(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno) throws JsonProcessingException {
		Map<String, Object> map = myPageService.cdetail(cno);
		
		ObjectMapper mapp = new ObjectMapper();
		String json = mapp.writeValueAsString(map);
		return json;
	}
	
	@GetMapping("/info")
	public String info(Model model, @RequestParam Map<String, Object> map) {
		map.put("mid", 1);
		Map<String, Object> info = myPageService.info(map);
		model.addAttribute("info", info);
		return "/mypage/info";
	}
	
	@ResponseBody
	@GetMapping("/phoneCheck")
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {// 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		smsUtil.sendOne("phone", randomNumber);
		return "/mypage/info";
	}
}