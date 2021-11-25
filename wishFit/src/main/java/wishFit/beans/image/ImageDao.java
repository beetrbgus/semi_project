package wishFit.beans.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import wishFit.beans.board.BoardDto;
import wishFit.beans.board.BoardImageVO;
import wishFit.util.JdbcUtils;

public class ImageDao {
	private Connection conn;
	
	// 보드Dao에 들어가야할 애들이 왜 여기로
	
	
	public int imageSeq() throws Exception{
	      conn = JdbcUtils.connect();
	      String sql = "select image_seq.nextval from dual";
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ResultSet rs = ps.executeQuery(sql);
	      
	      
	      rs.next();
	      //다음 시퀀스 번호를 seq에 저장
	      int seq = rs.getInt("nextval");
	      
	      conn.close();
	      
	      return seq;
	   }
	   //Image 등록 처리
	   public void insert(ImageDto imageDto) throws Exception{
	      conn=JdbcUtils.connect();
	      String sql = "insert into image values(?,?,?,?,?,?)";
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ps.setInt(1, imageDto.getImageNo());
	      ps.setInt(2, imageDto.getBoardNo());
	      ps.setString(3, imageDto.getBoardUpload());
	      ps.setString(4, imageDto.getBoardSave());
	      ps.setLong(5, imageDto.getBoardSize());
	      ps.setString(6, imageDto.getBoardType());
	      
	      ps.execute();

	      conn.close();
	   }
	   //Image 단일 조회
	   public BoardImageVO search(int imageNo) throws Exception{
	      conn=JdbcUtils.connect();
	      String sql = "select * from image where image_no=?";
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ps.setInt(1, imageNo);
	      ResultSet rs = ps.executeQuery();
	      
	      //있는지 확인
	      BoardImageVO boardImageVO;
	      if(rs.next()) {
	         boardImageVO = new BoardImageVO();
	         
	         boardImageVO.setImageNo(rs.getInt("image_no"));
	         boardImageVO.setBoardNo(rs.getInt("board_no"));
	         boardImageVO.setBoardUpload(rs.getString("board_upload"));
	         boardImageVO.setBoardSave(rs.getString("board_save"));
	         boardImageVO.setBoardSize(rs.getLong("board_size"));
	         boardImageVO.setBoardType(rs.getString("board_type"));
	      }else {
	         boardImageVO=null;
	      }
	      conn.close();

	      return boardImageVO;
	         
	   }
	   //이미지 list조회
	   public List<BoardImageVO> find(int boardNo) throws Exception{
	      conn = JdbcUtils.connect();
	      String sql = "select B.*,I.image_no "
	            + "from board B left outer join image I on B.board_no=I.board_no "
	            + "where B.board_no = ? "
	            + "order by B.board_no;";
	      PreparedStatement ps = conn.prepareStatement(sql);
	      ps.setInt(1, boardNo);
	      ResultSet rs = ps.executeQuery();
	      List<BoardImageVO> list = new ArrayList<>();
	      while(rs.next()) {
	         BoardImageVO boardImageVO = new BoardImageVO();
	         
	         boardImageVO.setImageNo(rs.getInt("imageNo"));
	         boardImageVO.setBoardNo(rs.getInt("boardNo"));
	         boardImageVO.setBoardUpload(rs.getString("boardUpload"));
	         boardImageVO.setBoardSave(rs.getString("boardSave"));
	         boardImageVO.setBoardSize(rs.getLong("boardSize"));
	         boardImageVO.setBoardType(rs.getString("boardType"));
	         
	         list.add(boardImageVO);
	      }
	      conn.close();
	      return list;
	   }
	   
	   // 글리스트에 썸네일 추가  select * from Board B left outer join image I on B.board_no = I.board_no order by B.board_no desc;
	   public List<BoardImageVO> listByRownum(int begin, int end) throws Exception {
		   conn = JdbcUtils.connect();
		   
		   String sql = "select * from ( "
		   		+ "select rownum rn, TMP.* from ("
		   		+ "select * from Board B left outer join image I on B.board_no = I.board_no order by B.board_no desc"
		   		+ ")TMP"
		   		+ ") where rn between ? and ?";
		   
		   PreparedStatement ps = conn.prepareStatement(sql);
		   ps.setInt(1, begin);
		   ps.setInt(2, end);
		   ResultSet rs = ps.executeQuery();
		   
		   List<BoardImageVO> list = new ArrayList<>();
		   
		   while(rs.next()) {
			   BoardImageVO boardImageVo = new BoardImageVO();
			   
			   boardImageVo.setBoardNo(rs.getInt("board_no"));
			   boardImageVo.setImageNo(rs.getInt("image_no"));
			   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
			   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
			   boardImageVo.setBoardTitle(rs.getString("board_title"));
			   boardImageVo.setBoardWriter(rs.getString("board_writer"));
			   boardImageVo.setBoardDate(rs.getString("board_date"));
			   boardImageVo.setBoardRead(rs.getInt("board_read"));
			   boardImageVo.setBoardLike(rs.getInt("board_like"));
			   boardImageVo.setBoardHate(rs.getInt("board_hate"));
			   
			   list.add(boardImageVo);
		   }
		   conn.close();
		   
		   return list;
	   }
	   
	 //페이징 검색
		public List<BoardImageVO> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
			conn = JdbcUtils.connect();

			String sql = "select * from ("
									+ "select rownum rn, TMP.* from ("
										+ "select * from (select * from board where instr(#1, ?) > 0) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc"
									+ ")TMP"
							+ ") where rn between ? and ?";
			sql = sql.replace("#1", column);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			List<BoardImageVO> list = new ArrayList<>();
			   
			   while(rs.next()) {
				   BoardImageVO boardImageVo = new BoardImageVO();
				   
				   boardImageVo.setBoardNo(rs.getInt("board_no"));
				   boardImageVo.setImageNo(rs.getInt("image_no"));
				   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
				   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
				   boardImageVo.setBoardTitle(rs.getString("board_title"));
				   boardImageVo.setBoardWriter(rs.getString("board_writer"));
				   boardImageVo.setBoardDate(rs.getString("board_date"));
				   boardImageVo.setBoardRead(rs.getInt("board_read"));
				   boardImageVo.setBoardLike(rs.getInt("board_like"));
				   boardImageVo.setBoardHate(rs.getInt("board_hate"));
				   
				   list.add(boardImageVo);
			}
			
			conn.close();
			
			return list;
		}
		
		// 전체글 카운트
		public int count() throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from Board B left outer join image I on B.Board_no = I.image_no";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			
			conn.close();
			
			return count;
		}
		// 전체글에서 검색글 수
		public int count(String column, String keyword) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from (select * from board where instr(?, ?) > 0) B left outer join Image I on B.board_no = I.board_no";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, column);
			ps.setString(2, keyword);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			
			conn.close();
	
			return count;
		}
		// 대분류
		public int largeCount(String boardLargeName) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from ("
					+ "select * from board where board_large_name = ?"
					+ ") B left outer join Image I on B.board_no = I.board_no";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int largeCount = rs.getInt(1);
			
			conn.close();
			
			return largeCount;
		}
		// 대분류 검색
		public int largeSearchCount(String boardLargeName, String column, String keyword) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from ("
					+ "select * from board where board_large_name = ? and instr(?, ?) > 0"
					+ ") B left outer join Image I on B.board_no = I.board_no";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ps.setString(2, column);
			ps.setString(3, keyword);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int largeSearchCount = rs.getInt(1);
			
			conn.close();
			
			return largeSearchCount;
		}
		
		
		// 중분류까지만 계산
		public int middleCount(String boardLargeName, String boardMiddleName) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from (select * from board where board_large_name = ? and board_middle_name = ?) B left outer join Image I on B.board_no = I.board_no";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ps.setString(2, boardMiddleName);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int middleCount = rs.getInt(1);
			
			conn.close();
			
			return middleCount;
			
		}
		
		public int likeCount(String boardLargeName, String boardMiddleName) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from (select * from board where board_large_name = ? and board_middle_name = '추천글') B left outer join Image I on B.board_no = I.board_no";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int likeCount = rs.getInt(1);
			
			conn.close();
			
			return likeCount;
			
		}
		
		
		//완전검색
		public int count(String boardLargeName, String boardMiddleName, String column, String keyword)throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select count(*) from ("
					+ "select * from board where board_large_name = ? and board_middle_name = ? and instr(?, ?) > 0"
					+ ") B left outer join Image I on B.board_no = I.board_no";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ps.setString(2, boardMiddleName);
			ps.setString(3, column);
			ps.setString(4, keyword);
			
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			
			int count = rs.getInt(1);
			
			conn.close();
			
			return count;
		}
		
		
		
		
		
		// 페이징 재작성 
		
		// 대분류만 설정된 각 게시판리스트
		public List<BoardImageVO> largeList(String boardLargeName, int begin, int end) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
					+ "select * from (select * from board where board_large_name = ?) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc"
					+ ")TMP"
					+ ") where rn between ? and ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ps.setInt(2, begin);
			ps.setInt(3, end);
			
			ResultSet rs = ps.executeQuery();
			
			List<BoardImageVO> list = new ArrayList<>();
			while(rs.next()) {
				BoardImageVO boardImageVo = new BoardImageVO();
				
				boardImageVo.setBoardNo(rs.getInt("board_no"));
				   boardImageVo.setImageNo(rs.getInt("image_no"));
				   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
				   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
				   boardImageVo.setBoardTitle(rs.getString("board_title"));
				   boardImageVo.setBoardWriter(rs.getString("board_writer"));
				   boardImageVo.setBoardDate(rs.getString("board_date"));
				   boardImageVo.setBoardRead(rs.getInt("board_read"));
				   boardImageVo.setBoardLike(rs.getInt("board_like"));
				   boardImageVo.setBoardHate(rs.getInt("board_hate"));
				   
				   list.add(boardImageVo);
			}
			
			conn.close();
			
			return list;
			
		}
		
				// 대분류 + 검색
				public List<BoardImageVO> largeSearchList(String boardLargeName, String column, String keyword,  int begin, int end) throws Exception {
					conn = JdbcUtils.connect();
					
					String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
							+ "select * from (select * from board where board_large_name = ? and instr(#1, ?) > 0) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
					sql = sql.replace("#1", column);
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, boardLargeName);
					ps.setString(2, keyword);
					ps.setInt(3, begin);
					ps.setInt(4, end);
					
					ResultSet rs = ps.executeQuery();
					
					List<BoardImageVO> list = new ArrayList<>();
					while(rs.next()) {
						BoardImageVO boardImageVo = new BoardImageVO();
						
						boardImageVo.setBoardNo(rs.getInt("board_no"));
						   boardImageVo.setImageNo(rs.getInt("image_no"));
						   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
						   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
						   boardImageVo.setBoardTitle(rs.getString("board_title"));
						   boardImageVo.setBoardWriter(rs.getString("board_writer"));
						   boardImageVo.setBoardDate(rs.getString("board_date"));
						   boardImageVo.setBoardRead(rs.getInt("board_read"));
						   boardImageVo.setBoardLike(rs.getInt("board_like"));
						   boardImageVo.setBoardHate(rs.getInt("board_hate"));
						   
						   list.add(boardImageVo);
					}
					
					conn.close();
					
					return list;
					
				}
		
		
		// 대분류,중분류 선택하고 검색까지 한 경우
		public List<BoardImageVO> searchList(String boardLargeName, String boardMiddleName, String column, String keyword, int begin, int end) throws Exception {
			conn = JdbcUtils.connect();
			
			String sql = "select * from (select rownum rn, TMP.* from (select * from (select * from board where board_large_name = ? and board_middle_name = ? and instr(#1, ?) > 0) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc)TMP) where rn between ? and ?";
			sql = sql.replace("#1", column);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, boardLargeName);
			ps.setString(2, boardMiddleName);
			ps.setString(3, keyword);
			ps.setInt(4, begin);
			ps.setInt(5, end);
			
			ResultSet rs = ps.executeQuery();
			
			List<BoardImageVO> list = new ArrayList<>();
			while(rs.next()) {
				BoardImageVO boardImageVo = new BoardImageVO();
				
				boardImageVo.setBoardNo(rs.getInt("board_no"));
				   boardImageVo.setImageNo(rs.getInt("image_no"));
				   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
				   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
				   boardImageVo.setBoardTitle(rs.getString("board_title"));
				   boardImageVo.setBoardWriter(rs.getString("board_writer"));
				   boardImageVo.setBoardDate(rs.getString("board_date"));
				   boardImageVo.setBoardRead(rs.getInt("board_read"));
				   boardImageVo.setBoardLike(rs.getInt("board_like"));
				   boardImageVo.setBoardHate(rs.getInt("board_hate"));
				   
				   list.add(boardImageVo);
			}
			
			conn.close();
			
			return list;
			
		}
				// 중분류
				public List<BoardImageVO> middleList(String boardLargeName, String boardMiddleName,  int begin, int end) throws Exception {
					conn = JdbcUtils.connect();
					
					String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
							+ "select * from (select * from board where board_large_name = ? and board_middle_name = ?) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, boardLargeName);
					ps.setString(2, boardMiddleName);
					ps.setInt(3, begin);
					ps.setInt(4, end);
					
					ResultSet rs = ps.executeQuery();
					
					List<BoardImageVO> list = new ArrayList<>();
					while(rs.next()) {
						BoardImageVO boardImageVo = new BoardImageVO();
						
						boardImageVo.setBoardNo(rs.getInt("board_no"));
						   boardImageVo.setImageNo(rs.getInt("image_no"));
						   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
						   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
						   boardImageVo.setBoardTitle(rs.getString("board_title"));
						   boardImageVo.setBoardWriter(rs.getString("board_writer"));
						   boardImageVo.setBoardDate(rs.getString("board_date"));
						   boardImageVo.setBoardRead(rs.getInt("board_read"));
						   boardImageVo.setBoardLike(rs.getInt("board_like"));
						   boardImageVo.setBoardHate(rs.getInt("board_hate"));
						   
						   list.add(boardImageVo);
					}
					
					conn.close();
					
					return list;
					
				}
		
				
				// 추천순
				public List<BoardImageVO> likeList(String boardLargeName,  int begin, int end) throws Exception {
					conn = JdbcUtils.connect();
				
					String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
							+ "select * from (select * from board where board_large_name = ? and board_middle_name = '추천글') B left outer join Image I on B.board_no = I.board_no order by B.board_like desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, boardLargeName);
					ps.setInt(2, begin);
					ps.setInt(3, end);
					
					ResultSet rs = ps.executeQuery();
					
					List<BoardImageVO> list = new ArrayList<>();
					while(rs.next()) {
						BoardImageVO boardImageVo = new BoardImageVO();
						
						boardImageVo.setBoardNo(rs.getInt("board_no"));
						   boardImageVo.setImageNo(rs.getInt("image_no"));
						   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
						   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
						   boardImageVo.setBoardTitle(rs.getString("board_title"));
						   boardImageVo.setBoardWriter(rs.getString("board_writer"));
						   boardImageVo.setBoardDate(rs.getString("board_date"));
						   boardImageVo.setBoardRead(rs.getInt("board_read"));
						   boardImageVo.setBoardLike(rs.getInt("board_like"));
						   boardImageVo.setBoardHate(rs.getInt("board_hate"));
						   
						   list.add(boardImageVo);
					}
					
					conn.close();
					
					return list;
					
				}	
				
				// 전체글 검색 (마켓 커뮤 등등)
				public List<BoardImageVO> totalSearchList(String column, String keyword,  int begin, int end) throws Exception {
					conn = JdbcUtils.connect();
					
					String sql = "select * from ("
							+ "select rownum rn, TMP.* from ("
							+ "select * from (select * from board where instr(#1, ?) > 0) B left outer join Image I on B.board_no = I.board_no order by B.board_no desc"
							+ ")TMP"
							+ ") where rn between ? and ?";
					sql = sql.replace("#1", column);
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, keyword);
					ps.setInt(2, begin);
					ps.setInt(3, end);
					
					ResultSet rs = ps.executeQuery();
					
					List<BoardImageVO> list = new ArrayList<>();
					while(rs.next()) {
						BoardImageVO boardImageVo = new BoardImageVO();
						
						boardImageVo.setBoardNo(rs.getInt("board_no"));
						   boardImageVo.setImageNo(rs.getInt("image_no"));
						   boardImageVo.setBoardLargeName(rs.getString("board_large_name"));
						   boardImageVo.setBoardMiddleName(rs.getString("board_middle_name"));
						   boardImageVo.setBoardTitle(rs.getString("board_title"));
						   boardImageVo.setBoardWriter(rs.getString("board_writer"));
						   boardImageVo.setBoardDate(rs.getString("board_date"));
						   boardImageVo.setBoardRead(rs.getInt("board_read"));
						   boardImageVo.setBoardLike(rs.getInt("board_like"));
						   boardImageVo.setBoardHate(rs.getInt("board_hate"));
						   
						   list.add(boardImageVo);
					}
					
					conn.close();
					
					return list;
					
				}
}
