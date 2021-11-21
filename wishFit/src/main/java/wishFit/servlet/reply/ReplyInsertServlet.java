package wishFit.servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.reply.ReplyDto;
@WebServlet(urlPatterns ={"/page/market/reply_insert.kh","/page/community/reply_isert.kh"})
public class ReplyInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			resp.setCharacterEncoding("UTF-8");
			ReplyDto replyDto = new ReplyDto();
			
			//처리
			replyDto.setReplyId("testuser");
			//replyDto.setReplyId(String)req.getSession().getAttribute("ses")); 로그인 기능 구현 이후
			
			//출력
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
