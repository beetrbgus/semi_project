package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

@WebServlet(urlPatterns = "/page/record/record_edit.kh")
public class RecordEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : BoardDto(boardNo + boardTitle + boardContent)
			System.out.println("form받음!");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			System.out.println("boardNo = "+boardDto.getBoardNo());
			System.out.println("boardTitle = "+boardDto.getBoardTitle());
			System.out.println("boardPost = "+boardDto.getBoardPost());
			System.out.println("boardDate = "+boardDto.getBoardDate());
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.recordEdit(boardDto);
			
			//출력 : detail.jsp
			if(success) {
				resp.sendRedirect("record_detail.jsp?boardNo="+boardDto.getBoardNo());
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
