/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daong
 */
@MultipartConfig
public class MainController extends HttpServlet {

    private static final String HOME = "HomeController";
    private static final String CATEGORY = "CategoryController";
    private static final String ADMIN = "AdminController";
    private static final String REDIRECT_ADMIN = "admin.jsp";
    private static final String LOGOUT = "LogoutController";
    private static final String DETAIL = "DetailController";
    private static final String SHOP = "ShopController";
    private static final String SEARCH = "SearchDeviceController";
    private static final String CREATE = "CreateAccountController";
    private static final String LOGIN = "LoginController";
    private static final String ADD = "ViewAddController";
    private static final String DELETE = "DeleteController";
    private static final String UPDATE = "GetProductByIDController";
    private static final String ERROR = "error.jsp";
    private static final String REDIRECT_LOGIN = "login.jsp";
    private static final String REDIRECT_SHOP = "shop.jsp";
    private static final String REDIRECT_ERROR = "error.jsp";
    private static final String REDIRECT_CHECKOUT = "checkout.jsp";
    private static final String REDIRECT_SIGNUP = "signup.jsp";
    private static final String REDIRECT_SINGLE = "single.jsp";
    private static final String REDIRECT_UPDATE = "update.jsp";
    private static final String REDIRECT_ADD = "add.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action == null) {
                url = HOME;
            } else if ("category".equals(action)) {
                url = CATEGORY;
            } else if ("shop".equals(action)) {
                url = SHOP;
            } else if ("user".equals(action)) {
                url = HOME;
            } else if ("logout".equals(action)) {
                url = LOGOUT;
            } else if ("detail".equals(action)) {
                url = DETAIL;
            } else if ("search".equals(action)) {
                url = SEARCH;
            }  else if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Create".equals(action)) {
                url = CREATE;
            } else if ("add".equals(action)) {
                url = ADD;
            } else if ("admin".equals(action)) {
                url = ADMIN;
            } else if ("delete".equals(action)) {
                url = DELETE;
            }else if ("update".equals(action)) {
                url = UPDATE;
            }else if ("redirectAdmin".equals(action)) {
                url = REDIRECT_ADMIN;
            }else if ("redirectLogin".equals(action)) {
                url = REDIRECT_LOGIN;
            }else if ("redirectShop".equals(action)) {
                url = REDIRECT_SHOP;
            }else if ("redirectError".equals(action)) {
                url = REDIRECT_ERROR;
            }else if ("redirectCheckOut".equals(action)) {
                url = REDIRECT_CHECKOUT;
            }else if ("redirectSignUp".equals(action)) {
                url = REDIRECT_SIGNUP;
            }else if ("redirectSingle".equals(action)) {
                url = REDIRECT_SINGLE;
            }else if ("redirectUpdate".equals(action)) {
                url = REDIRECT_UPDATE;
            }else if ("redirectAdd".equals(action)) {
                url = REDIRECT_ADD;
            }

        } catch (Exception e) {
            log("Error :" + e.getMessage());
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
    }// </editor-fold>

}
