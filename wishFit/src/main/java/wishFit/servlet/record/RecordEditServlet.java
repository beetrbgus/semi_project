package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

@WebServlet(urlPatterns = "/record_edit.kh")
public class RecordEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : BoardDto(boardNo + boardTitle + boardContent)
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardLargeName(req.getParameter("boardLargeName"));
			
			
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.edit(boardDto);
			
			//출력 : detail.jsp
			if(success) {
				resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
			}
			else {
				resp.sendError(404);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
