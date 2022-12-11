package kr.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;





@RestController
public class BoardRestController {

	//전에 pojo라는 것을 알려주기 위해서 @controller 라고 표시
	// 이 컨트롤러는 json데이터를 주고받기 위한 전문적인 컨트롤러의 역활로

	//게시판에 대한 요청을 다 board로 보내고 받고 하는데
	//어떤 내용을 실행할지를 구분하는 것은 요청 보내는 방식 get post put(update( delete
	//RESTful 규약
	
	//만들어놓은 mapper객체 불러오기
	//의존성주입(DI)
	@Autowired
	private BoardMapper mapper;



	//ajax에서 get방식으로 보내오고 잇음
	//@ResponseBody 쓰지않아도 @restcontroller에 의해서 알아서 데이터 보냄을 인식
		@GetMapping("/board")
		public List<Board> boardAjaxList() {
			// 1)db에서 게시판 리스트 가져오기
			List<Board> list = mapper.boardList();
			
			//2:가져온 데이털ㄹ json형식으로 바꿔준다.
			//2-1 예전 다이나믹 웹 프로젝트여서 Gson.jar파일 넣어서
			//Gson 이 api가 json형식을 처리할수 있게 만들었음(toJson)
			//maven프로젝트였으면 pom.xml에 디펜던시를 넣어서 처리 가능
			//2-2  클래스 앞 return에다가 데이터 돌려줄때 jsp가 아님을 표시@ResponseBody
			// pom.xml에다가 jackson라이브러리 넣어줘야함x
			
			//3.json데이터를 클라이언트에게 ajax로 보내준다.
			//jsp이동을 하지 않는다.
			
			
			//return에는 1)jsp 2) redirect:/요청 3)데이터를 넣어줄 수 있다.
			return list;
		}
	//post방식의 요청
		//스프링이 파라미터 수집을 알아서 해오는데
		//넘어올떄 Board객체의 property와
		//넘어오는 name값이 일치하면
		@PostMapping("/board")
		public void boardAjaxInsert(Board vo) {
			mapper.boardInsert(vo);
				}
	
		@DeleteMapping("/board/{idx}")
		public void boardAjaxDel(@PathVariable int idx) {
			mapper.boardDelete(idx);
			
		}
		@PutMapping("/board")
		//2) json 형식으로 데이터를 받아오기때문에 그냥 파라미터가 아님을 @RequestBody가 표시
		public void boardAjaxUpdate(@RequestBody Board vo) {//idx, content가 넘어오면 Board로 파라미터수집
			//1)mapper 일 시켜줘야하는데
			//전에 만들었던 mapper.xml의  update 태그에 담긴 sql문은 title까지 수정이었음
			//content만 바꿔주는 메소드 새로 만들기
			mapper.boardContentUpdate(vo);
			
		}
		
		@GetMapping("/updateCount/{idx}")
		public Board updateCount(@PathVariable int idx) {
			mapper.updateCount(idx);
			//db에 있는 조회수를 가져와 갱신시켜줘야함
			//게시글 내용 불러오는 mapper메소들 일시켜서 반환받아야함
			Board vo = mapper.boardContent(idx);
			
			return vo;
		}
}

