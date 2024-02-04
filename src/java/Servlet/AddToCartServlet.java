/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CartDAO;
import DTO.Cart;
import DTO.User;
import Utils.utilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ptd
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = "home.jsp";
        String mobileId = request.getParameter("mobileId");
        String quantity = request.getParameter("quantity").isEmpty() ? "1" : request.getParameter("quantity");;

        HttpSession session = request.getSession();
        CartDAO cartDAO = new CartDAO();
        User user = (User) session.getAttribute("ACCOUNT");

        try {
            // check quantity is positve and > 0
            //check if quantity and yop is positive or not
            boolean isQuantityPositive = utilities.isPositive(quantity);
            if (!isQuantityPositive) {
                request.setAttribute("POSITIVE_QUANTITY_ERROR", "quantity is negative digits, pls change to positive");
            } else {
                Cart existCart = cartDAO.getCart(user.getUserId(), mobileId);
                if (existCart == null) {
                    Cart cart = new Cart(0, user.getUserId(), mobileId, Integer.parseInt(quantity));
                    // insert a new cart
                    boolean result = cartDAO.insertCart(cart);
                    if (result) {
                        List<Cart> list = cartDAO.getCarts(user.getUserId());
                        session.setAttribute("CARTS", list);
                    }
                } else {//30 + 1
                    existCart.setQuantity(existCart.getQuantity() + Integer.parseInt(quantity));
                    // quantity = 31
                    // set to db again
                    boolean result = cartDAO.setCartQuantity(existCart);
                    if (result) {
                        List<Cart> list = cartDAO.getCarts(user.getUserId());
                        session.setAttribute("CARTS", list);
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
