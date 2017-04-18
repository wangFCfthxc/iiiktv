package songDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ktvBean;
import songJDBC.ConnectionJDBC;

public class SelectKtvDAO {
	private Connection connection ;
	private PreparedStatement pstmt;
	ktvBean bean = null;
	public SelectKtvDAO(){
		 try{
		 connection = ConnectionJDBC.getConnection();
		 }catch(Exception e){
			 System.out.println(e.toString());
		 }
	 }
	
	//從ktv找出歌曲
	public ktvBean getKTVBean(int cashboxId){
		final String sql ="select Cashbox_Id,Song_Lang,Song_SongName,Song_Singer from ktv where Cashbox_Id = ?";
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, cashboxId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				bean = new ktvBean();
				bean.setCashboxId(rs.getInt("Cashbox_Id"));
				bean.setSongLang(rs.getString("Song_Lang"));
				bean.setSongSongName(rs.getString("Song_SongName"));
				bean.setSongSinger(rs.getString("Song_Singer"));
		}		
		}catch(Exception e){
			System.out.println(e.toString());
			return bean;
		}		
		return bean;
	}
	
	//將歌曲單獨加入到clientSonglist裡面 
	public boolean setInClientSong(String clientId){
		final String sql ="insert into clientSonglist (Client_Id,Cashbox_Id,Song_Lang,Song_SongName,Song_Singer) values(?,?,?,?,?)";
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, clientId);
			pstmt.setInt(2, bean.getCashboxId());
			pstmt.setString(3, bean.getSongLang());
			pstmt.setString(4, bean.getSongSongName());
			pstmt.setString(5, bean.getSongSinger());
			pstmt.executeUpdate();		
		}catch(Exception e){
			System.out.println(e.toString());
			return false;
		}		
		return true;		
	}
	
	//刪除clientSonglist裡clientId的所有歌曲
	public boolean deleteClientSong(String clientId){
		final String sql ="delete from clientSonglist where Client_Id = ?";
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, clientId);
			pstmt.executeUpdate();		
		}catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}
}
