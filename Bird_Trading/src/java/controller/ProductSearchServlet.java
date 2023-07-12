/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProductDAO;
import DTO.ProductDTO;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ProductSearchServlet", urlPatterns = {"/ProductSearchServlet"})
public class ProductSearchServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("searchByName")) {
                String productName = request.getParameter("productName");
                if (productName != null && !productName.isEmpty()) {
                    List<ProductDTO> products = productDAO.searchProductsByName(productName);
                    HttpSession session = request.getSession();
                    session.setAttribute("searchResultsByName", products);
                    response.sendRedirect("searchProducts.jsp");
                    return;
                }
            } else if (action.equals("searchByPriceRange")) {
                String minPriceStr = request.getParameter("minPrice");
                String maxPriceStr = request.getParameter("maxPrice");
                if (minPriceStr != null && !minPriceStr.isEmpty() && maxPriceStr != null && !maxPriceStr.isEmpty()) {
                    BigDecimal minPrice = new BigDecimal(minPriceStr);
                    BigDecimal maxPrice = new BigDecimal(maxPriceStr);
                    List<ProductDTO> products;

                    HttpSession session = request.getSession();
                    if (session.getAttribute("searchResultsByName") != null) {
                        List<ProductDTO> searchResults = (List<ProductDTO>) session.getAttribute("searchResultsByName");
                        products = productDAO.searchProductsByPriceRange(searchResults, minPrice, maxPrice);
                    } else {
                        List<ProductDTO> searchResults = (List<ProductDTO>) session.getAttribute("searchByCategory");
                        products = productDAO.searchProductsByPriceRange(minPrice, maxPrice);
                    }
                    
                    
                    

                    session.setAttribute("searchResultsByPrice", products);
                    session.setAttribute("minPrice", minPrice);
                    session.setAttribute("maxPrice", maxPrice);
                    response.sendRedirect("searchProductsByPrice.jsp");
                    return;
                }
            } else if (action.equals("searchByCategory")) {
                String categoryName = request.getParameter("categoryName");
                if (categoryName != null && !categoryName.isEmpty()) {
                    List<ProductDTO> products = productDAO.searchProductsByCategory(categoryName);
                    HttpSession session = request.getSession();
                    session.setAttribute("searchResultsCategory", products);
//                    request.getRequestDispatcher("searchByCategory.jsp").forward(request, response);
                    response.sendRedirect("searchByCategory.jsp");

                    return;
                }
            }
        }

    }
}
