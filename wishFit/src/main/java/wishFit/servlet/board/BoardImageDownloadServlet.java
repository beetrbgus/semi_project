package wishFit.servlet.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.board.BoardImageVO;
import wishFit.beans.image.ImageDao;

@WebServlet(urlPatterns = {"/page/record/download.kh","/page/market/download.kh","/page/community/download.kh","/board/download.kh"})
public class BoardImageDownloadServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int imageNo = Integer.parseInt(req.getParameter("imageNo"));
			
			
			//image 단일 조회
			ImageDao imageDao = new ImageDao();
			BoardImageVO boardImageVO = imageDao.search(imageNo);
			
			File dir = new File("D:/upload/board");
			File target = new File(dir,boardImageVO.getBoardSave());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8291];
			
			String uploadName=  URLEncoder.encode(boardImageVO.getBoardUpload(),"UTF-8");
			uploadName = uploadName.replace("+","%20");
			
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+uploadName+"\"");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(boardImageVO.getBoardSize()));
			//4. 데이터 출력(다운로드)
			//출력 : 파일 출력
			while(true) {
				int size=in.read(buffer);
				if(size== -1 )break;
				resp.getOutputStream().write(buffer,0,size);
				
			}
			in.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}