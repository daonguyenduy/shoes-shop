/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;

import group2.user.CreateUserErrorDTO;
import group2.user.UserDAO;
import group2.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daong
 */
@WebServlet(name = "CreateAccountController", urlPatterns = {"/CreateAccountController"})
public class CreateAccountController extends HttpServlet {

    private static final String ERROR = "MainController?action=redirectSignUp";
    private static final String SUCCESS = "MainController?action=redirectLogin";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userId = request.getParameter("txtUserName");
            String fullName = request.getParameter("txtFullname");
            String password = request.getParameter("txtPassWord");
            String confirm = request.getParameter("txtConfirmpass");
            String phone = request.getParameter("txtPhone");
            boolean check = true;
            CreateUserErrorDTO err = new CreateUserErrorDTO();
            UserDAO userDAO = new UserDAO();
            if (userDAO.checkUserID(userId)) {
                err.setUserIDError("UserID with this mail already existed !");
                check = false;
            } else {
                if (userId.isEmpty()) {
                    err.setUserIDError("UserID not empty");
                    check = false;
                }
            }
            if (fullName.isEmpty()) {
                err.setFullNameError("Fullname not empty");
                check = false;
            }
            if (password.isEmpty()) {
                err.setPasswordError("Pasword not empty");
                check = false;
            }
            if (password.length() < 6 || password.length() > 11) {
                err.setPasswordError("Password length from 6 to 11");
                check = false;
            }
            if (!confirm.equals(password)) {
                err.setConfirmError("Confirm not match password");
                check = false;
            }

            String regexPhone = "(03|09|08)+([0-9]{8})\\b";
            Pattern pattern = Pattern.compile(regexPhone);
            Matcher matcher = pattern.matcher(phone);
            if (!matcher.find()) {
                err.setPhoneError("Phease input phone number valid format [0356449764] Length[10] ");
                check = false;
            }
            if (check) {
                UserDTO user = new UserDTO(userId, fullName, password, "1", phone, "Active");
                userDAO.createUser(user);
                request.setAttribute("SUCCESS", "Register successully");
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR_CREATE", err);
                UserDTO user = new UserDTO(userId, fullName, phone);
                request.setAttribute("USER", user);
            }
        } catch (Exception e) {
            log("Error: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
