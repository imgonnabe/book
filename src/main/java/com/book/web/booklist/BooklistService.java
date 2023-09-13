package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;

	public List<BooklistDTO> list() {
		return booklistDAO.list();
	}

	public Map<String, Object> detail(int bkno) {
		return booklistDAO.detail(bkno);
	}

	public void detail2(CartDTO dto) {

		booklistDAO.detail2(dto);
	}

	public List<Map<String, Object>> cart(CartDTO dto) {

		return booklistDAO.cart(dto);
	}

	public int delete(Map<String, Object> map) {

		return booklistDAO.delete(map);
	}
	public int delete2(Map<String, Object> map) {
		
		return booklistDAO.delete2(map);
	}

	public void cart2(CartDTO dto) {
		booklistDAO.cart2(dto);
	}

	public List<Map<String, Object>> purchase(String mid) {
		
		return booklistDAO.purchase(mid);
	}
	
	

	public void stockupdate(Map<String, Object> map) {
		booklistDAO.stockupdate(map);
		
	}

	public void insert(Map<String, Object> map) {
		booklistDAO.insert(map);
		
	}

	
	public void delete3(Map<String, Object> map) {
		booklistDAO.delete3(map);
	}
	
	
}
