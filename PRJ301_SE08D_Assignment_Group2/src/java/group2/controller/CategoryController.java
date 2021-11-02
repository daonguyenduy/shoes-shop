/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package group2.controller;

import group2.category.CategoryDAO;
import group2.category.CategoryDTO;
import group2.product.ProductDAO;
import group2.product.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author daong
 */
@WebServlet(name = "CategoryController", urlPatterns = {"/CategoryController"})
public class CategoryController extends HttpServlet {

    private static final String SUCCESS = "MainController?action=redirectShop";
    private static final String ERROR = "MainController?action=redirectError";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        String cateID = request.getParameter("categoryID");
        String indexPage=request.getParameter("index");
        if(indexPage==null){
                indexPage = "1";
            }
        int index = Integer.parseInt(indexPage);
        try {
            List<ProductDTO> listProduct = productDAO.getProductByCateID(cateID);
            int count = listProduct.size();
        int endPage=count/9;
        if(count%9!=0){
            endPage++;
        }
            if (listProduct != null) {
                List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                List<ProductDTO> list = productDAO.pagingProduct(index,cateID);
                request.setAttribute("LIST_CATEGORY", listCategory);
                request.setAttribute("LIST_PRODUCT", list);
                request.setAttribute("endP", endPage);
                request.setAttribute("CATEGORYID", cateID);
                url = SUCCESS;
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
