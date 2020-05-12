package com.capstone.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.capstone.project.logic.Lists;
import com.capstone.project.service.ListService;

@Controller
public class ListController {
	
	@Autowired
	ListService listService;

	@RequestMapping(value="/jquery/list.do",method = RequestMethod.POST)
	public @ResponseBody List<Lists> list(Lists lists,HttpSession session, HttpServletRequest httpServletRequest) {
		List<Lists> listCheck = listService.getListOne(httpServletRequest.getParameter("type"),
													   httpServletRequest.getParameter("brand"),
													   httpServletRequest.getParameter("price"));
		
		for(int i = 0; i < listCheck.size(); i++) {
				System.out.println(listCheck.get(i).getNum() +" "+ listCheck.get(i).getFurnName()+" "+listCheck.get(i).getType()+" "+listCheck.get(i).getBrand()+" "+listCheck.get(i).getPrice()+" "+listCheck.get(i).getImgLink()+" "+listCheck.get(i).getDetailLink());
		}
		return listCheck;
	}
	
	@RequestMapping(value="/jquery/basket.do",method = RequestMethod.POST)
	public @ResponseBody List<Lists> basket(Lists lists,HttpSession session, HttpServletRequest httpServletRequest) {
		List<Lists> basketCheck = listService.getBasketList(httpServletRequest.getParameter("ID"));

		return basketCheck;
	}


}