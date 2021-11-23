package wishFit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 관리자페이지 필터

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			HttpServletResponse resp = (HttpServletResponse)response;
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = req.getSession();
			
			String grade = (String)session.getAttribute("grade");
			
			boolean admin = grade != null && (
					grade.equals("총관리자") || grade.equals("소모임관리자") || grade.equals("마켓관리자") || grade.equals("커뮤니티관리자"));
			
			if(admin) {
				chain.doFilter(request, response);
			}
			else {
				// 자격이 없을 경우
				resp.sendError(403);
			}
	}
}
