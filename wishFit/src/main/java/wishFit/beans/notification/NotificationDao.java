package wishFit.beans.notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.util.JdbcUtils;

public class NotificationDao {
	// 글 - boardNo , 친구요청 - Friend.no , 친구 거절 - 삭제 전에 보내기
	// 글에 댓글이 달렸을 때 - 내 글에 '사용자 닉네임'의 댓글. '댓글 내용'
	// 친구요청이 왔을 때 - '사용자 닉네임'님의 친구 요청이 왔습니다.
	// 친구요청이 거절/수락 됐을 때 - '사용자 닉네임'님에게 보낸 친구 요청 수락/거절 되었습니다.

	// 필요 컬럼 보낸 닉네임 , 받는 닉네임, 등록시간, 메세지

	Connection conn;

	// 알림 생성.
	public void sendNotification(NotificationVo notificationVo) throws Exception {

		conn = JdbcUtils.connect();
		String sql = "insert into notification values( " 
		+ "noti_seq.nextval, ? , ? ,"
		+ " ?, ? , sysdate , '안읽음', ? );";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, notificationVo.getNoti_ref());
		ps.setInt(2, notificationVo.getNoti_refval());
		ps.setString(3, notificationVo.getNoti_sender());
		ps.setString(3, notificationVo.getNoti_receiver());
		ps.setString(4, notificationVo.getNoti_message());

		ps.execute();
		conn.close();
	}

	// 알림 Detail.
	public NotificationDto read_Noti(int noti_no, String uid) throws Exception {
		conn = JdbcUtils.connect();

		String sql = "select * from notification where no= ? and myid = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, noti_no);
		ps.setString(2, uid);

		ResultSet rs = ps.executeQuery();

		NotificationDto notificationDto = new NotificationDto();
		if (rs.next()) {
			notificationDto.setNo(rs.getInt("no"));
			notificationDto.setMyId(rs.getString("myid"));
			notificationDto.setSender(rs.getString("sender"));
			notificationDto.setMessage(rs.getString("no"));
			notificationDto.setNotiTime(rs.getString("Notitime"));
			notificationDto.setRead(rs.getString("Read"));
			notificationDto.setNoticategory(rs.getString("NotiCategory"));
		}
		conn.close();
		return notificationDto;
	}

	// 안 읽은 알림의 갯수.
	public int count_Noti(String uid) throws Exception {
		conn = JdbcUtils.connect();

		String sql = "";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int result = rs.getInt(1);

		conn.close();
		return result;
	}

	// 헤더에서 가져오는 안 읽은 알림의 목록.
	public List<NotificationDto> list_NotReadNoti(String uid) throws Exception {
		conn = JdbcUtils.connect();

		String sql = "select * from notification where read ='안읽음'";
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		List<NotificationDto> list = new ArrayList<NotificationDto>();

		while (rs.next()) {
			NotificationDto notificationDto = new NotificationDto();
			notificationDto.setNo(0);

			list.add(notificationDto);
		}

		conn.close();
		return list;
	}

	public int count(String uid, String column, String keyword) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(no) from notification where myid = ? and instr( #1,  ?) order by Noti";
		sql = sql.replace("#1", column);
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setString(2, keyword);

		ResultSet rs = ps.executeQuery();
		int result = (rs.next()) ? rs.getInt(1) : 0;

		return result;
	}

	public int count(String uid) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(*) from notification where myid = ? ";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ResultSet rs = ps.executeQuery();

		int result = (rs.next()) ? rs.getInt(1) : 0;

		return result;
	}

	public List<NotificationDto> searchByRownum(String column, String keyword, int begin, int end) {

		return null;
	}

	public String plusMessage(String msg) {
		String result;
		if (msg.equals("쪽지수신")) {
			result= msg+"";
		}else if (msg.equals("친구요청")) {

		}
		if (msg.equals("친구요청거절")) {

		}
		return "";
	}
}
