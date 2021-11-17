package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;
import wishFit.beans.member.MemberDto;

@WebServlet(urlPatterns="/page/member/findId.kh")
public class MemberFindIdServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			
			String memName = req.getParameter("memName");
			String memPhone = req.getParameter("memPhone");
			
			MemberDto memberDto = new MemberDto();
			memberDto.setMemName(memName);
			memberDto.setMemPhone(memPhone);
			
			MemberDao memberDao = new MemberDao();
			//memberDao.findId(memberDto);
			
			String memId = memberDao.findId(memberDto);
			System.out.println(memId);
			if( memId != null) {
				resp.sendRedirect("findId_result.jsp?mem_id="+memId);
				
			}	else {
				memId = "검색 결과가 없습니다.";
				resp.sendRedirect("findId_result.jsp?mem_id="+memId);
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
