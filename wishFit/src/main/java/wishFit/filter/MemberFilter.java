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

// 비회원 쳐내기

@WebFilter(urlPatterns = {
		"/member/*",
		"/record/*",
		"/fitgroup/*",
		"/market/*",
		"/notice/*",
		"/community/*",
		"/inquiry/*"
})
public class MemberFilter implements Filter{	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		String memId = (String)req.getSession().getAttribute("ses");
		boolean login = memId != null;
		
		if(login) {
			chain.doFilter(request, response);
		}
		else {
			resp.sendRedirect(req.getContextPath()+"/member/login.jsp");
		}
		
		
		
	}
}
