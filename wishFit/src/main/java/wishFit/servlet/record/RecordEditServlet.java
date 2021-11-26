package wishFit.servlet.record;

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
import wishFit.beans.board.BoardImageVO;
import wishFit.beans.image.ImageDao;
import wishFit.beans.image.ImageDto;

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
			
			int boardNo = boardDto.getBoardNo();
			
			
			BoardDao boardDao = new BoardDao();
			//이미지 파일 수정이 이루어졌다면
			if(mRequest.getFile("attach")!=null) {//파일 attach란 이름으로 업로드가 이루어졌다면
				ImageDao imageDao = new ImageDao();//이미 있는 이미지를 삭제하기
		       
		        
		        //이미지 디비 지우기
		        BoardImageVO boardImageVO = boardDao.detail(boardNo);
		        
		        int imageNo  = boardImageVO.getImageNo();
		        String imageUpload = boardImageVO.getBoardUpload();
		        imageDao.deleteImage(boardNo,imageUpload);//이미지 파일 지우기
		        imageDao.delete(imageNo);
		        
		      
		         
				ImageDto imageDto = new ImageDto();
				imageDto.setBoardNo(boardNo);//게시글 번호
				imageDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				imageDto.setBoardUpload(mRequest.getOriginalFileName("attach"));//사용자가 올린 이름
				imageDto.setBoardType(mRequest.getContentType("attach"));//파일 유형
				
				File target = mRequest.getFile("attach");//파일을 꺼내기
				imageDto.setBoardSize(target == null ? 0L : target.length());//파일크기
				//이미지 번호 시퀀스 미리 구해서 부여하기
				//int imageNo = GetSeq.getSequence("image_seq");
				int ChangeImageNo = imageDao.imageSeq();
				imageDto.setImageNo(ChangeImageNo);
				
				//이미지 파일 등록
				imageDao.insert(imageDto);
				
			}
			//처리
			
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
