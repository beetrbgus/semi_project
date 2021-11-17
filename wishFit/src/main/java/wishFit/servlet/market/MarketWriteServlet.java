package wishFit.servlet.market;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;
import wishFit.beans.market.MarketDao;
@WebServlet(urlPatterns="/page/market/write.kh")
public class MarketWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));

			MarketDao marketDao = new MarketDao();
			int boardNo =marketDao.getSequence();
			boardDto.setBoardNo(boardNo);
			//boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			boardDto.setBoardWriter("testuser");//나중에 로그인이 구현되면 삭제
			
			marketDao.write(boardDto);
			
			resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
