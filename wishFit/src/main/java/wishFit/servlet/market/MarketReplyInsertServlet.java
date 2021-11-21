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
//@WebServlet(urlPatterns="/page/market/reply_insert.kh")
public class MarketReplyInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			req.setCharacterEncoding("UTF-8");
			MarketReplyDto marketReplyDto = new MarketReplyDto();
			marketReplyDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			marketReplyDto.setReplyPost(req.getParameter("replyPost"));
			
			
			//처리 : 댓글 등록
			MarketReplyDao marketReplyDao = new MarketReplyDao();
			int replyNo = marketReplyDao.getSequence();
			marketReplyDto.setReplyNo(replyNo);
			
			marketReplyDto.setReplyId("testuser");//임시 댓글 작성자 설정
			//replyDto.setReplyId(String)req.getSession().getAttribute("ses")); 로그인 기능 구현 이후
			
			marketReplyDao.insert(marketReplyDto);			
			
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+marketReplyDto.getBoardNo());

		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
