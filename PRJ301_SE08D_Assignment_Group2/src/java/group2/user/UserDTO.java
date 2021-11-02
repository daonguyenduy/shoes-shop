/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.user;

/**
 *
 * @author daong
 */
public class UserDTO {
    private String userID;
    private String fullname;
    private String password;
    private String role;
    private String phone;
    private String status;

    public UserDTO(String userID, String fullname, String password, String role) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.role = role;
    }

    public UserDTO(String userID, String fullname, String phone) {
        this.userID = userID;
        this.fullname = fullname;
        this.phone = phone;
    }

    public UserDTO(String userID, String fullname, String password, String role, String phone, String status) {
        this.userID = userID;
        this.fullname = fullname;
        this.password = password;
        this.role = role;
        this.phone = phone;
        this.status = status;
    }
    

    public UserDTO() {
    }
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    

}
