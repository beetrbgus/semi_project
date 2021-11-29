package wishFit.beans.message;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import wishFit.util.JdbcUtils;
public class MessageDao {
	Connection conn;
	// 쪽지 보내기
	public void send(MessageVo messageVo) throws Exception {
		conn = JdbcUtils.connect();
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
		String sql = "insert into MessageContext values(msgcon_seq.nextval, ? ,? ,? )";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, messageVo.getMsg_no());
		ps.setString(2, messageVo.getMsgCon_title());
		ps.setString(3, messageVo.getMsgCon_text());
		ps.execute();
	}
	// 쪽지 삭제
	public void deleteMessage(int msg_no, String mem_id) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "delete Message where no = ? and receiver = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, msg_no);
		ps.setString(2, mem_id);
		ps.execute();
		conn.close();
	}
	// 메세지 상세보기
	public MessageVo detailMessage(int msg_no, String uid) throws Exception {
		conn = JdbcUtils.connect();
		String sql = 
					"select msg.no msg_no, msg.receiver msg_receiver ,msg.sender msg_sender,"
					+ " msg.sendtime msg_sendtime, msg.readtime msg_readtime , "
					+ "msgcon.title msg_title,  msgcon.text msg_text,"
					+ " m.mem_nick mem_nick , m.mem_grade mem_grade, mp.mp_no  "
					+ "	from message msg "
					+ "		inner join messagecontext msgcon "
					+ "    		on msg.no = msgcon.msg_no "
					+ "		inner join member m "
					+ "    		on msg.sender = m.mem_id "
					+ "		left outer join member_profile mp "
					+ "    		on m.mem_id = mp.mp_id where msg.no = ? and msg.receiver = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, msg_no);
		ps.setString(2, uid);
		ResultSet rs = ps.executeQuery();
		MessageVo messageVo = new MessageVo();
		if (rs.next()) {
			messageVo.setMsg_no(rs.getInt("msg_no"));
			messageVo.setMsg_receiver(rs.getString("msg_receiver"));
			messageVo.setMsg_sender(rs.getString("msg_sender"));
			messageVo.setMsg_sendTime(rs.getString("msg_sendtime"));
			messageVo.setMsg_readTime(rs.getString("msg_readtime"));
			messageVo.setMsgCon_title(rs.getString("msg_title"));
			messageVo.setMsgCon_text(rs.getString("msg_text"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setMem_grade(rs.getString("mem_grade"));
			messageVo.setProfile_no(rs.getInt("mp_no"));
		}
		conn.close();
		return messageVo;
	}
	// 안 읽은 메세지 갯수 가져오기.
	public int getNotReadCount(String mem_id) throws Exception {

		conn = JdbcUtils.connect();
		String sql = "select count(msg.no) from message msg inner join "
				+ "    messageContext msgcon on msg.no = msgcon.msg_no " 
				+ "    where receiver = ? and readtime is null";

		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, mem_id);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int notRead = rs.getInt(1);
		conn.close();
		return notRead;
	}
	// 검색어 있는 쪽지 갯수 세기
	public int count(String uid, String column, String keyword) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(msg.no) from message msg inner join "
				+ "    messageContext msgcon on msg.no = msgcon.msg_no "
				+ "    where instr(#1 , ?) > 0 and  receiver = ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, keyword);
		ps.setString(2, uid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		conn.close();
		return result;
	}
	// 전체 쪽지 갯수 세기
	public int count(String uid) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select count(msg.no) from message msg inner join "
				+ "    messageContext msgcon on msg.no = msgcon.msg_no " + "    where receiver = ?";
		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, uid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		conn.close();
		return result;
	}
	// 전체 메세지 목록
	public List<MessageVo> allMsgList(String mem_id, int begin, int end) throws Exception {
		conn = JdbcUtils.connect();
		System.out.println(" mem_id  " + mem_id );
		System.out.println(" begin  " + begin );
		System.out.println(" end  " + end );
		String sql = 
					"select *  from ( "
				+ "		select rownum rn, TMP.* from ( "
				+ "			select msg.no msg_no, sender msg_sender , "
				+ "					mem_nick ,mp.mp_no profile_no, "
				+ "    			msgcon.title msg_title ,msgcon.text msg_text, sendTime msg_sendTime, "
				+ "    		readtime msg_readtime"
				+ "    	from member m left outer join member_profile mp on m.mem_id = mp.mp_id "
				+ "    		left outer join message msg on msg.sender = m.mem_id "
				+ "    		left outer join messageContext msgcon on msg.no = msgCon.no "
				+ "		where receiver = ? order by sendtime desc" 
				+ "		)TMP) where rn between ? and ? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		System.out.println("MessageDao  :  receiver   " + mem_id);
		ps.setString(1, mem_id);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		
		ResultSet rs = ps.executeQuery();
		List<MessageVo> list = new ArrayList<MessageVo>();
		System.out.println("MessageDao      while 전 " );
		while (rs.next()) {
			System.out.println("MessageDao      next 들어옴 " );
			MessageVo messageVo = new MessageVo();
			messageVo.setMsg_no(rs.getInt("msg_no"));
			messageVo.setMsg_sender(rs.getString("msg_sender"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setProfile_no(rs.getInt("profile_no"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setProfile_no(rs.getInt("profile_no"));
			messageVo.setMsgCon_title(rs.getString("msg_title"));
			messageVo.setMsgCon_text(rs.getString("msg_text"));
			messageVo.setMsg_sendTime(rs.getString("msg_sendTime"));
			messageVo.setMsg_readTime(rs.getString("msg_readtime"));
			list.add(messageVo);
		}
		System.out.println("MessageDao      while 후 " );
		conn.close();
		return list;
	}
	// 안읽은 메세지 목록
	public List<MessageVo> notReadMsgList(String mem_id, int begin, int end) throws Exception {
		conn = JdbcUtils.connect();
		String sql = 
					"select *  from ( "
				+ "		select rownum rn, TMP.* from ( "
				+ "			select msg.no msg_no, sender msg_sender , "
				+ "					mem_nick ,mp.mp_no profile_no, "
				+ "    			msgcon.title msg_title ,msgcon.text msg_text, sendTime msg_sendTime, "
				+ "    		NVL(to_char(readtime),'안읽음') msg_readtime"
				+ "    	from member m left outer join member_profile mp on m.mem_id = mp.mp_id "
				+ "    		left outer join message msg on msg.sender = m.mem_id "
				+ "    		left outer join messageContext msgcon on msg.no = msgCon.no "
				+ "		where receiver = ? and readtime is null order by sendtime desc" 
				+ "		)TMP) where rn between ? and ? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, mem_id);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		List<MessageVo> list = new ArrayList<MessageVo>();
		while (rs.next()) {
			MessageVo messageVo = new MessageVo();
			messageVo.setMsg_no(rs.getInt("msg_no"));
			messageVo.setMsg_sender(rs.getString("msg_sender"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setProfile_no(rs.getInt("profile_no"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setProfile_no(rs.getInt("profile_no"));
			messageVo.setMsgCon_title(rs.getString("msg_title"));
			messageVo.setMsgCon_text(rs.getString("msg_text"));
			messageVo.setMsg_sendTime(rs.getString("msg_sendTime"));
			messageVo.setMsg_readTime(rs.getString("msg_readtime"));
			System.out.println("MessageDao  :  messageVo   " + messageVo.getMsg_no());
			list.add(messageVo);
		}
		conn.close();
		return list;
	}

	// 보낸 column = sender  keyword = 내 아이디
	public List<MessageVo> receiveMessage(String uid, String column, String keyword, int begin, int end)
			throws Exception {
		conn = JdbcUtils.connect();
		String sql = "select *  from ( " + "    select rownum rn, TMP.* from ( "
				+ "      select msg.no , msg.receiver , m.mem_nick, msg.sender ,msg.sendtime , msg.readtime ,msgcon.title, msgcon.text, mp.mp_no "
				+ "			from message msg  "
				+ "				inner join messageContext msgcon on msg.no = msgcon.msg_no "
				+ "				left outer join member m  on m.mem_id = receiver"
				+ "				left outer join member_profile mp " 
				+ "					on msg.receiver = mp.mp_id "
				+ "        where instr(#1 , ?) > 0 order by sendtime desc)TMP "
				+ "	  ) where rn between ? and ? ";
		sql = sql.replace("#1", column);
		PreparedStatement ps = conn.prepareCall(sql);
		ps.setString(1, uid);
		ps.setInt(2, begin);
		ps.setInt(3, end);

		ResultSet rs = ps.executeQuery();
		List<MessageVo> result = new ArrayList<MessageVo>();

		System.out.println();
		while (rs.next()) {
			MessageVo messageVo = new MessageVo();

			messageVo.setMsg_no(rs.getInt("no"));
			messageVo.setMsg_sender(rs.getString("sender"));
			messageVo.setMsg_sendTime(rs.getString("sendTime"));
			messageVo.setMsg_readTime(rs.getString("readTime"));
			messageVo.setMem_nick(rs.getString("mem_nick"));
			messageVo.setMsgCon_title(rs.getString("title"));
			messageVo.setMsgCon_text(rs.getString("text"));

			result.add(messageVo);

		}
		conn.close();

		return result;
	}

	public void readMsg(int no , String uid) throws Exception {
		conn = JdbcUtils.connect();
		String sql = "update message set readtime = sysdate where no = ? and readtime is null and receiver= ?";
		PreparedStatement ps =  conn.prepareStatement(sql);
		ps.setInt(1, no);
		ps.setString(2, uid);
		int result = ps.executeUpdate();
		conn.close();

	}
}