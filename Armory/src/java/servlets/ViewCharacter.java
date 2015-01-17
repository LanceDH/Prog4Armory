/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import DAL.Attribute;
import DAL.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 11627
 */
public class ViewCharacter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private Map<String, Integer> _attributeMap;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            
            String charName = request.getPathInfo().substring(1);
            DAL.Character c = Services.CharacterServices.GetChactersByName(charName);
            
            if(c.getId() == null){
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Error.jsp");
                dispatcher.forward(request, response);
            }
            
            ArrayList<Attribute> attributeList = Services.MiscServices.getAttributeList();
            
            if(attributeList == null){
                Services.MiscServices.LoadAttributeData();
                attributeList = Services.MiscServices.getAttributeList();
            }
            
            _attributeMap = new HashMap<String, Integer>();
            
            for (Attribute attribute : attributeList) {
                _attributeMap.put(attribute.getName(), 0);
            }
            
            c.setItemByBootsItemId(ProcessItem(c.getItemByBootsItemId()));
            c.setItemByChestItemId(ProcessItem(c.getItemByChestItemId())) ;
            c.setItemByLegsItemId(ProcessItem(c.getItemByLegsItemId()));
            c.setItemByWeaponItemId(ProcessItem(c.getItemByWeaponItemId()));
            
            request.getSession().setAttribute("Attributes", _attributeMap);
            request.getSession().setAttribute("Character", c);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Character.jsp");
            dispatcher.forward(request, response);
        
        //response.sendRedirect("/Armory/Character.jsp");
    }
    
    private DAL.Item ProcessItem(DAL.Item item){
        if (item != null) {
            Item detailedItem = Services.ItemServices.GetItemById(item.getId());
            AddAttributeValue(detailedItem.getAttribute().getName(), detailedItem.getAttribute1value());
            return detailedItem;
        }
        return null;
    }
    
    private void AddAttributeValue(String name, int value){
        for (Map.Entry<String, Integer> attr : _attributeMap.entrySet()) {
            if(name.equals(attr.getKey())){
                int currValue = attr.getValue();
                currValue = currValue + value;
                _attributeMap.put(attr.getKey(), currValue);
                attr.setValue(currValue);
                return;
            }
                
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
