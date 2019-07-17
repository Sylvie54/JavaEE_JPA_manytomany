/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleurs;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Acer
 */
public class CtrlIndex extends HttpServlet implements ICommand {
    
    // méthode override interface ICommand 
   public String execute(HttpServletRequest request, HttpServletResponse response) 
    { 
        // donne la page à afficher
        return ("index.jsp");   
    }
    
}
