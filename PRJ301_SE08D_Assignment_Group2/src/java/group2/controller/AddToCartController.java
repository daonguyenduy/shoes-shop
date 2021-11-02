/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import group2.detail.DetailDTO;
import group2.product.ProductDAO;
import group2.product.ProductDTO;
import group2.user.UserDAO;
import group2.user.UserDTO;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author daong
 */
@MultipartConfig
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String SUCCESS = "MainController";
    private static final String ERROR = "MainController?action=redirectLogin";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductDAO productDAO = new ProductDAO();
        UserDAO userDAO = new UserDAO();
        String productID = request.getParameter("productID");
        int quantity = 1;
        DetailDTO detailDTO = new DetailDTO();
        ArrayList<DetailDTO> list = null;
        boolean flag = true;
        HttpSession session = request.getSession();
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            if (user == null) {
                url = ERROR;
            } else {
                String userID = user.getUserID();
                boolean checkUserID = userDAO.checkUserID(userID);
                if (checkUserID) {
                    ProductDTO product = productDAO.getProductByID(productID);
                    detailDTO = new DetailDTO(0, 0, product.getPrice(), quantity, product);

                    list = (ArrayList<DetailDTO>) session.getAttribute("CART");
                    if (list != null) {
                        for (int i = 0; i < list.size(); i++) {
                            if (list.get(i).getProduct().getProductID().equals(detailDTO.getProduct().getProductID())) {
                                list.get(i).setQuantity(list.get(i).getQuantity() + quantity);
                                flag = false;
                            }
                        }
                    } else if (list == null) {
                        list = new ArrayList<>();
                    }
                    if (flag) {

                        list.add(detailDTO);
                    }
                    request.setAttribute("OUT", "Add successfully!");
                    session.setAttribute("CART", list);
                    url = SUCCESS;

                } else {
                    url = ERROR;
                }
            }
        } catch (Exception e) {
            log("Error:" + e.getMessage());
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
