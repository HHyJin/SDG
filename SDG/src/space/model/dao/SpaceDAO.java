package space.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;


import space.model.vo.SpacesTimeTable;

import space.model.vo.SpacesDefault;
import space.model.vo.SpacesPrice;
import space.model.vo.SpacesTimeExp;

public class SpaceDAO {
	private Properties prop = new Properties();

	public SpaceDAO() {
		String fileName = SpaceDAO.class.getResource("/sql/spc/space-query.properties").getPath();
		System.out.println("fileName@MemberDAO=" + fileName);

		try {

			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertComp(Connection conn, SpacesDefault spDefault) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertComp");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, spDefault.getMemberId());
			pstmt.setString(2, spDefault.getSpcName());
			pstmt.setString(3,  spDefault.getSpcAddr());
			pstmt.setString(4,  spDefault.getSpcContent());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	public int insertSpaceTimeTable(Connection conn, SpacesTimeTable spacestimetable) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertSpaceTimeTable");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, spacestimetable.getSpcDetNo());
			pstmt.setString(2, spacestimetable.getSpcDay());
			pstmt.setInt(3, spacestimetable.getSpcHourStart());
			pstmt.setInt(4, spacestimetable.getSpcHourEnd());
			pstmt.setString(5,String.valueOf(spacestimetable.getSpcAvail()));

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertSapceTimeExp(Connection conn, SpacesTimeExp spacetimeexp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertSapceTimeExp");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, spacetimeexp.getSpcDetNo());
			pstmt.setDate(2, spacetimeexp.getSpcExcDate());
			pstmt.setInt(3, spacetimeexp.getSpcExcStart());
			pstmt.setInt(4, spacetimeexp.getSpcExcEnd());
			pstmt.setString(5,String.valueOf(spacetimeexp.getSpcAvail()));

			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPrice(Connection conn, SpacesPrice spaceprice) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertPrice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, spaceprice.getSpcPriceNo());
			pstmt.setInt(2, spaceprice.getSpcDetNo());
			pstmt.setString(3, spaceprice.getSpcDetName());
			pstmt.setString(4, spaceprice.getSpcPriceDay());
			pstmt.setInt(5, spaceprice.getSpcPriceStart());
			pstmt.setInt(6, spaceprice.getSpcPriceEnd());
			pstmt.setString(7,String.valueOf(spaceprice.getSpcPricePeak()));
			pstmt.setString(8,String.valueOf(spaceprice.getSpcPricePer()));
			pstmt.setString(9,String.valueOf(spaceprice.getSpcPriceDayBool()));
			pstmt.setInt(10, spaceprice.getSpcPricePrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
