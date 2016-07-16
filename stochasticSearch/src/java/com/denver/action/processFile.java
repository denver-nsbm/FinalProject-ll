/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.denver.action;

import com.stochastic_search.model.PreferenceTable;
import com.stochastic_search.model.Utility;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 *
 * @author Chathura Dananjaya Rupasinghe (14208554)
 */



//this method will take the file uploaded via ajax request and 
//map it with the StudentEntry and store it in inmemory to process with algorithm
@WebServlet("/processFile")
@MultipartConfig
public class processFile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            Part filePart = request.getPart("inputStream"); 
            Boolean useDefault = Boolean.parseBoolean(request.getParameter("useDefault"));
            InputStream fileContent = null;
            if (useDefault) {
                fileContent =new FileInputStream(this.getClass().getResource("data.tsv").getPath());
            } else {
                fileContent = filePart.getInputStream();
                
            }
            PreferenceTable pt = new PreferenceTable(fileContent);
            Utility.insCheck.INSTANCE.setTable(pt);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
