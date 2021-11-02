/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;


import group2.detail.DetailDAO;
import group2.detail.DetailDTO;
import group2.order.OrderDAO;
import group2.order.OrderDTO;
import group2.product.ProductDAO;
import group2.user.UserDAO;
import group2.user.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "MainController?action=redirectCheckOut";
    private static final String SUCCESS = "MainController?action=user";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        boolean check = true;
        ProductDAO productDAO= new ProductDAO();
        OrderDAO orderDAO = new OrderDAO();
        UserDAO userDAO = new UserDAO();
        DetailDAO detailDAO = new DetailDAO();
        HttpSession session = request.getSession();
        ArrayList<DetailDTO> list = (ArrayList<DetailDTO>) session.getAttribute("CART");
        UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        try {
            if (user == null) {
                url = "LogoutController";
            } else {
                String userID1 = user.getUserID();
                String statusUser = userDAO.getStatus(userID1);
                if (statusUser.equals("Active")) {
                    if (list != null) {
                        float total = Float.parseFloat(request.getParameter("total"));
                        String userID = request.getParameter("userID");
                        for (DetailDTO detailDTO1 : list) {
                            int checkQuantity = productDAO.getQuantityByID(detailDTO1.getProduct().getProductID());
                            String status = detailDTO1.getProduct().getStatus();
                            if (detailDTO1.getProduct().getStatus().equals("Active")) {
                                if (detailDTO1.getQuantity() > checkQuantity) {
                                    request.setAttribute("ERR", "The number of " + detailDTO1.getProduct().getProductName()+ " product is not enough");
                                    check = false;
                                }
                            } else {
                                request.setAttribute("ERR",  detailDTO1.getProduct().getProductName() + " book is no longer active");
                                check = false;
                            }
                        }
                        if (check) {
                            if (orderDAO.insertOrder(new OrderDTO(0, userID, new Date(), total)) != -1) {
                                for (DetailDTO detailDTO : list) {
                                    int orderID = orderDAO.getOrderID();
                                    detailDTO.setOrderID(orderID);
                                    if (detailDAO.insertDetail(detailDTO) != -1) {
                                        int CurQuantity = productDAO.getQuantityByID(detailDTO.getProduct().getProductID());
                                        String productID = detailDTO.getProduct().getProductID();
                                        int Quantity = CurQuantity - detailDTO.getQuantity();
                                        boolean result = productDAO.updateQuantity(productID, Quantity);
                                    }
                                }
                                session.setAttribute("CART", null);
                                request.setAttribute("CHECK_OUT", "Buy Successfully!");
                                url = SUCCESS;

                            }
                        }

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
