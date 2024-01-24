/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.CartDAO;
import DAO.MobileDAO;
import DAO.UserDAO;
import DTO.Cart;
import DTO.Mobile;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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

        String url = "login.jsp";
        String userId = request.getParameter("txtUserId");
        String password = request.getParameter("txtPassword");

        UserDAO dao = new UserDAO();
        MobileDAO mobileDAO = new MobileDAO();
        CartDAO cartDAO = new CartDAO();
        HttpSession session = request.getSession();
        try {
            boolean isValidPassword = utilities.isNumber(password);
            //check if password is digits
            if (isValidPassword) {
                //check login
                User account = dao.checkLogin(userId, Integer.parseInt(password));
                if (account != null) {
                    switch (account.getRole()) {
                        case 0:
                            List<Cart> listCart = cartDAO.getCarts(account.getUserId());
                            session.setAttribute("CARTS", listCart);
                            List<Mobile> listMobile = mobileDAO.getAllMobile();
                            session.setAttribute("MOBILE_DATA", listMobile);
                            session.setAttribute("ACCOUNT", account);
                            url = "home.jsp";
                            break;
                        case 1:
                            url = "manager.jsp";
                            break;
                        case 2:
                            List<Mobile> list = mobileDAO.getAllMobile();
                            session.setAttribute("MOBILE_DATA", list);
                            session.setAttribute("ACCOUNT", account);
                            url = "staff.jsp";
                            break;
                        default:
                            url = "home.jsp";
                            break;
                    }
                } else {
                    request.setAttribute("invalid_credential", "login failed with user: " + userId);
                }
            } else {
                //if not send warning password err
                request.setAttribute("invalid_password", "password must contain only digits");
            }

        } catch (SQLException ex) {
            System.out.println("LoginServlet + SQLException: " + ex.getMessage());
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
