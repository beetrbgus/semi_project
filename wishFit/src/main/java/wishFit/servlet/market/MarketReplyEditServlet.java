package wishFit.servlet.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.market.MarketReplyDao;
import wishFit.beans.market.MarketReplyDto;
import wishFit.beans.reply.ReplyDao;
import wishFit.beans.reply.ReplyDto;
//@WebServlet(urlPatterns="/page/market/reply_edit.kh")
public class MarketReplyEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 댓글번호,댓글내용, 게시물 번호
			req.setCharacterEncoding("UTF-8");
			MarketReplyDto marketReplyDto = new MarketReplyDto();
			marketReplyDto.setReplyNo(Integer.parseInt(req.getParameter("replyNo")));
			marketReplyDto.setReplyPost(req.getParameter("replyPost"));
			marketReplyDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			
			
			//처리
			MarketReplyDao marketReplyDao = new MarketReplyDao();
			boolean success = marketReplyDao.edit(marketReplyDto);
		
			//출력
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+marketReplyDto.getBoardNo());
			}
			else {
				resp.sendError(404);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
