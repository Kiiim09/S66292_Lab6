
package Lab6.com;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Lab6.com.Database;

public class MarathonDAO {
    private Connection connection;
    private int result = 0;
    public MarathonDAO() throws ClassNotFoundException{
        connection = Database.getConnection();
    }
    public int addDetails(Marathon marathon){
        try{
            String mySQL = "INSERT INTO marathon(icno, name, category) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(mySQL);
            
            System.out.println("IC no   = " + marathon.getIcno());
            System.out.println("Name    = " + marathon.getName());
            System.out.println("Category= " + marathon.getCategory());
            
            //Parameters
            preparedStatement.setString(1, marathon.getIcno());
            preparedStatement.setString(2, marathon.getName());
            preparedStatement.setString(3, marathon.getCategory());
            result = preparedStatement.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return result;
    }
}
