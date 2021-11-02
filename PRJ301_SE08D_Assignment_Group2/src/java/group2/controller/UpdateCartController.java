/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;

import group2.detail.DetailDTO;
import group2.product.ProductDAO;
import group2.product.ProductDTO;
import group2.user.UserDAO;
import group2.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author daong
 */
@WebServlet(name = "UpdateCartController", urlPatterns = {"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=redirectCheckOut";
    private static final String ERROR = "MainController?action=redirectCheckOut";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        String err = "";
       ProductDAO productDAO= new ProductDAO();
        UserDAO userDAO = new UserDAO();
        String productID = request.getParameter("productID");
        String quantity = request.getParameter("quantity");

        ArrayList<DetailDTO> list = null;
        boolean flag = true;
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            if (user == null) {
                url = ERROR;
            } else {
                String userID = user.getUserID();
                String statusUser = userDAO.getStatus(userID);
                if (statusUser.equals("Active")) {
                    String regexNumber = "^([0-9]){0,}$";
                    Pattern pattern = Pattern.compile(regexNumber);
                    Matcher matcher = pattern.matcher(quantity);
                     ProductDTO product = productDAO.getProductByID1(productID);

                        if (!matcher.find()) {
                            err = ("Quantity must be number");
                            flag = false;
                        }

                    if (flag) {
                        if (product.getStatus().equals("Active")) {

                            list = (ArrayList<DetailDTO>) session.getAttribute("CART");
                            if (list != null) {
                                for (int i = 0; i < list.size(); i++) {
                                    if (list.get(i).getProduct().getProductID().equals(productID)) {
                                        list.get(i).setQuantity(Integer.parseInt(quantity));
                                    }
                                }
                            }
                            request.setAttribute("OUT", "Update Successfully!");
                            session.setAttribute("CART", list);
                            url = SUCCESS;
                        } else {
                            url = "MainController?action=user";
                            request.setAttribute("OUT", "Product not in stock");
                        }
                    } else {
                        request.setAttribute("ERROR", err);
                        url = ERROR;
                    }

                } else {
                    url = "LogoutController";
                }
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
    }// </editor-fold>

}
