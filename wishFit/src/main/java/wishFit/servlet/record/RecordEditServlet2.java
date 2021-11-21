package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;
@WebServlet(urlPatterns="/page/record/edit.kh")
public class RecordEditServlet2 extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : 사용자입력값은 제목,내용,일자,중분류
			req.setCharacterEncoding("UTF-8");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			
			
			
			//처리
			BoardDao boardDao = new BoardDao();
			boolean success = boardDao.edit(boardDto); //커뮤랑 마켓도 edit로 했는데 기록도 edit인지 아니면 edit2인지 아니면 다른이름인지
			
		
			//출력: detail.jsp
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
