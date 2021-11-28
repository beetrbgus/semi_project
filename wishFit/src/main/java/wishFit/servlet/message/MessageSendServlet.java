package wishFit.servlet.message;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.message.MessageDao;
import wishFit.beans.message.MessageVo;
import wishFit.util.CommonSql;

@WebServlet(urlPatterns = "/page/message/send.kh")
public class MessageSendServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		MessageDao messageDao = new MessageDao();
		MessageVo messageVo = new MessageVo();
		
		try {
			// 쪽지 테이블 시퀀스 번호 찾기. 시퀀스 이름 넣기
			int msgSeq = CommonSql.getSequence("msg_seq");
			
			messageVo.setMsg_no(msgSeq);
			messageVo.setMsg_sender(req.getParameter("msg_sender"));
			messageVo.setMsg_receiver(req.getParameter("msg_receiver"));
			messageVo.setMsgCon_title(req.getParameter("msg_title"));
			messageVo.setMsgCon_text(req.getParameter("msg_text"));

			messageDao.send(messageVo);
			resp.sendRedirect("list.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
