package songDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.ClientRegisterBean;
import songJDBC.ConnectionJDBC;

public class ClientRegisterDAO {
	private Connection connection ;
	private PreparedStatement pstmt;
	
	public ClientRegisterDAO(){
		 try{
		 connection = ConnectionJDBC.getConnection();
		 }catch(Exception e){
			 System.out.println(e.toString());
		 }
	 }
	
	public boolean WhetherRegister(String id){
		 final String sql = "select clientId from clientInfo where clientId = ?";
		
		 try{
			 pstmt = connection.prepareStatement(sql);
			 pstmt.setString(1, id);
			 ResultSet rs = pstmt.executeQuery();
			 if(rs.next()){ return true; }
		 	}catch(Exception e){ System.out.println(e.toString()); }
		 	 
		 return false;
	}
	
	public void DecideRegister(String clientId,String clientName,String clientEmail,String clientBirth,String clientTel){
		final String sql = "insert into clientInfo (clientId,clientName,clientEmail,clientBirth,clientTel) values (?,?,?,?,?)";
		try{
			 pstmt = connection.prepareStatement(sql);
			 pstmt.setString(1, clientId);
			 pstmt.setString(2, clientName);
			 pstmt.setString(3, clientEmail);
			 pstmt.setString(4, clientBirth);
			 pstmt.setString(5, clientTel);
			 pstmt.executeUpdate();
		 	}catch(Exception e){ 
		 		System.out.println(e.toString());
		 		
		 	}
	}
	
	
	public ClientRegisterBean getClientBean(String id){
		ClientRegisterBean bean = new ClientRegisterBean();
		final String sql = "select clientId,clientName,clientEmail,clientBirth,clientTel from clientInfo where clientId = ?";
		
		try{
			 pstmt = connection.prepareStatement(sql);
			 pstmt.setString(1, id);
			 ResultSet rs = pstmt.executeQuery();
			 rs.first();
			 bean.setClientId(rs.getString("clientId"));
			 bean.setClientName(rs.getString("clientName"));
			 bean.setClientEmail(rs.getString("clientEmail"));
			 bean.setClientBirth(rs.getString("clientBirth"));
			 bean.setClientTel(rs.getString("clientTel"));
			 
		 	}catch(Exception e){ System.out.println(e.toString()); }
		 	 
			return bean;
	}
	
	public boolean updataClientPhone(String clientTel,String clientId){
		final String sql = "update clientInfo set clientTel = ? where clientId = ?";
		
		try{
			 pstmt = connection.prepareStatement(sql);
			 pstmt.setString(1, clientTel);
			 pstmt.setString(2, clientId);
			 System.out.println(pstmt);
			 pstmt.executeUpdate();
		 			 
		 }catch(Exception e){ 
		 		System.out.println(e.toString());
		 		return false;
		 		}
		
		return true;
	
	}
	
	
}
