package com.book.web.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.web.mypage.Criteria;
import com.book.web.mypage.Paging;
import com.book.web.mypage.Util;
import com.fasterxml.jackson.core.JsonProcessingException;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private Util util;
	
	@GetMapping("/stock")
	public String stock(Model model, @RequestParam Map<String, Object> map, HttpSession session, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int stockListCnt = adminService.stocklistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(stockListCnt);    
	        map.put("cri", cri);
	        List<Map<String, Object>> list = adminService.stocklist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/stock";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/updateStock")
	public String updateStock(Model model, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(map);// {bkno=11, bstock=20, cate=}
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			JSONObject json = new JSONObject();
			String bstock = (String) map.get("bstock");
			if(util.strToInt(bstock) == 0) {
				System.out.println("업데이트" + util.strToInt(bstock));
				json.put("bstock", 0);
				return json.toString();
			}
			adminService.updateStock(map);
			json.put("bstock", bstock);
			return json.toString();
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/board")
	public String board(Model model, @RequestParam Map<String, Object> map, Criteria cri,@RequestParam(name="cate", required = false, defaultValue = "0") int cate,
			@RequestParam(name="page", required = true, defaultValue = "1") int page, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int boardListCnt = adminService.boardlistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(boardListCnt);    
	        map.put("cri", cri);
	        System.out.println(map);// {mid=bbbb, cate=0, cri=Criteria [page=1, perPageNum=10]}
	        System.out.println(boardListCnt);
	        List<Map<String, Object>> list = adminService.boardlist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	
	@ResponseBody
	@PostMapping("/detail")
	public String detail(@RequestParam(value = "bno", required = true, defaultValue = "0") int bno, HttpSession session) 
			throws JsonProcessingException {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			Map<String, Object> detail = adminService.bdetail(bno);
			List<Map<String, Object>> comment = adminService.comment(bno);
			JSONObject json = new JSONObject();
			json.put("detail", detail);
			json.put("comment", comment);
			// System.out.println(comment);
			return json.toString();
			
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/memberOut")
	public String memberOut(@RequestParam(value = "mid", required = true) String mid, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(mid);
			adminService.memberOut(mid);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/bdel")
	public String bdel(@RequestParam(value = "bno", required = true) int bno, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			System.out.println(bno);
			adminService.bdel(bno);
			return "/admin/board";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/rent")
	public String rent(Model model, @RequestParam Map<String, Object> map, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int rentListCnt = adminService.rentlistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(rentListCnt);    
	        map.put("cri", cri);
	        List<Map<String, Object>> list = adminService.rentlist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/rent";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/sales")
	public String sales(Model model, @RequestParam Map<String, Object> map, HttpSession session, Criteria cri) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int tradeListCnt = adminService.tradelistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(tradeListCnt);    
	        map.put("cri", cri);
	        List<Map<String, Object>> list = adminService.tradelist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/sales";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/rentalAmount")
	public String rentalAmount(Model model, @RequestParam Map<String, Object> map, HttpSession session, Criteria cri) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int rentalAmountCnt = adminService.rentalAmountCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(rentalAmountCnt);    
	        map.put("cri", cri);
	        List<Map<String, Object>> list = adminService.rentalAmount(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/rentalAmount";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/product")
	public String product(Model model, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			
			return "/admin/product";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/notice")
	public String notice(Model model, HttpSession session, @RequestParam Map<String, Object> map, Criteria cri,
			@RequestParam(name="cate", required = false, defaultValue = "0") int cate) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			if(!map.containsKey("cate") || map.get("cate").equals(null) || map.get("cate").equals("")) {
				map.put("cate", 0);
			}
			// 전체 글 개수
	        int noticeListCnt = adminService.noticelistCnt(map);
	        
	        // 페이징 객체
	        Paging paging = new Paging();
	        paging.setCri(cri);
	        paging.setTotalCount(noticeListCnt);    
	        map.put("cri", cri);
	        List<Map<String, Object>> list = adminService.noticelist(map);
	        
	        model.addAttribute("list", list);    
	        model.addAttribute("paging", paging);
			return "/admin/notice";
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/nwrite")
	public String nwrite(HttpSession session, Model model) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			return "/admin/nwrite";
		} else {
			return "redirect:/index";
		}
	}
	
	@PostMapping("/nwrite")
	public String nwrite(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			map.put("mid", session.getAttribute("mid"));
			adminService.nwrite(map);
			return "redirect:/admin/notice";
		} else {
			return "redirect:/index";
		}
	}
	
	@ResponseBody
	@PostMapping("/ndetail")
	public String ndetail(@RequestParam(value = "nno", required = true) int nno, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			Map<String, Object> detail = adminService.ndetail(nno);
			JSONObject json = new JSONObject();
			json.put("detail", detail);
			return json.toString();
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/nedit")
	public String nedit(@RequestParam(value = "nno", required = true, defaultValue = "0") int nno
			, @RequestParam Map<String, Object> map, HttpSession session, Model model) {
		System.out.println(map);
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			map.put("mid", session.getAttribute("mid"));
			Map<String, Object> detail = adminService.ndetail(nno);
			model.addAttribute("detail", detail);
			model.addAttribute("cate", map.get("cate"));
			model.addAttribute("page", map.get("page"));
			return "/admin/nedit";
		} else {
			return "redirect:/index";
		}
	}
	
	@PostMapping("/nedit")
	public String nedit(@RequestParam Map<String, Object> map, HttpSession session) {
		System.out.println(map);
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			adminService.nedit(map);
			return "redirect:/admin/notice?cate=" + map.get("cate") + "&page=" + map.get("page");
		} else {
			return "redirect:/index";
		}
	}
	
	@GetMapping("/ndelete")
	public String delete(@RequestParam(value = "nno", required = true, defaultValue = "0") int nno
			, @RequestParam Map<String, Object> map, HttpSession session) {
		if(session.getAttribute("mid") != null && session.getAttribute("mname").equals("admin")) {
			map.put("bno", nno);
			map.put("mid", session.getAttribute("mid"));
			adminService.ndelete(map);
			return "redirect:/admin/notice?cate=" + map.get("cate") + "&page=" + map.get("page");
		} else {
			return "redirect:/index";
		}
	}
}
