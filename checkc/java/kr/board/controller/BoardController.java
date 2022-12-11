package kr.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.entity.Member;
import kr.board.mapper.BoardMapper;


//그냥 클래스가 아니라 POJO의 역할을 하는 컨트롤러임을 알려주는 주석(annotation)
//pojo임을 알려주는 어노테이션 자동 import 가능
//스프링 초창기에는 컴포넌트 쓰기도 했음

@Controller
public class BoardController {
	@Autowired
	private BoardMapper mapper;

	//get방식으로 넘어오므로
	//getMapping으로 사용가능<->postMapping
	@GetMapping("/boardAjaxMain.do")
	public String BoardAjaxMain() {
		
		return "basic";
	}
	
	@PostMapping("/Login.do")
	//form탤string 그에 담긴 memId,memPwm가 넘어오게됨 --> 파라미터 수집
	public String Login(Member mvo,HttpServletRequest request) {
		//입력받은 id pw 와 같은 정보가 있는지 확인
	
		Member loginMember=mapper.memberLogin(mvo);
		
		//만약에 회원의 정보를 가져왔다면, 즉 로그인 할 회원의정보가 있다면
		//세션에 저장
		if(loginMember != null) {
			//1. 세션 ㅅ객채 생성
			HttpSession session = request.getSession();
			//2 . 세션에 값 저장(회원정보 데이터를 객체바인딩 )
			session.setAttribute("loginMember", loginMember);
		}
		
		
		return "redirect:/boardAjaxMain.do";
		
	}
	
	@RequestMapping("/Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "redirect:/boardAjaxMain.do";
	}
	

}
