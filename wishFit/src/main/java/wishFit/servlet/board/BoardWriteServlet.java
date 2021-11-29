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

@WebServlet(urlPatterns = {"/page/community/write.kh","/page/market/write.kh"})
public class BoardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//저장되는 경로
			String savePath = "D:/upload/board";
			//사이즈(이게 10mb 였나?)
			int maxSize = 10*1024*1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			//MultipartRequest mRequest = new MultipartRequest(req,저장경로,최대크기,인코딩); 
			MultipartRequest mRequest = new MultipartRequest(req,savePath,maxSize,encoding); 
			
			//입력 : 대분류(이건 )
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardLargeName(mRequest.getParameter("boardLargeName"));
			boardDto.setBoardMiddleName(mRequest.getParameter("boardMiddleName"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardPost(mRequest.getParameter("boardPost"));
			
			//아이디는 세션으로 가져옴
			boardDto.setBoardWriter((String)req.getSession().getAttribute("uid"));
			
			//boardNo 는 미리 만들어서 부여함
			BoardDao boardDao = new BoardDao();
			int boardNo = boardDao.boardSeq();
			boardDto.setBoardNo(boardNo);
			
			//글작성 처리
			boardDao.write(boardDto);

			if(mRequest.getFile("attach")!=null) {//파일 attach란 이름으로 업로드가 이루어졌다면
				ImageDto imageDto = new ImageDto();
				imageDto.setBoardNo(boardNo);//게시글 번호
				imageDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				imageDto.setBoardUpload(mRequest.getOriginalFileName("attach"));//사용자가 올린 이름
				imageDto.setBoardType(mRequest.getContentType("attach"));//파일 유형
				
				File target = mRequest.getFile("attach");//파일을 꺼내기
				imageDto.setBoardSize(target == null ? 0L : target.length());//파일크기
				ImageDao imageDao = new ImageDao();
				int imageNo = imageDao.imageSeq();
				imageDto.setImageNo(imageNo);
				
				
				imageDao.insert(imageDto);
				
			}
			
			String LargeName = mRequest.getParameter("boardLargeName");
			if(LargeName.equals("마켓")) {
				resp.sendRedirect(req.getContextPath()+"/page/market/detail.jsp?boardNo="+boardNo);
			}else {
				resp.sendRedirect(req.getContextPath()+"/page/community/detail.jsp?boardNo="+boardNo);
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
