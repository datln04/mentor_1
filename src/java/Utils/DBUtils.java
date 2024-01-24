package Utils;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ptd
 */
public class DBUtils implements Serializable {

    public static Connection getConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=workshop_1;";
            Connection con = DriverManager.getConnection(url, "sa", "123");
            return con;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
