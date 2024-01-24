/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.MobileDAO;
import DTO.Mobile;
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
@WebServlet(name = "UpdateMobileServlet", urlPatterns = {"/UpdateMobileServlet"})
public class UpdateMobileServlet extends HttpServlet {

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

        String url = "staff.jsp";

        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String notSale = request.getParameter("notSale");
        String mobileId = request.getParameter("mobileId");
        boolean NotSale = false;
        MobileDAO dao = new MobileDAO();
        HttpSession session = request.getSession();

        try {
            //check if quantity and yop is positive or not
            boolean isQuantityPositive = utilities.isPositive(quantity);
            boolean isPriceVaid = utilities.isPositiveNumber(price);

            if (!isQuantityPositive) {
                request.setAttribute("POSITIVE_NUMBER_ERROR", "quantity is negative digits, pls change to positive");
            } else if (!isPriceVaid) {
                request.setAttribute("POSITIVE_PRICE", "price should be positive");
            } else {
                if ("on".equals(notSale)) {
                    NotSale = true;
                }
                Mobile mobile = new Mobile(mobileId, description, Float.parseFloat(price), "", 0, Integer.parseInt(quantity), NotSale, "");
                boolean result = dao.updateMobile(mobile);
                if (result) {
                    List<Mobile> list = dao.getAllMobile();
                    session.setAttribute("MOBILE_DATA", list);
                }

            }

        } catch (SQLException ex) {
            log("UPDATEMOBILESERVLET + SQLEXCEPTION: " + ex.getMessage());
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
