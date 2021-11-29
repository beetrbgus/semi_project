package wishFit.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter(urlPatterns= {"/page/market/write.jsp", "/page/market/detail.jsp","/page/market/write.kh", "/page/community/write.jsp","/page/community/write.kh",
		"/page/record/*","/page/fitgroup/write.jsp", "/page/fitgroup/write.kh","/page/fitgroup/detail.jsp"})
public class LoginFilter implements Filter{
	@Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
			
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		if(session == null) {
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}
		String uid = (String) session.getAttribute("uid");
		
		if(uid == null) {
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}
		chain.doFilter(request, response);
		
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
}
