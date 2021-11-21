package wishFit.servlet.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDto;
import wishFit.beans.market.MarketDao;
//@WebServlet(urlPatterns="/page/market/edit.kh")
public class MarketEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : boardDto에 제목,내용,중분류 필요
			req.setCharacterEncoding("UTF-8");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			
			//처리
			MarketDao marketDao = new MarketDao();
			boolean success = marketDao.edit(boardDto);
			
			//출력 : detail.jsp
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
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
