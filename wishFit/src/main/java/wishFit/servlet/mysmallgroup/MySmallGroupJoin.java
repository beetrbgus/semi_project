package wishFit.servlet.mysmallgroup;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.mysmallgroup.MySmallGroupDao;
import wishFit.beans.mysmallgroup.MySmallGroupDto;

@WebServlet(urlPatterns = "/page/fitgroup/join.kh")
public class MySmallGroupJoin extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int fgNo = Integer.parseInt(req.getParameter("fgNo"));
			
			//String memId = (String) req.getSession().getAttribute("uid");
			String memId = "ksm01";
			MySmallGroupDto mySmallGroupDto = new MySmallGroupDto();
			mySmallGroupDto.setFgNo(fgNo);
			mySmallGroupDto.setMemId(memId);

			MySmallGroupDao mySmallGroupDao = new MySmallGroupDao();
			mySmallGroupDao.insert(mySmallGroupDto);
			resp.sendRedirect("detail.jsp?fgNo="+fgNo);
			System.out.println("3");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}