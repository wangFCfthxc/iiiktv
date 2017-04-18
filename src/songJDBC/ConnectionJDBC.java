package songJDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionJDBC {
		final static String className = "com.mysql.jdbc.Driver";
	 	final static String URL="jdbc:mysql://localhost/";
	    final static String DATABASE="KtvSong";
	    final static String USER="root";
	    final static String PASS="root";
	    
	public static Connection getConnection(){
        Connection con=null;
        
        try{
            Class.forName(className);
            con=DriverManager.getConnection(URL+DATABASE,USER,PASS);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("找不到驅動程式");
        }
        
        return con;
    }
	
}
