package com.member.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.member.entity.Member;
import com.member.mapper.MemberMapper;





@Controller
public class MemberController {
	@Autowired
	private MemberMapper mapper;
	
	 
	@RequestMapping("/memberInsert.do")
	public String memberInsert(Member member) {
		mapper.memberInsert(member);
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping("/memberLogin.do")
	public String memberLogin(Member member, HttpSession session) {
		Member loginMember=mapper.memberLogin(member);
		
		if(loginMember == null) {
			return "redirect:index.jsp";
		}
		else {
		session.setAttribute("loginMember", loginMember);
			return "main";
		}
		
	}
	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:index.jsp";
	}
	
	
	
	
	
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(Member member, HttpSession session) {
		mapper.memberUpdate(member);
		Member loginMember=mapper.memberSelect(member.getM_no());
		session.setAttribute("loginMember", loginMember);
		return "Mypage";
		
	}
	
	
	

	
	
		
	}

	

