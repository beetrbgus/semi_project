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

@WebServlet(urlPatterns = {"/page/commu/write.kh","/page/market/write.kh"})
public class BoardWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
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
			
			//입력 : 대분류(이건 )
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardLargeName(mRequest.getParameter("board_large_name"));
			boardDto.setBoardMiddleName(mRequest.getParameter("board_middle_name"));
			boardDto.setBoardTitle(mRequest.getParameter("board_title"));
			boardDto.setBoardPost(mRequest.getParameter("board_post"));
			boardDto.setBoardDate(mRequest.getParameter("board_date"));
			
			//아이디는 세션으로 가져옴
			boardDto.setBoardWriter((String)req.getSession().getAttribute("uid"));
			
			//boardNo 는 미리 만들어서 부여함
			BoardDao boardDao = new BoardDao();
			int boardNo = boardDao.boardSeq();
			boardDto.setBoardNo(boardNo);
			

			if(mRequest.getFile("attach")!=null) {//파일 attach란 이름으로 업로드가 이루어졌다면
				ImageDto imageDto = new ImageDto();
				imageDto.setBoardNo(boardNo);//게시글 번호
				imageDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				imageDto.setBoardUpload(mRequest.getOriginalFileName("attach"));//사용자가 올린 이름
				imageDto.setBoardType(mRequest.getContentType("attach"));//파일 유형
				
				File target = mRequest.getFile("attach");//파일을 꺼내기
				imageDto.setBoardSize(target == null ? 0L : target.length());//파일크기
				
				/*정보 설정...*/
				ImageDao imageDao = new ImageDao();
				imageDao.insert(imageDto);
				
			}
			
			//글작성 처리
			boardDao.write(boardDto);
			
			//글작성 완료 후 행당 글 상세 페이지로 이동
			//만약 getContextPath가 들어온 주소대로 market/commu를 구분해서 나타내 준다면
			//if문 없이 그냥 바로 한개만 쓰면 될듯?
			
			if(req.getParameter("board_large_name").equals("마켓")) {//위의 largeName이 market이라면
				//resp.sendRedirect(req.getContextPath()+"/market/list.jsp?boardNo="+boardDto.getBoardNo());
				resp.sendRedirect(req.getContextPath()+"/list.jsp?boardNo="+boardDto.getBoardNo());
				
			}else {//마켓이 아닌 커뮤라면
				//resp.sendRedirect(req.getContextPath()+"/commu/list.jsp?boardNo="+boardDto.getBoardNo());
				resp.sendRedirect(req.getContextPath()+"/list.jsp?boardNo="+boardDto.getBoardNo());
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
