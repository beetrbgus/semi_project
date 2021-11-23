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


@WebServlet(urlPatterns = "/page/community/comu_write.kh")
public class BoardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//resp.setCharacterEncoding("UTF-8");
			//jsp 에서 form 안에 multipart/form-data형태로 보내야함
	         //그걸 해석하는 객체
	         
	         //저장되는 경로
	         String savePath = "D:/upload/board";
	         //사이즈(이게 10mb 였나?)
	         int maxSize = 10*1024*1024;
	         String encoding = "UTF-8";
	         DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	         
	         //MultipartRequest mRequest = new MultipartRequest(req,저장경로,최대크기,인코딩); 
	         MultipartRequest mRequest = new MultipartRequest(req,savePath,maxSize,encoding); 
			
	         System.out.println("writerServlet In");
			//기록글 작성 서블릿 
			//입력 : 제목/내용/작성일/대분류/중분류/게시글번호(시퀀스)/작성자아이디(세션이용)
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardPost(mRequest.getParameter("boardPost"));
			boardDto.setBoardDate(mRequest.getParameter("boardDate"));
			boardDto.setBoardMiddleName(mRequest.getParameter("boardMiddleName"));
			boardDto.setBoardLargeName(mRequest.getParameter("boardLargeName"));
			//아이디 : 세션에서
			//boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			//boardDto.setBoardWriter(mRequest.getParameter("testuser"));
			boardDto.setBoardWriter("testuser");
			
			//처리
			BoardDao boardDao = new BoardDao();
			int boardNo=boardDao.boardSeq();
			boardDto.setBoardNo(boardNo);
			
			
			boardDao.write(boardDto);
			
			if(mRequest.getFile("attach")!=null) {//파일 attach란 이름으로 업로드가 이루어졌다면
				System.out.println("imageServlet In");
				ImageDto imageDto = new ImageDto();
				imageDto.setBoardNo(boardNo);//게시글 번호
				imageDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				imageDto.setBoardUpload(mRequest.getOriginalFileName("attach"));//사용자가 올린 이름
				imageDto.setBoardType(mRequest.getContentType("attach"));//파일 유형
				
				File target = mRequest.getFile("attach");//파일을 꺼내기
				imageDto.setBoardSize(target == null ? 0L : target.length());//파일크기
				ImageDao imageDao = new ImageDao();
				imageDao.insert(imageDto);
				
			}

			
			System.out.println("writerServlet out");
			
			//출력
			resp.sendRedirect("detail.jsp?boardNo="+ boardNo);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
