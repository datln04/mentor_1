/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.User;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ptd
 */
public class UserDAO {

    //step 1
    Connection con = null;
    //step 2 
    PreparedStatement pst = null;
    //step 3
    ResultSet rs = null;

    // login with staff and user
    public User checkLogin(String userId, int password) throws SQLException {
        try {
            //step 1: create connection
            con = DBUtils.getConnection();
            //step 2: define sql query
            String sql = "select userId, password, fullName, role\n"
                    + "from tbl_User\n"
                    + "where userId = ? and password = ?";

            //step 3: create request to DB
            pst = con.prepareStatement(sql);
            // pass parameter to sql query
            pst.setString(1, userId);
            pst.setInt(2, password);
            //step4: create a set of result 
            rs = pst.executeQuery();

            //step5: check if set of result is valid then get it
            if (rs.next()) {
                String userID = rs.getString("userId");
                int pw = rs.getInt("password");
                String fullName = rs.getString("fullName");
                int role = rs.getInt("role");

                return new User(userID, pw, fullName, role);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return null;
    }

}
