package com.ict.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO {
	Connection conn;
	PreparedStatement pstm;
	ResultSet rs; // select���� ��� 
	
	// �̱���
	private static DAO dao = new DAO();
	public static DAO getInstance() {
		return dao;
	}
	
	//DB ����
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
	
	// DBó�� �޼ҵ�� ����� 
	// �α����� �޼ҵ� �����
	// select => ����� �ϳ��̸� VO,  ����� �������̸� List<VO>
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
				vo.setIdx(rs.getString("idx"));
				vo.setId(rs.getString("id"));
				vo.setPw(rs.getString("pw"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getString("age"));
				vo.setAddr(rs.getString("addr"));
				vo.setReg(rs.getString("reg"));
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
}








