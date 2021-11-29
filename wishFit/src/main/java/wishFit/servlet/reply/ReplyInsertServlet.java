package wishFit.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wishFit.beans.board.BoardDao;
import wishFit.beans.reply.ReplyDao;
import wishFit.beans.reply.ReplyDto;
import wishFit.beans.reply.ReplyVo;
@WebServlet(urlPatterns ={"/page/market/reply_insert.kh","/page/community/reply_insert.kh"})
public class ReplyInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			HttpSession session = req.getSession();
			String uid =(String)session.getAttribute("uid");
		
			req.setCharacterEncoding("UTF-8");
			ReplyDto replyDto = new ReplyDto();
			replyDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			replyDto.setReplyPost(req.getParameter("replyPost"));
			replyDto.setReplyId(uid);
			//replyDto.setReplyId("testuser");
			
			//처리
			ReplyDao replyDao = new ReplyDao();
			
			replyDao.insert(replyDto);
			
			
			
			
			//댓글수 증가 처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.refreshReplyCount(replyDto.getBoardNo());
			
			//페이지 이동 
			resp.sendRedirect("detail.jsp?boardNo="+replyDto.getBoardNo());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
