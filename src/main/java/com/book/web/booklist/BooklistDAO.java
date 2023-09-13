package com.book.web.booklist;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BooklistDAO {

	List<BooklistDTO> list();

	Map<String, Object> detail(int bkno);

	void detail2(CartDTO dto);

	List<Map<String, Object>> cart(CartDTO dto);

	int delete(Map<String, Object> map);

	int delete2(Map<String, Object> map);

	void cart2(CartDTO dto);

	List<Map<String, Object>> purchase(String mid);

	/* List<Map<String, Object>> list(String mid); */
	
	void stockupdate(Map<String, Object> map);
	
	void insert(Map<String, Object> map);

	void delete3(Map<String, Object> map);


}
