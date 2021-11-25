package wishFit.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GetSeq {
	//시퀀스 구하는 sql 
	public static int getSequence(String seqName) throws Exception{
		Connection conn = JdbcUtils.connect();
		String sql = "select #1.nextval from dual";
		sql = sql.replace("#1", seqName);
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		
		conn.close();
		return seq; 
	}
}
