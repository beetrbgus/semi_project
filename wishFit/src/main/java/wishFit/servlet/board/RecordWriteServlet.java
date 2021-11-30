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
import wishFit.beans.image.ImageDao;
import wishFit.beans.image.ImageDto;
import wishFit.util.CommonSql;

@WebServlet(urlPatterns = "/page/record/record_write.kh")
public class RecordWriteServlet extends HttpServlet{
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
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardPost(mRequest.getParameter("boardPost"));
			boardDto.setBoardMiddleName(mRequest.getParameter("boardMiddleName"));
			boardDto.setBoardDate(mRequest.getParameter("boardDate"));
			boardDto.setBoardLargeName(mRequest.getParameter("boardLargeName"));

			
			//처리
			BoardDao boardDao = new BoardDao();
			//작성자 getSession으로 받기
			//boardDto.setBoardWriter((String)req.getSession().getAttribute("uid"));
			boardDto.setBoardWriter(mRequest.getParameter("boardWriter"));
			
			
<<<<<<< HEAD
			int boardNo = CommonSql.getSequence("board_seq");
=======
			int boardNo = boardDao.boardSeq();
//			int boardNo = GetSeq.getSequence("board_seq");
>>>>>>> refs/remotes/origin/master
			boardDto.setBoardNo(boardNo);
			
			//글 등록
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
				//int imageNo = GetSeq.getSequence("image_seq");
				ImageDao imageDao = new ImageDao();
				int imageNo = imageDao.imageSeq();
				imageDto.setImageNo(imageNo);
				
				//이미지 파일 등록
				imageDao.insert(imageDto);
				
			}
			
			resp.sendRedirect(req.getContextPath()+"/page/record/record_detail.jsp?boardNo="+boardNo);
//			resp.sendRedirect(req.getContextPath()+"/my_record.jsp?boardNo="+boardNo);
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
