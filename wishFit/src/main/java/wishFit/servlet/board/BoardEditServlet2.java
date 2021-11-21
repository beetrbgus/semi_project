package wishFit.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;
@WebServlet(urlPatterns= {"/page/market/edit.kh","/page/community/edit.kh"})
public class BoardEditServlet2 extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			req.setCharacterEncoding("UTF-8");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			boardDto.setBoardLargeName(req.getParameter("boardLargeName"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.edit(boardDto);
			
			
			//출력 : detail.jsp
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
