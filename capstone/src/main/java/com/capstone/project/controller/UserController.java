package com.capstone.project.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.project.logic.Lists;
import com.capstone.project.logic.Members;
import com.capstone.project.service.ListService;
import com.capstone.project.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	ListService listService;
	

	@RequestMapping(value = "/jquery/logout.do",method = RequestMethod.POST)
	public @ResponseBody String logout(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession();
		session.invalidate();
		return "1";
	}

	@RequestMapping(value="/jquery/login.do",method = RequestMethod.POST)
	public @ResponseBody String login(Members members,HttpSession session, HttpServletRequest httpServletRequest) {
		int result = 0; 
		String col = null;
		col = "userId";
		Members userIdCheck = userService.getUserOne(httpServletRequest.getParameter("userId"),col);
		if(userIdCheck == null) {
			result = 2;
		}else {
			if(httpServletRequest.getParameter("userId").equals(userIdCheck.getId())) {
				//ID OK
				if(httpServletRequest.getParameter("password").equals(userIdCheck.getPw())) {
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


	@RequestMapping(value="/user/jquery/signUp.do",method = RequestMethod.POST)
	public @ResponseBody String signUp(Members member, HttpServletRequest httpServletRequest) {
		int result = 0; 
		String col = null;
		col = "userId";
		Members userIdCheck = userService.getUserOne(httpServletRequest.getParameter("userId"),col);
		if(userIdCheck != null) result = 2; 
		else{
			member.setId(httpServletRequest.getParameter("userId"));
			member.setPw(httpServletRequest.getParameter("userPw"));
			member.setEmail(httpServletRequest.getParameter("email"));
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
	
	@RequestMapping(value="user/manual",method = RequestMethod.GET)
	public ModelAndView manual() {
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
		String ret ="";
		try {
			Members save  = userService.getFurn(httpServletRequest.getParameter("ID"));
			ret = save.getRoom();
		}catch (Exception e) {
			ret = "no";
		}
		return ret;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	Document doc;
	
	
	public void LIVARTScraping(Lists list) throws IOException{
		String[] domain = { "http://mall.hyundailivart.co.kr/front/category1List_org.lv?cate1cd=CATE00000001", 
				"http://mall.hyundailivart.co.kr/front/category1List_org.lv?cate1cd=CATE00000003",
				"http://mall.hyundailivart.co.kr/front/category1List_org.lv?cate1cd=CATE00000004",
				"http://mall.hyundailivart.co.kr/front/category1List_org.lv?cate1cd=CATE00000002"
				};
		String[] types = { "bad", "table", "chair", "sofa"};
		String URL="";
		Document doc2;
		Elements elem, ielem;
		Elements pelem;
		Element im;
		int num = 210;
		String brand = "LIVART";
		int idx = 0;
		String name = "";
		
		
		
		System.out.println("livart 시작");
		try {
			for(int i = 0 ; i < 4 ; i++ ) {
				doc = Jsoup.connect(domain[i]).get();
				//elem = doc.select("div[class=\"range-page-title\"]");
				list.setType(types[i]);
				list.setBrand(brand);
				list.setColor("brown");
				list.setModeling("X");
				
				/*
				OutputStream output = new FileOutputStream("Output.txt");
			    String str = doc.html();
			    byte[] by=str.getBytes();
			    output.write(by);
				*/
				
				elem = doc.select("div[class=\"txtArea\"]");
				ielem = doc.select("div[class=\"imgArea\"]");
				
				for(Element e : elem.select("a[href]")) {
					if(!URL.equals(e.attr("abs:href"))) {
						im = ielem.select("img[src]").first();
						URL = e.attr("abs:href");
						list.setImage(im.attr("abs:src"));
						ielem.remove(0);
						doc2 = Jsoup.connect(URL).get();
						list.setDetail(URL);
						list.setNum(num++);
						
						/*
						pelem = doc2.select("div[class=\"detailLarge\"]");
						list.setImage(pelem.select("img[src]").attr("abs:src"));
						*/
						pelem = doc2.select("div[class=\"detailHeader\"]");
						name = pelem.select("h3").text();
						System.out.println(name + " : " + name.indexOf('['));
						
						list.setName(name.substring(name.indexOf(']')+1));
						pelem = doc2.select("span[class=\"del\"]");
						//System.out.println("current : " + list.getDetail() + "   " + list.getName());
						StringBuilder temp = new StringBuilder(pelem.select("span[class=\"font-num\"]").text());
						System.out.println("price : " + temp);
						while((idx = temp.indexOf(",")) != -1) {
							temp.deleteCharAt(idx);
						}
						list.setPrice(Integer.parseInt(temp.toString()));
						listService.insertFurn(list);
						//System.out.println(list.toString());
					}
				}

			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	// IKEA 가구중에서 책상 카테고리 제품 크롤링 테스트
	public void IKEAScraping(Lists list) throws IOException {
		String[] domain = { "https://www.ikea.com/kr/ko/cat/tables-desks-fu004/?page=5", 
				"https://www.ikea.com/kr/ko/cat/bookcases-shelving-units-st002/?page=5",
				"https://www.ikea.com/kr/ko/cat/chests-of-drawers-drawer-units-st004/?page=5",
				"https://www.ikea.com/kr/ko/cat/chairs-fu002/?page=5",
				"https://www.ikea.com/kr/ko/cat/wardrobes-19053/?page=5",
				"https://www.ikea.com/kr/ko/cat/cabinets-cupboards-st003/?page=2",
				"https://www.ikea.com/kr/ko/cat/beds-bm003/?page=5",
				"https://www.ikea.com/kr/ko/cat/all-sofas-39130/?page=5"};
		String URL="";
		Document doc2;
		Elements elem;
		Elements pelem;
		int num = 1;
		String brand = "IKEA";
		int idx = 0;
		int count = 0;
		
		
		
		System.out.println("test 시작");
		try {
			for(int i = 0 ; i < 8 ; i++ ) {
				doc = Jsoup.connect(domain[i]).get();
				elem = doc.select("div[class=\"range-page-title\"]");
				list.setType(elem.select("h1").text());
				list.setBrand(brand);
				list.setColor("brown");
				list.setModeling("X");
				
				elem = doc.select("div[class=\"product-compact__spacer\"]");
				
				for(Element e : elem.select("a[href]")) {
					if(!URL.equals(e.attr("abs:href"))) {
						count++;
						URL = e.attr("abs:href");
						doc2 = Jsoup.connect(URL).get();
						list.setDetail(URL);
						list.setNum(num++);
						
						pelem = doc2.select("div[class=\"range-carousel__image\"]");
						list.setImage(pelem.select("img[src]").attr("abs:src"));
						
						pelem = doc2.select("div[class=\"product-pip__right-container\"]");
						list.setName(pelem.select("span[class=\"product-pip__name\"]").text());
						//list.setPrice(pelem.select("span[class=\"product-pip__price__value\"]").text());
						StringBuilder temp = new StringBuilder(pelem.select("span[class=\"product-pip__price__value\"]").text().substring(2));
						while((idx = temp.indexOf(",")) != -1) {
							temp.deleteCharAt(idx);
						}
						list.setPrice(Integer.parseInt(temp.toString()));
						listService.insertFurn(list);
						System.out.println(list.toString());
					}
				}
				System.out.println(i + " : " + count);
				count = 0;
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}