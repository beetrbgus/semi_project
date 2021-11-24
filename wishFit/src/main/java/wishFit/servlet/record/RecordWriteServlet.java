package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

//@WebServlet(urlPatterns = "/page/record/record_write.kh")
public class RecordWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardDate(req.getParameter("boardDate"));

			
			//처리
			BoardDao boardDao = new BoardDao();
			//작성자 getSession으로 받기
//			boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			boardDto.setBoardWriter(req.getParameter("boardWriter"));
			System.out.println("boardWriter = "+boardDto.getBoardWriter());
			
			
			int boardNo = boardDao.boardSeq();
			boardDto.setBoardNo(boardNo);
			
			
			boardDao.write(boardDto);
			
			resp.sendRedirect("/wishFit/page/record/my_record.jsp");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
