package wishFit.servlet.notification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wishFit.beans.notification.NotificationDto;

@WebServlet(urlPatterns = "/noticreate.kh")
public class NotificationCreateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NotificationDto notificationDto = new NotificationDto();
		notificationDto.setMessage(req.getParameter("message"));
		notificationDto.setSender("sender");
		notificationDto.setNoticategory("");
		
	}
	// 소모임 참가
	
	// 친구 요청
	
	// 내 글에  댓글 달렸을 때
	
	
}
