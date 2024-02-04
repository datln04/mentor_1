/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import DAO.MobileDAO;
import DTO.Mobile;
import Utils.utilities;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ptd
 */
@MultipartConfig
public class ADDMobileServlet extends HttpServlet {

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
        String mobileId = request.getParameter("mobileId");
        String price = request.getParameter("price");
        String mobileName = request.getParameter("mobileName");
        String yearOfProduction = request.getParameter("yearOfProduction");
        String quantity = request.getParameter("quantity");
        String notSale = request.getParameter("notSale");
        boolean NotSale = false;

        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">
        String fileName = filePart.getSubmittedFileName();
//        String filePath = filePart.getSubmittedFileName(); // Retrieves complete file name with path and directories / path: iamge.png
//        Path p = Paths.get(filePath); // Creates a Path object -> Path in application
//        String fileName = p.getFileName().toString(); // Retrieves file name from Path object
        InputStream fileContent = filePart.getInputStream(); // Converts Part data to InputStream
                                                            //)@#-23-i-riwDIAW)Ie03qei0=2o=o32O-2 ( BUFFER )

        HttpSession session = request.getSession();
        MobileDAO dao = new MobileDAO();

        try {

            //check if quantity and yop is positive or not
            boolean isQuantityPositive = utilities.isPositive(quantity);
            boolean isYearOfProductionPositive = utilities.isPositive(yearOfProduction);
            boolean isPriceVaid = utilities.isPositiveNumber(price);

            if (!isQuantityPositive || !isYearOfProductionPositive) {
                request.setAttribute("POSITIVE_NUMBER_ERROR", "quantity or Year of production are negative digits, pls change to positive");
            } else if (!isPriceVaid) {
                request.setAttribute("POSITIVE_PRICE", "price should be positive");
            } else {
                if ("on".equals(notSale)) {
                    NotSale = true;
                }
                Mobile mobile = new Mobile(mobileId, description, Float.parseFloat(price), mobileName, Integer.parseInt(yearOfProduction), Integer.parseInt(quantity), NotSale, fileName);
                boolean result = dao.addMobile(mobile);
                if (result) {

// Define the path to the assets/images directory relative to the server's deployment directory
                    // uploadPath = build directory after deployment
                    String uploadPath = getServletContext().getRealPath("") + "assets" + File.separator + "images";
                    
                    // web directory before deployment
                    String tmp = uploadPath.replace("\\build", ""); //C://mentor/priject/web/assets/images

// Create the directory if it doesn't exist
                    File uploadDir = new File(tmp);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();// OS
                    }
// Create the directory if it doesn't exist
                    File uploadBuildDir = new File(uploadPath);
                    if (!uploadBuildDir.exists()) {
                        uploadBuildDir.mkdirs();
                    }

// Construct the path to save the file
                    String savePath = tmp + File.separator + fileName; //C://mentor/priject/web/assets/images/iphone-15.jng
                    
                    // Construct the path to save the file
                    String saveBuildPath = uploadPath + File.separator + fileName;// C://mentor/priject/build/web/assets/images/iphone-15.jng

                    // C://mentor/priject/web/assets/images/iphone-15.jng
                    try (OutputStream out = new FileOutputStream(new File(savePath))) {
                        //daposjdpisajdp91ue21ieu219re29e2-e21ihe2je21 return -1 -> input stream is a buffer contains many byte ( <= 1MB )
                        byte[] buffer = new byte[1024]; // 1MB 
                        int bytesRead;      //inputstream
                        while ((bytesRead = fileContent.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    } catch (Exception e) {
                        e.printStackTrace(); // Handle the exception appropriately
                    }
                    
                    
                    try (OutputStream out = new FileOutputStream(new File(saveBuildPath))) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = fileContent.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    } catch (Exception e) {
                        e.printStackTrace(); // Handle the exception appropriately
                    }
                    List<Mobile> list = dao.getAllMobile();
                    session.setAttribute("MOBILE_DATA", list);
                }
            }
        } catch (SQLException ex) {
            log("AddMobileServlet + SQLEXCEPTOPN: " + ex.getMessage());
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
