package wishFit.servlet.fitgroup;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wishFit.beans.fitgroup.FitgroupDao;
import wishFit.beans.fitgroup.FitgroupDto;

@WebServlet(urlPatterns = "/page/fitgroup/update.kh")
public class FitUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//받아오는 문자를 UTF-8로 변경
			req.setCharacterEncoding("UTF-8");
			System.out.println(req.getParameter("fgNo"));
			//FitgroupDto 에 받아온 것을 다 넣는다
			int fgNo = Integer.parseInt(req.getParameter("fgNo"));
			System.out.println(fgNo);
			FitgroupDto fitgroupDto = new FitgroupDto();
			
			fitgroupDto.setFgNo(Integer.parseInt(req.getParameter("fgNo")));
			fitgroupDto.setExcateName(req.getParameter("excateName"));
			fitgroupDto.setFgTitle(req.getParameter("fgTitle"));
			fitgroupDto.setFgIntro(req.getParameter("fgIntro"));
			fitgroupDto.setFgStarttime(req.getParameter("fgStarttime"));
			fitgroupDto.setFgEndtime(req.getParameter("fgEndtime"));
			fitgroupDto.setFgLocation(req.getParameter("fgLocation"));
			fitgroupDto.setFgLatitude(req.getParameter("fgLatitude"));
			fitgroupDto.setFgLongtitude(req.getParameter("fgLongitude"));
			//처리
			FitgroupDao fitgroupDao =new FitgroupDao();	
			fitgroupDao.update(fitgroupDto);
			System.out.println("처리");
			
			//출력
			resp.sendRedirect("detail.jsp?fgNo="+req.getParameter("fgNo"));
			//화면을 상세페이지로 이동시킨다
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}
