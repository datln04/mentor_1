/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Mobile;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ptd
 */
public class MobileDAO {

    //step 1
    Connection con = null;
    //step 2 
    PreparedStatement pst = null;
    //step 3
    ResultSet rs = null;

    public List<Mobile> getAllMobile() throws SQLException {
        List<Mobile> list = new ArrayList<>();
        //step 1: create connection
        try {
            con = DBUtils.getConnection();
            String sql = "select mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Mobile where notSale = 0";
            //step2: create request to db
            pst = con.prepareStatement(sql);
            //step3: create result set 
            rs = pst.executeQuery();

            while (rs.next()) {
                String mobileId = rs.getString("mobileId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String mobileName = rs.getString("mobileName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image));
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
        return list;
    }

    public List<Mobile> searchMobileByIdOrName(String searchValue) throws SQLException {
        List<Mobile> list = new ArrayList<>();
        try {
            //crate connection
            con = DBUtils.getConnection();
            String sql = "select mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Mobile\n"
                    + "where mobileName like ? or mobileId like ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + searchValue + "%");
            pst.setString(2, "%" + searchValue + "%");
            rs = pst.executeQuery();

            while (rs.next()) {
                String mobileId = rs.getString("mobileId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String mobileName = rs.getString("mobileName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image));
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
        return list;
    }

    public boolean addMobile(Mobile mobile) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "insert into tbl_Mobile(description,image,mobileId,mobileName,notSale,price,quantity,yearOfProduction)\n"
                    + "values(?,?,?,?,?,?,?,?)";

            pst = con.prepareStatement(sql);
            pst.setString(1, mobile.getDescription());
            pst.setString(2, mobile.getImage());
            pst.setString(3, mobile.getMobileId());
            pst.setString(4, mobile.getMobileName());
            pst.setBoolean(5, mobile.isNotSale());
            pst.setFloat(6, mobile.getPrice());
            pst.setInt(7, mobile.getQuantity());
            pst.setInt(8, mobile.getYearOfProduction());

            int rs = pst.executeUpdate();
            if (rs > 0) {
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean deleteMobile(String mobileId) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "delete from tbl_Mobile\n"
                    + "where mobileId = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, mobileId);
            int rs = pst.executeUpdate();
            if (rs > 0) {
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean updateMobile(Mobile mobile) throws SQLException {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            String sql = "update tbl_Mobile\n"
                    + "set description = ?, price = ?, quantity = ?, notSale = ?\n"
                    + "where mobileId = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, mobile.getDescription());
            pst.setFloat(2, mobile.getPrice());
            pst.setInt(3, mobile.getQuantity());
            pst.setBoolean(4, mobile.isNotSale());
            pst.setString(5, mobile.getMobileId());
                        
            int rs = pst.executeUpdate();
            if(rs > 0){
                result = true;
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public List<Mobile> searchMobileByRange(float minPrice, float maxPrice) throws SQLException {
      
        List<Mobile> list = new ArrayList<>();
        try {
            //crate connection
            con = DBUtils.getConnection();
            String sql = "select mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image\n"
                    + "from tbl_Mobile\n"
                    + "where price >= ? and price <= ?";
            pst = con.prepareStatement(sql);
            pst.setFloat(1, minPrice);
            pst.setFloat(2, maxPrice);
            rs = pst.executeQuery();

            while (rs.next()) {
                String mobileId = rs.getString("mobileId");
                String description = rs.getString("description");
                float price = rs.getFloat("price");
                String mobileName = rs.getString("mobileName");
                int yearOfProduction = rs.getInt("yearOfProduction");
                int quantity = rs.getInt("quantity");
                boolean notSale = rs.getBoolean("notSale");
                String image = rs.getString("image");

                list.add(new Mobile(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image));
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
        return list;
    
    }
}
