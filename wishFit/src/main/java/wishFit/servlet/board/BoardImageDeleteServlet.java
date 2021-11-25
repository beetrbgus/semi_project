package wishFit.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.image.ImageDao;

@WebServlet(urlPatterns = "/page/record/imageDelete.kh")
public class BoardImageDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : imageNo
			int imageNo = Integer.parseInt(req.getParameter("imageNo"));
			System.out.println("imageNo = "+imageNo);
			
			//처리
			ImageDao imageDao = new ImageDao();
			boolean result = imageDao.delete(imageNo);
			
			if(!result) {
				resp.sendError(500);
			}
			System.out.println("삭제완료");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
	}

}
