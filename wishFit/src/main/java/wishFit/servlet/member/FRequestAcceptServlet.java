package wishFit.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.member.FRequestDao;
import wishFit.beans.member.FRequestDto;

// 친구 요청을 수락 서블릿
@WebServlet(urlPatterns="/member/friend/accept.kh")
public class FRequestAcceptServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			FRequestDto fRequestDto = new FRequestDto();
			fRequestDto.setFriendNo(Integer.parseInt(req.getParameter("friendNo")));
			fRequestDto.setStat(req.getParameter("stat"));
			
			FRequestDao fRequestDao = new FRequestDao();
			fRequestDao.edit(fRequestDto);
			
			resp.sendRedirect("friend_list.jsp");
		}	catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
