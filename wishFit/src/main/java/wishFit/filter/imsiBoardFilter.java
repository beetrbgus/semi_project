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

@WebFilter( urlPatterns = {"*.jsp", "*.kh"})//JSP, Servlet 전체
public class imsiBoardFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		//추가할 작업을 코드로 구현(간섭)
		req.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);//모든 요청 통과
	}
}
