package songDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ktvBean;
import songJDBC.ConnectionJDBC;

public class PaginationDAO {
	 private Connection connection ;
	 private PreparedStatement pstmt;
	 public PaginationDAO(){
		 try{
		 connection = ConnectionJDBC.getConnection();
		 }catch(Exception e){
			 System.out.println(e.toString());
		 }
	 }
//	 查詢當前Song_Singer總共有幾首歌曲
	public int pageSingerTotal(String searchText){
		String sql = "select count(*) as count from ktv where Song_Singer = ?";
		int total = 0 ;
		try{
		pstmt = connection.prepareStatement(sql);	
		pstmt.setString(1, searchText);
		ResultSet rs = pstmt.executeQuery();
		rs.first();
		total = rs.getInt("count");
		}catch(SQLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}	
		return total;
	}

//	只查詢20首歌曲分頁
	public List<ktvBean> viewSingerPaginationList(String searchText , int offset){
		String sql = "select Cashbox_Id,Song_SongName,Song_Lang,Song_Singer from ktv where Song_Singer = ? limit " +
				offset + ",20";
		List<ktvBean> obj = new ArrayList<>();
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, searchText);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				ktvBean bean = new ktvBean();
				bean.setCashboxId(rs.getInt("Cashbox_Id"));
				bean.setSongLang(rs.getString("Song_Lang"));
				bean.setSongSinger(rs.getString("Song_Singer"));
				bean.setSongSongName(rs.getString("Song_SongName"));
				obj.add(bean);
			}
	}catch(Exception e){
		System.out.println(e.toString());
	}
		return obj ;
	}
//	更改或第一次查詢Song_Singer input text 查詢動作
	public List<ktvBean> viewSingerPaginationFirst(String searchText){
		String sql = "select Cashbox_Id,Song_SongName,Song_Lang,Song_Singer from ktv where Song_Singer = ? limit 0,20";
		List<ktvBean> obj = new ArrayList<>();
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, searchText);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				ktvBean bean = new ktvBean();
				bean.setCashboxId(rs.getInt("Cashbox_Id"));
				bean.setSongLang(rs.getString("Song_Lang"));
				bean.setSongSinger(rs.getString("Song_Singer"));
				bean.setSongSongName(rs.getString("Song_SongName"));
				obj.add(bean);
			}
	}catch(Exception e){
		System.out.println(e.toString());
	}
		return obj ;
	}
//	查詢歌曲目錄Song_SongName
	public List<ktvBean> viewSongNamePaginationFirst(String searchText){
		String sql = "select Cashbox_Id,Song_SongName,Song_Lang,Song_Singer from ktv where Song_SongName = ?";
		List<ktvBean> obj = new ArrayList<>();
		try{
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, searchText);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				ktvBean bean = new ktvBean();
				bean.setCashboxId(rs.getInt("Cashbox_Id"));
				bean.setSongLang(rs.getString("Song_Lang"));
				bean.setSongSinger(rs.getString("Song_Singer"));
				bean.setSongSongName(rs.getString("Song_SongName"));
				obj.add(bean);
			}
	}catch(Exception e){
		System.out.println(e.toString());
	}
		return obj ;
	}

}
