package app_laundry;
import java.sql.*;
import javax.swing.*;

/**
 * 
 * author Muhammad Irfan BP 23133048
 */
public class Koneksi {
    private static Connection connection;

    public static Connection getConnection(){
        JFrame frame = new JFrame();
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            connection = DriverManager.getConnection("jdbc:mysql://localhost/db_uas_laundry_muhammadirfan","root","");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(frame,"Koneksi Error!","FATAL",JOptionPane.ERROR_MESSAGE);
        }
        return connection;
    }
}

