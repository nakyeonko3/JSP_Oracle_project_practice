package test1;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpsDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL =  "jdbc:oracle:thin:@localhost:1521:XE";
	
	// DB 연결을 가져오는 메서드, DBCP를 사용하는 것이 좋음
	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"scott","TIGER");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<Emps> getAll() throws Exception {
		Connection conn = open();
		List<Emps> empsList = new ArrayList<>();
		
//		String sql = "select aid, title, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate from news";
		String sql = "select aid, title, ndate as cdate from news";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				Emps n = new Emps();
				n.setAid(rs.getInt("aid"));
				n.setTitle(rs.getString("title"));
				n.setDate(rs.getString("cdate")); 
				
				empsList.add(n);
			}
			return empsList;
		}

	}
	
	public Emps getEmps(int aid) throws SQLException {
		Connection conn = open();

		Emps n = new Emps();
//		String sql = "select aid, title, img, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate, content from news where aid=?";
		String sql = "select aid, title, img, ndate as cdate, content from news where aid=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, aid);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		try(conn; pstmt; rs) {
			n.setAid(rs.getInt("aid"));
			n.setTitle(rs.getString("title"));
			n.setImg(rs.getString("img"));
			n.setDate(rs.getString("cdate"));
			n.setContent(rs.getString("content"));
			pstmt.executeQuery();
			return n;
		}
	}
	
	public void addEmps(Emps n) throws Exception {
		Connection conn = open();
		
//		String sql = "insert into news(title,img,date,content) values(?,?,CURRENT_TIMESTAMP(),?)";
//		INSERT INTO news(aid , title, img, ndate, content) VALUES (aid_seq.NEXTVAL, 'aa', 'bb', CURRENT_TIMESTAMP, 'sdsd');

		String sql = "INSERT INTO news(aid , title, img, ndate, content) VALUES (aid_seq.NEXTVAL, ?, ?, CURRENT_TIMESTAMP, ?)";
//		String sql = "INSERT INTO news(aid , title, img, ndate, content) VALUES (aid_seq.NEXTVAL, 'aa', 'bb', CURRENT_TIMESTAMP, 'sdsd');";
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getImg());
			pstmt.setString(3, n.getContent());
			pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
	}
	}
	
	public void delEmps(int aid) throws SQLException {
		Connection conn = open();
		
		String sql = "delete from news where aid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		try(conn; pstmt) {
			pstmt.setInt(1, aid);
			// 삭제된 뉴스 기사가 없을 경우
			if(pstmt.executeUpdate() == 0) {
				throw new SQLException("DB에러");
			}
		}
	}
}
