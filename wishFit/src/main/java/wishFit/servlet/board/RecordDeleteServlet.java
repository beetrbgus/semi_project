package wishFit.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardImageVO;
import wishFit.beans.image.ImageDao;

@WebServlet(urlPatterns = "/page/record/record_delete.kh")
public class RecordDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : boardNo
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			BoardDao boardDao = new BoardDao();
			
			//만약 이미지 파일이 존재하면 이미지 파일 까지 삭제.
			ImageDao imageDao = new ImageDao();
			imageDao.deleteImage(boardNo);
			
			//처리
			
			
			
			//게시글 삭제
			boolean success = boardDao.delete(boardNo);
			
			//출력
			if(success) {
				resp.sendRedirect("my_record.jsp");
			}else {
				resp.sendError(404);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
