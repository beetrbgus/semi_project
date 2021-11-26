package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

@WebServlet(urlPatterns = "/record_write.kh")
public class RecordWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//기록글 작성 서블릿 
			//입력 : 제목/내용/작성일/대분류/중분류/게시글번호(시퀀스)/작성자아이디(세션이용)
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardLargeName(req.getParameter("boardLargeName"));
			//아이디 : 세션에서
			boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			
			//처리
			BoardDao boardDao = new BoardDao();
			int boardNo=boardDao.getSeq();
			boardDto.setBoardNo(boardNo);
			
			boardDao.write(boardDto);
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+ boardNo);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
