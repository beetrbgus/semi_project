package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.RecordBoardDao;
import wishFit.beans.board.RecordBoardDto;

@WebServlet(urlPatterns = "/record_edit.kh")
public class RecordEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : BoardDto(boardNo + boardTitle + boardContent)
			RecordBoardDto boardDto = new RecordBoardDto();
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			boardDto.setMidName(req.getParameter("midName"));
			boardDto.setLagName(req.getParameter("lagName"));
			
			
			
			//처리
			RecordBoardDao boardDao = new RecordBoardDao();
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
