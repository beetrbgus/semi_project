package wishFit.beans.notification;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.JdbcUtils;

public class NotificationDao {
	// 글에 댓글이 달렸을 때
	// 관리자가 내 글을 삭제했을 떄
	// 친구요청이 됐을 때
	// 상대방이 내가 보낸 요청을 거절했을 때
	Connection conn;
	// 알림 생성.
	public void sendNotification(NotificationDto notificationDto) throws Exception {

		conn = JdbcUtils.connect();
		String sql = "insert into notification values( " 
				+ "noti_seq.nextval, ? , ? ," + " ? , sysdate , '안읽음', ? );";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, notificationDto.getMyId());
		ps.setString(2, notificationDto.getSender());
		ps.setString(3, notificationDto.getMessage());
		ps.setString(4, notificationDto.getNoticategory());
		ps.setString(5, notificationDto.getSender());

		ps.execute();
		conn.close();
	}

	// 알림 Detail.
	public NotificationDto read_Noti(int noti_no , String uid) throws Exception {
		conn = JdbcUtils.connect();

		String sql = "select * from notification where no= ? and myid = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, noti_no);
		ps.setString(2, uid);
		
		ResultSet rs = ps.executeQuery();
		
		NotificationDto notificationDto = new NotificationDto();
		if(rs.next()) {
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

	public int count(String uid , String column, String keyword) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(no) from notification where myid = ? and instr( #1,  ?) order by Noti";
		sql = sql.replace("#1", column);
		PreparedStatement ps =  conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setString(2, keyword);
		
		ResultSet  rs = ps.executeQuery();
		int result = (rs.next()) ? rs.getInt(1): 0 ; 
		
		return result;
	}

	public int count(String uid) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(*) from notification where myid = ? ";
		
		PreparedStatement ps =  conn.prepareStatement(sql);
		ps.setString(1, uid);
		ResultSet rs =ps.executeQuery();
		
		int result = (rs.next())? rs.getInt(1) : 0 ; 
		
		return result;
	}

	public List<NotificationDto> searchByRownum(String column, String keyword, int begin, int end) {
		
		return null;
	}
}
