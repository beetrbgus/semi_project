package wishFit.servlet.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.market.MarketReplyDao;
//@WebServlet(urlPatterns="/page/market/reply_delete.kh")
public class MarketReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 게시글 번호, 댓글번호 ,몇번글의 몇번댓글을 삭제하는지
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			System.out.println("boardNo = " + boardNo);
			System.out.println("replyNo = " + replyNo);
			
			//처리 : 댓글 삭제
			MarketReplyDao marketReplyDao = new MarketReplyDao();
			boolean success = marketReplyDao.delete(replyNo,boardNo);
			System.out.println("success = " + success);
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+boardNo);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
