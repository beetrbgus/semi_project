package wishFit.servlet.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.market.MarketDao;
//@WebServlet(urlPatterns="/page/market/delete.kh")
public class MarketDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int boardNo= Integer.parseInt(req.getParameter("boardNo"));
			
			//처리
			MarketDao marketDao = new MarketDao();
			boolean success = marketDao.delete(boardNo);
			
			//출력
			if(success) {
				resp.sendRedirect("SellList.jsp");
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
