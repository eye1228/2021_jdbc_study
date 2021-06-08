package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs; // select문의 결과 
	
	// 싱글톤
	private static DAO dao = new DAO();
	public static DAO getInstance() {
		return dao;
	}
	
	//DB 접속
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.0.4:1521:xe";
			String user = "c##ictedu";
			String password = "1111";
			conn = DriverManager.getConnection(url, user, password);
			return conn;
		} catch (Exception e) {
			System.out.println(e);
		}
	   return null;	
	}
	
	// DB처리 메소드들 만들기 
	// 로그인할 메소드 만들기
	// select => 결과가 하나이면 VO,  결과가 여러개이면 List<VO>
	public VO getLogIn(VO vo) {
		try {
			VO vo2 = null;
			conn = getConnection();
			String sql = "select * from members where id=? and pw=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,vo.getId());
			pstm.setString(2,vo.getPw());
			
			rs = pstm.executeQuery();
			if(rs.next()) {
				vo2 = new VO();
				vo2.setIdx(rs.getString("idx"));
				vo2.setId(rs.getString("id"));
				vo2.setPw(rs.getString("pw"));
				vo2.setName(rs.getString("name"));
				vo2.setAge(rs.getString("age"));
				vo2.setAddr(rs.getString("addr"));
				vo2.setReg(rs.getString("reg"));
			}
			return vo2;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	// insert, update, delete 의 결과는 int 
	public int getInsert(VO vo) {
		try {
			int result = 0 ;
			conn = getConnection();
			String sql = "insert into members values(members_seq.nextval,?,?,?,?,?,sysdate)";
			pstm=conn.prepareStatement(sql);
			pstm.setString(1,vo.getId() );
			pstm.setString(2,vo.getPw() );
			pstm.setString(3,vo.getName() );
			pstm.setString(4,vo.getAge() );
			pstm.setString(5,vo.getAddr() );
			
			result = pstm.executeUpdate();
			return result;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return 0;
	}
	
	
	// select => 결과가 하나이면 VO,  결과가 여러개이면 List<VO>
	public List<VO> getSelectAll() {
		try {
			List<VO> list = new ArrayList<VO>();
			
			conn = getConnection();
			String sql = "select * from members order by idx";
			pstm = conn.prepareStatement(sql);
			
			rs = pstm.executeQuery();
			while(rs.next()) {
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg"));
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	public VO getDetail(String idx) {
		try {
			VO vo = null;
			conn = getConnection();
			String sql = "select * from members where idx=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idx);
			rs = pstm.executeQuery();
			if (rs.next()) {
				vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg"));
			}
			return vo;
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstm.close();
				conn.close();
			} catch (Exception e2) {
			}
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}








