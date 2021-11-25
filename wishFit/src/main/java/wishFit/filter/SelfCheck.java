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

import wishFit.beans.board.BoardDao;
import wishFit.beans.board.BoardDto;
import wishFit.beans.board.BoardImageVO;


// 타인이 게시글을 수정ㆍ삭제 하지 못하도록 거르는 필터


@WebFilter(urlPatterns = {"/board/edit.jsp",
		"/board/edit.kh","/board/delete.kh"
})
public class SelfCheck implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		
		try {
			req.setCharacterEncoding("UTF-8"); // 인코딩 필터가 별도로 있으나 본문의 필터가 먼저 적용될 수 있다고 함.
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			BoardDao boardDao = new BoardDao();
			BoardImageVO boardImageVO = boardDao.detail(boardNo); // 수정 or 삭제는 상세보기에서 이루어지므로.
			
			String memId = (String)req.getSession().getAttribute("uid");
					
			if(boardImageVO == null) {
				// 해당 게시글이 없다면
				resp.sendError(404);
			}
			else if(memId == null) {
				// 접근자가 회원이 아니라면
				resp.sendRedirect("/member/login.jsp");
			}
			else if(boardImageVO.getBoardWriter().equals(memId)) {
				// 접근자와 작성자의 정보가 일치한다면 허가
				chain.doFilter(request, response);
			}
			else {
				resp.sendError(403);
			}
		}
		catch (Exception e) {
			resp.sendError(500);
			e.printStackTrace();
		}
	}
}
