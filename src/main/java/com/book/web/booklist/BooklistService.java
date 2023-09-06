package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BooklistService {

	@Autowired
	private BooklistDAO booklistDAO;

	public List<BooklistDTO> booklist(int bkcate) {
		return booklistDAO.booklist(bkcate);
	}

	public Map<String, Object> bookdetail(int bkno) {
		return booklistDAO.bookdetail(bkno);
	}

	public List<BooklistDTO> booktop() {
		return booklistDAO.booktop();
	}

	
	
}
