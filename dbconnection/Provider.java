package dbconnection;

public interface Provider 
{
	String DRIVER=  "com.mysql.jdbc.Driver";  
	String CONNECTION_URL= "jdbc:mysql://localhost:3306/detection?allowMultiQueries=true";  
	String USERNAME= "root";  
	String PASSWORD= "";  
	
}
