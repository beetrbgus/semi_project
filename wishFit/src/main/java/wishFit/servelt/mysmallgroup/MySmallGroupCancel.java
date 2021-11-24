package wishFit.servelt.mysmallgroup;

import java.io.IOException;
import java.security.spec.ECFieldF2m;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.mysmallgroup.MySmallGroupDao;

@WebServlet(urlPatterns = "/page/fitgroup/cancel.kh")
public class MySmallGroupCancel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int fgNo = Integer.parseInt(req.getParameter("fgNo"));
			// String memId = (String) req.getSession().getAttribute("uid");
			String memId = req.getParameter("memId");

			MySmallGroupDao mySmallGroupDao = new MySmallGroupDao();
			boolean success = mySmallGroupDao.delete(fgNo, memId);
			if (success) {
				resp.sendRedirect("detail.jsp?fgNo=" + fgNo);

			} else {
				resp.sendError(500);

			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}
