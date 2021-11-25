package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.MemberDao;
import wishFit.beans.member.MemberDto;


@WebServlet(urlPatterns="/login.kh")

public class MemberLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String memId = req.getParameter("memId");
			String memPw = req.getParameter("memPw");
			
			MemberDao memberDao = new MemberDao();
			MemberDto memberDto = new MemberDto();
			memberDto = memberDao.login(memId, memPw);
			
			 
			boolean login = memberDto.getMemId() !=null || !memberDto.getMemId().equals("");
			if(login) {

				req.getSession().setAttribute("uid", memId);
				req.getSession().setAttribute("grade", memberDto.getMemGrade()); //관리자
				
				resp.getWriter().write(memId);
			} 
		}	catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}
}
