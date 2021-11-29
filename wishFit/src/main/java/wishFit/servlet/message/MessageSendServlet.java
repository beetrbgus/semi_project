package wishFit.servlet.message;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.message.MessageDao;
import wishFit.beans.message.MessageVo;
import wishFit.beans.notification.NotificationDao;
import wishFit.beans.notification.NotificationDto;
import wishFit.beans.notification.NotificationVo;
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
			
			System.out.println("msgSeq    :"+msgSeq);
			
			String uid= (String) req.getSession().getAttribute("uid");
			
			System.out.println("uid    :"+uid);
			messageVo.setMsg_no(msgSeq);
			messageVo.setMsg_sender(req.getParameter("sender"));
			messageVo.setMsg_receiver(req.getParameter("receiver"));
			messageVo.setMsgCon_title(req.getParameter("msg_title"));
			messageVo.setMsgCon_text(req.getParameter("msg_text"));

			
			System.out.println("receiver = "+req.getParameter("msg_receiver"));
			System.out.println("uid = "+req.getParameter("uid"));
			messageDao.send(messageVo);
			NotificationVo notificationVo = new NotificationVo(); 
			/*
			 * NotificationDao notificationDao = new NotificationDao();
			 * notificationVo.setNoti_ref("msgNo");
			 */
			resp.sendRedirect(req.getContextPath());

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}