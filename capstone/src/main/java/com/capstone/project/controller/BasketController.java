package com.capstone.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.project.logic.Baskets;
import com.capstone.project.service.BasketService;

@Controller
public class BasketController {
	
	@Autowired
	BasketService basketService;

	@RequestMapping(value="/jquery/insert.do",method = RequestMethod.POST)
	public @ResponseBody int insertBasket(Baskets baskets,HttpSession session, HttpServletRequest httpServletRequest) {
		int insertCheck = 0;
		try{
			insertCheck = basketService.insertBasket(httpServletRequest.getParameter("insertID"),"red");
		}catch(Exception e) {
			insertCheck = 0;
		}
		return insertCheck;
	}
	

	@RequestMapping(value="/jquery/delete.do",method = RequestMethod.POST)
	public @ResponseBody int deleteBasket(Baskets baskets,HttpSession session, HttpServletRequest httpServletRequest) {
		int deleteCheck = basketService.deleteBasket(httpServletRequest.getParameter("deleteID"),"red");
		return deleteCheck;
	}
}