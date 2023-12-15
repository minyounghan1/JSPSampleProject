package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.HobbyListDTO;
import db.util.DBConnectionManager;

public class HobbyListDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<HobbyListDTO> findHobbyInfoList() {

		conn = DBConnectionManager.connectDB();

		String sql = " SELECT * FROM t_hobby_list ORDER BY id";

		List<HobbyListDTO> hobbyInfoList = null;

		try {
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();
			hobbyInfoList = new ArrayList<HobbyListDTO>();

			while (rs.next()) {
				
//				if(hobbyInfoList == null) {
//					hobbyInfoList = new ArrayList<HobbyListDTO>();
//				}

				HobbyListDTO hobbyListDTO = new HobbyListDTO(rs.getInt("id"), rs.getInt("no"), rs.getString("hobby"),
						rs.getInt("prefer"));

				hobbyInfoList.add(hobbyListDTO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.closeDB(conn, psmt, rs);
		}

		return hobbyInfoList;
	}

}
