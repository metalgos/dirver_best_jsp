package com.member.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.member.entity.Member;

@Mapper
public interface MemberMapper {
 
	public void memberInsert(Member member);

	public Member memberLogin(Member member);

	public Member memberSelect(int m_no);

	public void memberUpdate(Member member);

	public void sleepyinsert(int m_no);
	
	public void sleepydelete(int m_no);
	
	public String sleepyselect(int m_no);
	
public void theafinsert(int m_no);
	
	public void theafdelete(int m_no);
	
	public String theafselect(int m_no);
	
	
}
