package com.test.first;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	

	@RequestMapping("/join.do")
		public void join() {
			
		}
	
	@RequestMapping("/pagenext.do")
		public String pagenext(String nextPage) {
		return nextPage;
		
	}
	
	@RequestMapping("/main")
	public void main() {
		
	}
	@RequestMapping("/main2")
	public void main2() {
		
	}
	
	@RequestMapping("/list.do")
	public void list() {
		
	}
	
	@RequestMapping("/list2.do")
	public void list2() {
		
	}
	
	

	@RequestMapping("/list3.do")
	public void list3() {
		
	}
	
	@RequestMapping("/stealSunok.do")
	public void stealSunok() {
		
	}
	
	
	
}

