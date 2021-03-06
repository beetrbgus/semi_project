package wishFit.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wishFit.beans.reply.ReplyDao;
import wishFit.beans.reply.ReplyDto;
@WebServlet(urlPatterns={"/page/market/reply_edit.kh","/page/community/reply_edit.kh"})
public class ReplyEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			req.setCharacterEncoding("UTF-8");
			HttpSession session = req.getSession();
			String uid = (String) session.getAttribute("uid");
			
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyNo(Integer.parseInt(req.getParameter("replyNo")));
			replyDto.setReplyPost(req.getParameter("replyPost"));
			replyDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			//replyDto.setReplyId("testuser");
			
			
			//처리
			ReplyDao replyDao =new ReplyDao();
			boolean success = replyDao.edit(replyDto);
						
			//출력
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+replyDto.getBoardNo());
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
