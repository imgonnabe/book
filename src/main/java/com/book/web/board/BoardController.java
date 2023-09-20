package com.book.web.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.web.notification.NotificationService;



@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/boardM")
	public String boardM(Model model ) {
		List<Map<String,Object>> board1= boardService.board1();
		List<Map<String,Object>> board2= boardService.board2();
		List<Map<String,Object>> board3= boardService.board3();
		List<Map<String,Object>> board4= boardService.board4();
		model.addAttribute("board1", board1);
		model.addAttribute("board2", board2);
		model.addAttribute("board3", board3);
		model.addAttribute("board4", board4);
		return "boardM";
	}
	
	// 보드 보여주기 ( 페이징 / 검색 포함 )
	@GetMapping("/board")
	public String board(@RequestParam(value="board", required =false, defaultValue="1")int board,@RequestParam Map<String,Object>map, Model model, 
		@RequestParam(value="pageNo", required = false, defaultValue = "1")int pageNo,PagDTO pagDTO) {
		if(map.get("searchV") == null || map.get("searchV") == "")
		{
		int total = boardService.total(board);    
		pagDTO.setPageNo(pageNo);
		pagDTO.setContentNo(10);
		pagDTO.setTotalcount(total);
		pagDTO.setCurrentblock(pageNo);
		pagDTO.setLastblock(pagDTO.getTotalcount());
		pagDTO.setStartPage(pagDTO.getCurrentblock());
		pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
		pagDTO.prevnext(pageNo);
		pagDTO.prenex(pageNo);
		Map<String,Object> num = new HashMap<String, Object>();
		num.put("pageNo", (pagDTO.getPageNo()-1)*10);
		num.put("contentNo", pagDTO.getContentNo());
		num.put("board", board);
		List<Map<String,Object>> boardList = boardService.boardList();
		List<Map<String,Object>> list = boardService.list(num);
		String boardName= boardService.name(board);
		model.addAttribute("name", boardName);
		model.addAttribute("list",list);
		model.addAttribute("boardList",boardList);
		model.addAttribute("pag",pagDTO);
		return "board";}
		else {
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			num.put("board", board);
			map.put("pageNo", (pagDTO.getPageNo()-1)*10);
			map.put("contentNo", pagDTO.getContentNo());
			int total = boardService.total2(map);
			System.out.println(total);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			List<Map<String,Object>> boardList = boardService.boardList();
			List<Map<String,Object>> list = boardService.list(num);
			String boardName= boardService.name(board);
			model.addAttribute("name", boardName);
			model.addAttribute("list",list);
			model.addAttribute("boardList",boardList);
			model.addAttribute("pag",pagDTO);
			List<Map<String,Object>> searchlist = boardService.searchlist(map);
			model.addAttribute("list",searchlist);
			return "board"; 
			}
		
	}
	// 글쓰기 - 로그인 해야 작성 가능 및 해당 아이디 가져가는 기능 추가필요
	@GetMapping("/bwrite")
	public String bwrite(@RequestParam(value="board", required =false, defaultValue="1")int board, Model model) {
		
		model.addAttribute("board", board);
		return "bwrite";
		
		
	}
	// 글쓴거 보내는 작동
	@PostMapping("/bwrite")
	public String bwrite(@RequestParam Map<String, Object> map) {
		map.put("mno", 119);
		boardService.bwrite(map);
		return "redirect:/board?board="+map.get("board");
		
	}
	// 
	@GetMapping("/bdetail")
	public String bdetail(@RequestParam Map<String,Object> map , Model model ) {
		Map<String, Object> bdetail = boardService.bdetail(map);
		boardService.viewUp(bdetail);
		model.addAttribute("bdetail", bdetail);
		List<Map<String, Object>> commentsList = boardService.commentsList(map);
		model.addAttribute("commentsList",commentsList);
		return "bdetail";
	}
	
	// 댓글 
	@PostMapping("/comment")
	public String comment(@RequestParam Map<String,Object>map, HttpSession session) {
		map.put("mno", 119);
		int result = boardService.commentInsert(map);
		System.out.println(map.get("bno"));
		if(result == 1) {
			return "redirect:/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
		}
			return "board";
	}
	

	@GetMapping("/edit")
	public String edit(@RequestParam(value= "bno", required = true)int bno, Model model) {
		System.out.println(bno);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mno", 1);
		map.put("bno", bno);
		Map<String,Object> result= boardService.bdetail(map);
		model.addAttribute("result", result);
		return "/edit";
		
	}
	//게시물 수정
	@PostMapping("/edit")
	public String edit2(@RequestParam Map<String,Object> map) {
		System.out.println(map);
		boardService.edit(map);
	
		return "redirect:/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
	}
	
	//게시물 삭제
	
	@GetMapping("/bdelete")
	public String bdelete(@RequestParam(value= "bno", required = true)int bno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mno", 1);
		map.put("bno", bno);
		boardService.deleteb(map);
		return "redirect:/board";
		
		 
	}
	
	//댓글삭제
	
	@ResponseBody
	@PostMapping("/cdelR")
	public String cdel(@RequestParam Map<String,Object> map , HttpSession session) {
		JSONObject json = new JSONObject();
		int result = boardService.cdel(map);
		json.put("result", result);
		return json.toString();
	}
	//댓글 수정 
	@PostMapping("/cedit")
	public String cedit(@RequestParam Map<String,Object>map) {
		int result =boardService.cedit(map);
		return "redirect:/bdetail?board="+map.get("board")+"&bno="+map.get("bno");
	}
	// ㅡㅡㅡㅡㅡ notice ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	@GetMapping("/notice")
	public String notice(@RequestParam(value="board", required =false, defaultValue="1")int board,@RequestParam Map<String,Object>map, Model model, 
			@RequestParam(value="pageNo", required = false, defaultValue = "1")int pageNo,PagDTO pagDTO) {
		if(map.get("searchV") == null || map.get("searchV") == "")
		{
		int total = boardService.ntotal(board);    
		pagDTO.setPageNo(pageNo);
		pagDTO.setContentNo(10);
		pagDTO.setTotalcount(total);
		pagDTO.setCurrentblock(pageNo);
		pagDTO.setLastblock(pagDTO.getTotalcount());
		pagDTO.setStartPage(pagDTO.getCurrentblock());
		pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
		pagDTO.prevnext(pageNo);
		pagDTO.prenex(pageNo);
		Map<String,Object> num = new HashMap<String, Object>();
		num.put("pageNo", (pagDTO.getPageNo()-1)*10);
		num.put("contentNo", pagDTO.getContentNo());
		num.put("board", board);
		List<Map<String,Object>> nlist = boardService.nlist(num);
		List<Map<String,Object>> nboardList = boardService.nboardList();
		model.addAttribute("nlist", nlist);
		model.addAttribute("nboardList",nboardList);
		model.addAttribute("pag",pagDTO);
		return "notice";
		}else {
			pagDTO.setPageNo(pageNo);
			pagDTO.setContentNo(10);
			Map<String,Object> num = new HashMap<String, Object>();
			num.put("pageNo", (pagDTO.getPageNo()-1)*10);
			num.put("contentNo", pagDTO.getContentNo());
			num.put("board", board);
			map.put("pageNo", (pagDTO.getPageNo()-1)*10);
			map.put("contentNo", pagDTO.getContentNo());
			int total = boardService.ntotal2(map);
			pagDTO.setTotalcount(total);
			pagDTO.setCurrentblock(pageNo);
			pagDTO.setLastblock(pagDTO.getTotalcount());
			pagDTO.setStartPage(pagDTO.getCurrentblock());
			pagDTO.setEndPage(pagDTO.getLastblock(), pagDTO.getCurrentblock());
			pagDTO.prevnext(pageNo);
			pagDTO.prenex(pageNo);
			List<Map<String,Object>> nlist = boardService.nlist(num);
			List<Map<String,Object>> nboardList = boardService.nboardList();
			model.addAttribute("nlist",nlist);
			model.addAttribute("nboardList",nboardList);
			model.addAttribute("pag",pagDTO);
			List<Map<String,Object>> nsearchlist = boardService.nsearchlist(map);
			model.addAttribute("nlist",nsearchlist);	
			
		return "notice"; 
		}
	}
	
	@GetMapping("/ndetail")
	public String ndetail(@RequestParam Map<String,Object> map , Model model ) {
		Map<String, Object> ndetail = boardService.ndetail(map);
		boardService.nviewUp(ndetail);
		model.addAttribute("ndetail", ndetail);
		System.out.println(ndetail);
		return "ndetail";
	}
	@GetMapping("/nedit")
	public String nedit(@RequestParam(value= "nno", required = true)int nno, Model model) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mno", 1);
		map.put("nno", nno);
		Map<String,Object> result= boardService.ndetail(map);
		model.addAttribute("result", result);
		return "/nedit";
		
	}
	//게시물 수정
	@PostMapping("/nedit")
	public String nedit2(@RequestParam Map<String,Object> map) {
		
		boardService.nedit(map);
	
		return "redirect:/ndetail?board="+map.get("board")+"&nno="+map.get("nno");
	}
	@GetMapping("/ndelete")
	public String ndelete(@RequestParam(value= "nno", required = true)int nno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mno", 1);
		map.put("nno", nno);
		boardService.ndelete(map);
		return "redirect:/notice";
		
		 
	}
	
	@GetMapping("/noticeM")
	public String noticeM(Model model) {
		List<Map<String,Object>> qna = boardService.qna();
		model.addAttribute("qna", qna);
		
		return "noticeM";
	}
	
	@GetMapping("/nwrite")
	public String nwrite(@RequestParam(value="board", required =false, defaultValue="1")int board, Model model) {
		
		model.addAttribute("board", board);
		return "nwrite";
		
		
	}
	// 글쓴거 보내는 작동
	@PostMapping("/nwrite")
	public String nwrite(@RequestParam Map<String, Object> map) {
		map.put("mno", 1);
		boardService.nwrite(map);
		return "redirect:/notice?board="+map.get("board");
		
	}



}
