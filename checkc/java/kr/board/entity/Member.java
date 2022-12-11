package kr.board.entity;

public class Member {

	//멤버 개개체를 설계하려고 하는데
	//어떤 설계가 잘한 설계인지 확인하기
	//멤버변수 = 프로퍼티(property)==속성==필드명ㄴ
	
	//1. 정보은닉
	private String memId;
	private String memPw;
	private String memName;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + "]";
	}
	
	//2. 멤버 변수에 데이ㅓ를 넣어주고 꺼냏어주는 메ㅗㅅ드 필요 게터세터
	
	
	//3 객체가 가지고 있는 데이터 전체를 String으로 기턴해주는 메소드
	
	
	//4 생성자 메소드
	//로그이ㄴ을 위해서 아이디 비번만 담긴 생성자
	//회원가입을 위해 아이디 비번 저노화번조 저잔 
	//선택적으로 ㅏㄴ들기 있음

}


