package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;
import wishFit.beans.member.MemberDto;

@WebServlet(urlPatterns="/page/member/edit.kh")
public class MemberEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			// 프로필 사진 삭제 후 수정 : 
			
			
			req.setCharacterEncoding("UTF-8");
			
			MemberDto memberDto = new MemberDto();
			memberDto.setMemId((String)req.getSession().getAttribute("uid"));
			memberDto.setMemPw(req.getParameter("memPw"));
			memberDto.setMemNick(req.getParameter("memNick"));
			memberDto.setMemPhone(req.getParameter("memPhone"));
			
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.edit(memberDto);
			
			if(success) {
				resp.sendRedirect("mypage.jsp");  //마이페이지로 돌아가기?
			}
			else {
				resp.sendRedirect("edit.jsp?error");
			}
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
