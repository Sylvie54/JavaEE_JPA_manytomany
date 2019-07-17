/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleurs;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Classes.Session;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

import javax.persistence.Persistence;

/**
 *
 * @author Acer
 */
public class CtrlPageSession extends HttpServlet implements ICommand{
  // méthode override interface ICommand 
   public String execute(HttpServletRequest request, HttpServletResponse response)   
    { 
        
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("basejpa");
        EntityManager em = emf.createEntityManager();
        String message= "";
        
        try
        {
          
            List listsession = em.createQuery("select c from Session c order by c.id").getResultList();
             request.setAttribute("nombre",listsession.size() );        
             request.setAttribute("listesessions",listsession);  
            
    }
    
        catch (Exception e) {
                    message = "un problème est survenu à la lecture des sessions";
                    e.printStackTrace();
           } 
        
        request.setAttribute("message", message);
       
        // donne la page à afficher
        return ("PageSession.jsp");   
    }
}
