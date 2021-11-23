package wishFit.servlet.fitgroup;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.fitgroup.FitgroupDao;

@WebServlet(urlPatterns = "/page/fitgroup/delete.kh")
public class FitDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//소모임 번호를 받아온다
			int fgNo =Integer.parseInt(req.getParameter("fgNo"));
			
			//처리
			FitgroupDao fitgroupDao = new FitgroupDao();
			boolean success = fitgroupDao.delete(fgNo);
			
			if(success) {
				resp.sendRedirect("list.jsp");
			}else {
				//존재하지않은 페이지로 이동시킴.
				resp.sendError(404);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			//500은 내부서버 오류
			resp.sendError(500); 
			
		}
	}
}
