package wishFit.servlet.market;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import wishFit.beans.board.BoardDao2;
import wishFit.beans.board.BoardDto;
import wishFit.beans.market.MarketDao;
import wishFit.beans.market.MarketFileDao;
import wishFit.beans.market.MarketFileDto;
//@WebServlet(urlPatterns="/page/market/write.kh")
public class MarketWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//멀티바이트 파일 업로드,요청준비
			String savePath = "C:\\Users\\gptjd\\upload\\board";
			int maxSize = 10*1024*1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest =
					new MultipartRequest(req,savePath,maxSize,encoding,policy);
			
			//게시글 작성 코드
			req.setCharacterEncoding("UTF-8");
			BoardDto boardDto = new BoardDto();
			boardDto.setBoardMiddleName(mRequest.getParameter("boardMiddleName"));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardPost(mRequest.getParameter("boardPost"));

			MarketDao marketDao = new MarketDao();
			int boardNo =marketDao.getSequence();
			boardDto.setBoardNo(boardNo);
			//boardDto.setBoardWriter((String)req.getSession().getAttribute("ses"));
			boardDto.setBoardWriter("testuser");//나중에 로그인이 구현되면 삭제
			
			marketDao.write(boardDto);
			
			/**
			 * 게시글 등록을 모두 마친 뒤에 파일 정보를 데이터베이스에 저장하도록 설정
			 * 파일이 존재할 경우만 실행해야 한다.
			 */
			if(mRequest.getFile("attach")!=null) {
				MarketFileDto marketFileDto = new MarketFileDto();
				marketFileDto.setBoardNo(boardNo);//게시글 번호
				marketFileDto.setBoardSave(mRequest.getFilesystemName("attach"));//실제 저장된 이름
				marketFileDto.setBoardUpload(mRequest.getOriginalFileName("attach"));// 사용자가 올린 파일 이름
				marketFileDto.setBoardType(mRequest.getContentType("attach"));//파일의 유형
				File target = mRequest.getFile("attach");
				//타겟이 null 이면 0 아니면 저장된 파일 객체 길이 출력
				marketFileDto.setBoardSize(target==null ? 0L : target.length());
				
				MarketFileDao marketFileDao = new MarketFileDao();
				int imageNo = marketFileDao.getSequence();
				marketFileDto.setImageNo(imageNo);
				marketFileDao.insert(marketFileDto);
				
			}
			
			resp.sendRedirect("detail.jsp?boardNo="+boardDto.getBoardNo());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
