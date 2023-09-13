package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BooklistController {

	@Autowired
	private BooklistService booklistService;

	@GetMapping("/booklist")
	public String list(Model model) {
		List<BooklistDTO> list = booklistService.list();
		model.addAttribute("list", list);

		return "booklist";
	}

	@GetMapping("/bookdetail")
	public String detail(@RequestParam("bkno") int bkno, Model model) {

		Map<String, Object> detail = booklistService.detail(bkno);
		model.addAttribute("detail", detail);

//System.out.println(detail);

		return "bookdetail";
	}

	@PostMapping("/test")
	public String detail2(CartDTO dto, HttpSession session) {

		dto.setMid((String) session.getAttribute("mid"));

		// System.out.println(dto.getMid());
		List<Map<String, Object>> cartList = booklistService.cart(dto);

		// System.out.println(cartList);

		boolean matchingItemFound = false;

		for (int i = 0; i < cartList.size(); i++) {
			if (cartList.get(i).get("bkno").equals(dto.getBkno())) {
				booklistService.cart2(dto);
				matchingItemFound = true;
				break;
			}
		}

		if (!matchingItemFound) {
			// If no matching item is found, proceed to detail2
			booklistService.detail2(dto);
		}

		return "redirect:/test";
	}

	@GetMapping("/test")
	public String cart(Model model, HttpSession session) {
		CartDTO dto = new CartDTO();
		dto.setMid((String) session.getAttribute("mid"));
		List<Map<String, Object>> cart = booklistService.cart(dto);

		model.addAttribute("cart", cart);

		return "/test";
	}

	@ResponseBody
	@GetMapping("/delete")
	public String delete(@RequestParam Map<String, Object> map) {

		int result = booklistService.delete(map);
		int result2 = booklistService.delete2(map);

		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();

	}

	@GetMapping("/purchase")
	public String purchase(Model model, HttpSession session) {

		List<Map<String, Object>> map = booklistService.purchase((String) session.getAttribute("mid"));

		// System.out.println(map);
		model.addAttribute("map", map);

		return "/purchase";
	}

	/*
	 * @PostMapping("/check") public String purchase(@RequestParam Map<String,
	 * Object> map, HttpSession session, CartDTO cart) {
	 * 
	 * cart.setMid((String) session.getAttribute("mid"));
	 * 
	 * List<Map<String, Object>> cartList = booklistService.cart(cart);
	 * 
	 * for (int i = 0; i < cartList.size(); i++) { if ((int)
	 * cartList.get(i).get("amount") >= (cart.getAmount())) {
	 * 
	 * 
	 * return "redirect:/purchase";
	 * 
	 * }
	 * 
	 * } return "redirect:/test"; }
	 * 
	 * 
	 */
	
	

	

	@PostMapping("/purchase")
	public String transaction(CartDTO cart, HttpSession session) {

		cart.setMid((String) session.getAttribute("mid"));

		List<Map<String, Object>> cartlist = booklistService.cart(cart);

		
		System.out.println(cartlist);
		for (int i = 0; i < cartlist.size(); i++) {

			booklistService.stockupdate(cartlist.get(i));

		}

		for (int i = 0; i < cartlist.size(); i++) {
			booklistService.insert(cartlist.get(i));

		}
		
		for (int i = 0; i < cartlist.size(); i++) {
			booklistService.delete3(cartlist.get(i));

		}
		
		

		return "redirect:/booklist";
	}

}
