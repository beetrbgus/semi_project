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

@WebFilter(urlPatterns = {
		"/member/*",
		"/record/*",
		"/fitgroup/*",
		"/notice/*"
	
})
public class MemberFilter implements Filter{
	
	// 회원인지 아닌지 걸러내는 필터.
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		String memId = (String)req.getSession().getAttribute("uid");
		boolean login = memId != null;
		
		if(login) {
			chain.doFilter(request, response);
		}
		else {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
		}
		
		
		
	}
}
