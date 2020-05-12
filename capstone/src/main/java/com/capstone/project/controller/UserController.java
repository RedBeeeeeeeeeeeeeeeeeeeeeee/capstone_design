package com.capstone.project.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.project.logic.Members;
import com.capstone.project.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/jquery/logout.do")
	public @ResponseBody String logout(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		session.invalidate();
		return "1";
	}

	@RequestMapping(value="/user/jquery/login.do",method = RequestMethod.POST)
	public @ResponseBody String login(Members members,HttpSession session, HttpServletRequest httpServletRequest) {
		int result = 0; 
		String col = null;
		col = "userId";
		Members userIdCheck = userService.getUserOne(httpServletRequest.getParameter("userId"),col);
		if(userIdCheck == null) {
			result = 2;
		}else {
			if(httpServletRequest.getParameter("userId").equals(userIdCheck.getUserId())) {
				//ID OK
				if(httpServletRequest.getParameter("password").equals(userIdCheck.getPassword())) {
					//PW OK 
					session.setAttribute("loginUser", userIdCheck);
					result = 3;
				}else {
					result = 2;
				}

			}else {
				//ID not OK
				result = 2;
			}
		}
		return Integer.toString(result);
	}


	@RequestMapping(value="/jquery/signUp.do",method = RequestMethod.POST)
	public @ResponseBody String signUp(Members member, HttpServletRequest httpServletRequest) {
		int result = 0; 
		String col = null;
		col = "userId";
		Members userIdCheck = userService.getUserOne(httpServletRequest.getParameter("userId"),col);
		if(userIdCheck != null) {
			result = 2; 
		}
		col = "userName";
		Members userNicknameCheck = userService.getUserOne(httpServletRequest.getParameter("userName"),col);
		if(userNicknameCheck != null) { result = 3; }	
		if(result < 2) {
			member.setUserId(httpServletRequest.getParameter("userId"));
			member.setPassword(httpServletRequest.getParameter("userPw"));
			member.setNickname(httpServletRequest.getParameter("userName"));
			result = userService.userJoin(member);	
		}
		return Integer.toString(result);
	}

	@RequestMapping(value="/modal/modal_signIn", method=RequestMethod.GET)
	public String callSignIn() {
		return "/modal/modal_signIn";
	}

	@RequestMapping(value="user/home",method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping(value="user/login",method = RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}


	@RequestMapping(value="/jquery/save.do",method = RequestMethod.POST)
	public @ResponseBody int save(Members member,HttpSession session, HttpServletRequest httpServletRequest) {
		int save  = userService.setFurn(httpServletRequest.getParameter("ID"),httpServletRequest.getParameter("route"));
		return save;
	}

	@RequestMapping(value="/jquery/load.do",method = RequestMethod.POST)
	public @ResponseBody String load(Members member,HttpSession session, HttpServletRequest httpServletRequest) {

		String save  = userService.getFurn(httpServletRequest.getParameter("ID"));

		return save;
	}

}