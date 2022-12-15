package kr.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;
import kr.board.entity.Member;

//우리가 알고있는 dao와 같은 일을 하는것을 알려주는 주석
//@Repository
//mybartis에서 mapper를 인식하는 주석
@Mapper

//0. 매퍼는 인터페이스 파일로 만든다.
public interface BoardMapper {
	//자바코드의 sql문을 따로 관리
	//이 둘을 이어주는 연결의 으미로 mapper라는 의미가 강해서 dao보다 mapper라는 표현을 사용
	
	//dao 에서 조인,로그인 메소드 만들기
	//dao에서는 sqlsesstionfactory 만들어서 커넥션푸을 유지하고 있었음
	//db연결은 스프링에서 알아서 만들어 주고 있기 때문에 굳이 만들필요가 없다
	//스프링에서는 별도의 xml파일에서 db커낵션을 이루고 있다.
	
	
	//1. BoardController의 메소드와 이름을 이치시켜 만든다.
	//select의 결과물로 xml에서 resultType과 같은 반환타입으로 메소드 리턴타입을 만들어줘야한다.
	public List<Board> boardList() ;
		
		//sql문은 xml문에 만든다
		//쿼리 연결 위해서는 mybatis이용 -->추상메소드
	//인터페이스에서는 구현부가 업싱 끝남. 그러면 boardmapper는 클래스가 아니라 인터페이스로 만들어야 한다.
	
	public void boardInsert(Board vo);

	public Board boardContent(int idx);
	
	public void boardUpdate(Board vo);

//@Delete("sql문")-->이렇게 사용하려면 mapper.xml에서 또 만들지 않아야함
	//@어노테이션으로 sql문 관리하면 xml이 필요하지 않게됨
	public void boardDelete(int idx);

	@Update("update board set content = #{content} where idx=#{idx}")
	public void boardContentUpdate(Board vo);

	@Update("update board set count=count+1 where idx=#{idx}")
	public void updateCount(int idx);

	public Member memberLogin(Member mvo);

	
}
