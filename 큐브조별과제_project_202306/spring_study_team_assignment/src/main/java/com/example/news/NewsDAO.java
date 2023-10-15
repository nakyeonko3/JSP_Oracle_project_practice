package com.example.news;

import com.example.news.News;
import org.springframework.stereotype.Component;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class NewsDAO {
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
	
	public List<News> getAll() throws Exception {
		Connection conn = open();
		List<News> newsList = new ArrayList<>();

		String sql = "select * from sensor_data order by datetime desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();


		
		try(conn; pstmt; rs) {
			while(rs.next()) {
				News n = new News();
				n.setDatetime(rs.getString("datetime"));
				n.setHumidity(rs.getInt("humidity"));
				n.setTemperature(rs.getInt("temperature"));
				System.out.println(rs.getString("datetime"));
				System.out.println(rs.getInt("humidity"));
				System.out.println(rs.getString("humidity"));

				newsList.add(n);
			}
			return newsList;			
		}
	}
//	public News getNews(int aid) throws SQLException {
//		Connection conn = open();
//
//		News n = new News();
////		String sql = "select aid, title, img, PARSEDATETIME(date,'yyyy-MM-dd hh:mm:ss') as cdate, content from news where aid=?";
//		String sql = "select aid, title, img, ndate as cdate, content from news where aid=?";
//
//		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, aid);
//		ResultSet rs = pstmt.executeQuery();
//
//		rs.next();
//
//		try(conn; pstmt; rs) {
//			n.setDatetime(rs.getString("datetime"));
//			n.setHumidity(rs.getInt("humidity"));
//			n.setTemperature(rs.getInt("temperature"));
//
//			pstmt.executeQuery();
//			return n;
//		}
//	}


}
