package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;
import wishFit.beans.member.MemberDto;

@WebServlet(urlPatterns="/page/member/findPw.kh")
public class MemberFindPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		req.setCharacterEncoding("UTF-8");
		
		String memId = req.getParameter("memId");
		String memPwQ = req.getParameter("memPwQ");
		String memPwA = req.getParameter("memPwA");
		
		MemberDto memberDto = new MemberDto();
		memberDto.setMemId(memId);
		memberDto.setMemPwQ(memPwQ);
		memberDto.setMemPwA(memPwA);
		
		MemberDao memberDao = new MemberDao();
		
		String memPw = memberDao.findPw(memberDto);
		
		if(memPw != null) {
			resp.sendRedirect("findPw_result.jsp?mem_pw="+memPw);
		} else {
			memPw = "검색 결과가 없습니다.";
			resp.sendRedirect("findPw_result.jsp?mem_pw="+memPw);
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
