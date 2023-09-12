package com.book.web.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String main(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.booklist(mid);
			model.addAttribute("list", list);
			return "/mypage/main";
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/zzim")
	public String zzim(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			String mid = (String) session.getAttribute("mid");
			List<Map<String, Object>> list = myPageService.zzimlist(mid);
			model.addAttribute("list", list);
			return "/mypage/zzim";
		} else {
			return "/login";
		}
	}
	
	@PostMapping("/zdelete")
	public String zdelete(@RequestParam(value="valueArr") String[] del, Model model, HttpSession session) {
		System.out.println(Arrays.toString(del));
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < del.length; i++) {
				map.put("del", del[i]);
				map.put("mid", session.getAttribute("mid"));
				int result = myPageService.zdelete(map);
				model.addAttribute("data", result);
			}
			return "redirect:/mypage/zzim";
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/buy")
	public String buy(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.buylist(map);
			model.addAttribute("list", list);
			return "/mypage/buy";
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map, HttpSession session,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		System.out.println(map);
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.rentlist(map);
			model.addAttribute("list", list);
			return "/mypage/rent";
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			System.out.println(cate);
			System.out.println(map);
			map.put("mid", session.getAttribute("mid"));
			List<Map<String, Object>> list = myPageService.boardlist(map);
			model.addAttribute("list", list);
			return "/mypage/board";
		} else {
			return "/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.bdetail(bno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno
			, Map<String, Object> map, HttpSession session) {
		// System.out.println(bno);
		if(session.getAttribute("mid") != null) {
			map.put("bno", bno);
			map.put("mid", session.getAttribute("mid"));
			System.out.println(map);
			myPageService.bdelete(map);
			return "redirect:/mypage/board";
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/comment")
	public String comment(Model model, @RequestParam Map<String, Object> map,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			map.put("mid", session.getAttribute("mid"));
			System.out.println(cate);
			System.out.println(map);
			List<Map<String, Object>> list = myPageService.commentlist(map);
			model.addAttribute("list", list);
			return "/mypage/comment";
		} else {
			return "/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/cdetail")
	public String cdetail(@RequestParam(value = "cno", required = true, defaultValue = "0") int cno
			, HttpSession session) throws JsonProcessingException {
		if(session.getAttribute("mid") != null) {
			Map<String, Object> map = myPageService.cdetail(cno);
			
			ObjectMapper mapp = new ObjectMapper();
			String json = mapp.writeValueAsString(map);
			return json;
		} else {
			return "/login";
		}
	}
	
	@GetMapping("/info")
	public String info(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			map.put("mid", session.getAttribute("mid"));
			Map<String, Object> info = myPageService.info(map);
			model.addAttribute("info", info);
			return "/mypage/info";
		} else {
			return "/login";
		}
	}
	
	@ResponseBody
	@PostMapping("/phoneCheck")// 휴대폰 문자보내기
	public String sendSMS(@RequestParam(name="phone", required = false) String phone, HttpSession session) {
		if(session.getAttribute("mid") != null) {
			System.out.println(phone);
			int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성
	
			smsUtil.sendOne(phone, randomNumber);
			return String.valueOf(randomNumber);
		} else {
			return "/login";
		}
	}
}