package wishFit.servlet.record;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;

@WebServlet(urlPatterns = "/page/record/record_edit.kh")
public class RecordEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//저장되는 경로
			String savePath = "D:/upload/board";
			//사이즈(이게 10기가 였나?)
			int maxSize = 10*1024*1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			//MultipartRequest mRequest = new MultipartRequest(req,저장경로,최대크기,인코딩); 
			MultipartRequest mRequest = new MultipartRequest(req,savePath,maxSize,encoding); 
			
			
			
			//입력 : BoardDto(boardNo + boardTitle + boardContent)
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardNo(Integer.parseInt(mRequest.getParameter("boardNo")));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardPost(mRequest.getParameter("boardPost"));
			boardDto.setBoardDate(mRequest.getParameter("boardDate"));
			boardDto.setBoardMiddleName(mRequest.getParameter("boardMiddleName"));
			
			//이미지 파일 수정이 이루어졌다면
			
			
			
			
			
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
