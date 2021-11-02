/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.user;

import group2.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author daong
 */
public class UserDAO {

    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public UserDTO checkLogin(String userID, String password) throws SQLException, Exception {
        UserDTO result = null;

        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "SELECT userID, password, fullName, role,status,phone "
                        + "FROM [Users] "
                        + "WHERE userID = ? and password = ? ";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("fullName");
                    String role = rs.getString("role");
                    String status = rs.getString("status");
                    String phone = rs.getString("phone");
                    result = new UserDTO(userID, name, password, role, phone, status);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return result;
    }

    public boolean createUser(UserDTO user) throws Exception {

        boolean check = false;
        try {
            con = DBHelper.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [Users] (userID,password,fullName,role,status,phone) VALUES(?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, user.getUserID());
                ps.setString(3, user.getFullname());
                ps.setString(2, user.getPassword());
                ps.setString(4, user.getRole());
                ps.setString(5, user.getStatus());
                ps.setString(6, user.getPhone());

                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public boolean checkUserID(String userID) throws Exception {
        boolean check = false;
        String sql = "select fullName from Users where userID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

    public String getStatus(String userID) throws Exception {
        String check = "";
        String sql = "select status from Users where userID=?";
        try {
            con = DBHelper.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                check = rs.getString("status");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBHelper.closeConnection(rs, ps, con);
        }
        return check;
    }

}
