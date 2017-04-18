package songDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.BookingBean;
import songJDBC.ConnectionJDBC;

public class BookingDAO {
	private Connection connection =null;
	private PreparedStatement pstmt = null;
	
	public BookingDAO() {
		try{
			 connection = ConnectionJDBC.getConnection();
			 }catch(Exception e){ System.out.println(e.toString());}
	}
	
	public boolean setBooking(String clientid,String Date, int Time, int num){
		final String sql = "insert into clientBooking (clientId,bkDate,bkTime,bkPeopleNum) values(?,?,?,?) ";
		
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, clientid);
			pstmt.setString(2, Date);
			pstmt.setInt(3, Time);
			pstmt.setInt(4, num);
			System.out.println(pstmt);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return false;
		}	
		return true;
	}

	public BookingBean getBooking(String clientid){
		final String sql= "select clientId,bkDate,bkTime,bkPeopleNum from clientBooking where bkId = ?";
		BookingBean bean = null;
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, clientid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new BookingBean();
				bean.setClientId(clientid);
				bean.setBkDate(rs.getString("bkDate"));
				bean.setBkTime(rs.getInt("bkTime"));
				bean.setBkPeopleNum(rs.getInt("bkPeopleNum"));
			}	
		}catch(Exception e){
			System.out.println(e.toString());
			return bean;
		}
		
		return bean;
	}
	
	public void deleteClientBooking(int pkid){
		final String sql = "delete from clientBooking where pkId = ?" ;
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, pkid);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}

}
