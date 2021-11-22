package wishFit.servlet.board;

import java.io.File;
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
import wishFit.beans.board.RecordBoardDao;
import wishFit.beans.image.ImageDao;
import wishFit.beans.image.ImageDto;
import wishFit.util.GetSeq;

@WebServlet(urlPatterns = "/page/board/record_write.kh")
public class RecordWriteServlet extends HttpServlet{
	private GetSeq getSeq;
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
			
			//입력
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardTitle(req.getParameter("boardTitle"));
			boardDto.setBoardPost(req.getParameter("boardPost"));
			boardDto.setBoardMiddleName(req.getParameter("boardMiddleName"));
			boardDto.setBoardDate(req.getParameter("boardDate"));
			boardDto.setBoardLargeName(req.getParameter("boardLargeName"));

			
			//처리
			BoardDao boardDao = new BoardDao();
			//작성자 getSession으로 받기
//			boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			boardDto.setBoardWriter(req.getParameter("boardWriter"));
			
			
			//int boardNo = boardDao.boardSeq();
			int boardNo = GetSeq.getSequence("board_seq");
			boardDto.setBoardNo(boardNo);
			boardDao.recordWrite(boardDto);
			
			if(mRequest.getFile("attach")!=null) {//파일 attach란 이름으로 업로드가 이루어졌다면
				ImageDto imageDto = new ImageDto();
				imageDto.setBoardNo(boardNo);//게시글 번호
				imageDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				imageDto.setBoardUpload(mRequest.getOriginalFileName("attach"));//사용자가 올린 이름
				imageDto.setBoardType(mRequest.getContentType("attach"));//파일 유형
				
				File target = mRequest.getFile("attach");//파일을 꺼내기
				imageDto.setBoardSize(target == null ? 0L : target.length());//파일크기
				//이미지 번호 시퀀스 미리 구해서 부여하기
				int imageNo = GetSeq.getSequence("image_seq");
				imageDto.setImageNo(imageNo);
				
				/*정보 설정...*/
				ImageDao imageDao = new ImageDao();
				imageDao.insert(imageDto);
				
			}
			
			//resp.sendRedirect(req.getContextPath()+"/record/my_record.jsp?boardNo="+boardNo");
			resp.sendRedirect(req.getContextPath()+"/my_record.jsp?boardNo="+boardNo);
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
