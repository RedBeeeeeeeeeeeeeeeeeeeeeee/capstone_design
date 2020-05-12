package com.capstone.project.dao;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BasketDAO {

	@Autowired
	public SqlSession sqlSession;
	
	public int insertBasket(String insertID, String num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("insertID",insertID);
		map.put("num",num);
		return sqlSession.insert("insertBasket",map);
	}

	public int deleteBasket(String deleteID, String num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("deleteID",deleteID);
		map.put("num",num);
		return sqlSession.delete("deleteBasket", map);
	}

	
}
