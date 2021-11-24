package wishFit.beans.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import wishFit.util.JdbcUtils;

public class MessageDao {
	// 쪽지 보내기
	public void send(MessageVo messageVo) throws Exception {

		Connection conn = JdbcUtils.connect();
		conn.setAutoCommit(false);
		try {
			insertMessage(conn, messageVo);
			sendMessageContext(conn, messageVo);
			conn.commit();
		} catch (Exception e) {
			// 롤백
			conn.rollback();
			e.printStackTrace();
		} finally {
			// 연결종료
			conn.close();
		}
	}

	public void insertMessage(Connection conn, MessageVo messageVo) throws Exception {

		String sql = "insert into Message values(? , ?, ? , sysdate, null)";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, messageVo.getMsg_no());
		ps.setString(2, messageVo.getMsg_receiver());
		ps.setString(3, messageVo.getMsg_sender());

		ps.execute();
	}

	public void sendMessageContext(Connection conn, MessageVo messageVo) throws Exception {
		// 메세지 내용 입력
		String sql = "insert into Message values(msgcon_seq.nextval, ? ,? ,? )";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, messageVo.getMsg_no());
		ps.setString(2, messageVo.getMsgCon_title());
		ps.setString(3, messageVo.getMsgCon_text());
		ps.execute();
	}

	// 헤더의 쪽지에서 받은 메세지 목록 출력
	public List<MessageVo> getMessageList(String mem_id) throws Exception {
		Connection conn = JdbcUtils.connect();

		String sql = "select msg.no msg_no, sender msg_sender , mem_nick ,mp.mp_no profile_no, "
				+ "    msgcon.title msg_title ,msgcon.text msg_text, sendTime msg_sendTime, "
				+ "    NVL(to_char(readtime),'안읽음') msg_readtime"
				+ "    from member m left outer join member_profile mp on m.mem_id = mp.mp_id "
				+ "    left outer join message msg on msg.sender = m.mem_id "
				+ "    left outer join messageContext msgcon on msg.no = msgCon.no where receiver = ? order by sendtime desc";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, mem_id);

		ResultSet rs = ps.executeQuery();

		List<MessageVo> list = new ArrayList<MessageVo>();
		while (rs.next()) {
			MessageVo messageVo = new MessageVo();
			messageVo.setMsg_no(rs.getInt("msg_no"));
			messageVo.setMsg_sender(rs.getString("msg_sender"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setProfile_no(rs.getInt("profile_no"));
			messageVo.setMsgCon_title(rs.getString("msg_title"));
			messageVo.setMsgCon_text(rs.getString("msg_text"));
			messageVo.setMsg_sendTime(rs.getString("msg_sendTime"));
			messageVo.setMsg_readTime(rs.getString("msg_readtime"));

			list.add(messageVo);
		}
		conn.close();
		return list;
	}

	// 쪽지 삭제
	public void deleteMessage(int msg_no, String mem_id) throws Exception {
		Connection conn = JdbcUtils.connect();
		String sql = "delete into Message where no = ? and mem_id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, msg_no);
		ps.setString(2, mem_id);

		ps.execute();

		conn.close();
	}

	// 메세지 상세보기
	public MessageVo detailMessage(int msg_no, String uid) throws Exception {
		Connection conn = JdbcUtils.connect();
		String sql = "select * from (" + "		select msg.no , msg.receiver,msg.sender," + "		msg.sendtime ,"
				+ "		NVL(to_char(msg.readtime,'YYYY-MM-DD 24HH:MM:SS'),"
				+ "		'읽지 않은 메세지') readtime ,msgcon.title, msgcon.text "
				+ "from message msg inner join messageContext msgcon"
				+ "		on msg.no=msgcon.no) where receiver = ? and no = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, uid);
		ps.setInt(2, msg_no);

		ResultSet rs = ps.executeQuery();
		rs.next();

		MessageVo messageVo = new MessageVo();
		messageVo.setMsg_no(rs.getInt("no"));
		messageVo.setMsg_sender(rs.getString("sender"));
		messageVo.setMsg_sendTime(rs.getString("sendTime"));
		messageVo.setMsg_readTime(rs.getString("readTime"));
		messageVo.setMsgCon_title(rs.getString("title"));
		messageVo.setMsgCon_text(rs.getString("text"));

		conn.close();
		return messageVo;
	}

	// 안 읽은 메세지 갯수 가져오기.
	public int getNotReadCount(String mem_id) throws Exception {

		Connection conn = JdbcUtils.connect();
		String sql = "select count(msg.no) from message msg inner join "
				+ "    messageContext msgcon on msg.no = msgcon.msg_no " + "    where receiver = ? ";

		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, mem_id);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int notRead = rs.getInt(1);
		conn.close();
		return notRead;
	}

	// 받은 ,보낸 , 읽지 않은 쪽지함
	public List<MessageVo> searchMessage(String type , String keyword) throws Exception {

		Connection conn = JdbcUtils.connect();
		String sql = "select msg.no no , sender , sendTime , readTime , title , text"
				+ "from message msg inner join messagecontext msgCon on msg.no = msgCon.msg_no "
				+ "where instr( #1 , ? )>0";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<MessageVo> list = new ArrayList<MessageVo>();
		while(rs.next()) {
			MessageVo messageVo = new MessageVo();
			messageVo.setMsg_no(rs.getInt("no"));
			messageVo.setMsg_sender(rs.getString("sender"));
			messageVo.setMsg_sendTime(rs.getString("sendTime"));
			messageVo.setMsg_readTime(rs.getString("readTime"));
			messageVo.setMsgCon_title(rs.getString("title"));
			messageVo.setMsgCon_text(rs.getString("text"));
			
			list.add(messageVo);
		}
		
		conn.close();
		return list;
	}

}
