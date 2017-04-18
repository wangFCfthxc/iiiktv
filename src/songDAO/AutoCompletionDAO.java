package songDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import songJDBC.ConnectionJDBC;

public class AutoCompletionDAO {
	private Connection connection =null;
	private PreparedStatement pstmt = null;
	private List<String> listSinger;
		public AutoCompletionDAO() {
			try{

				 connection = ConnectionJDBC.getConnection();

				 }catch(Exception e){ System.out.println(e.toString());}
		}
//		尋訪DB所有singerORsongname
		private List<String> getDB(String str){
			listSinger = new ArrayList<>();
			String sql = "select Song_SongName,Song_Singer from ktv group by " + str;
			try {
				pstmt = connection.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
						listSinger.add(rs.getString(str));
					}
			} catch (SQLException e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
			
			return listSinger;
		}
		
//		找到所有匹配的字串最多顯示10筆
		public List<String> getSingerData(String query,String singerORsongname){
			getDB(singerORsongname);
			String Na = null ;
			List<String> matched = new ArrayList<String>();

			for(int i = 0 ; i < listSinger.size() ; i++){
				Na = listSinger.get(i);
				if(Na.startsWith(query)){
					matched.add(Na);
					if(matched.size()==10){
						break;
					}
				}
			}
			return matched;
		}
		
}