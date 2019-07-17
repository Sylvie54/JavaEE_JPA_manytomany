/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleurs;



/**
 *
 * @author Utilisateur
 */

import Classes.ExceptionClasses;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Classes.Professeur;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Acer
 */
public class CtrlPageProf extends HttpServlet implements ICommand  {
  // méthode override interface ICommand 
   public String execute(HttpServletRequest request, HttpServletResponse response)
    { 
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("basejpa");
        EntityManager em = emf.createEntityManager();
      
        String message= "";
        try
        {
      
         //     List listprof = em.createQuery("select p from Professeur p where p.id = 1").getResultList();
            
             List listprof = em.createQuery("select p from Professeur p order by p.id ").getResultList();
         if (listprof.size() == 0)
             {
                throw new ExceptionsJPA("Prof non trouvé");
             }
         else
             {  
             request.setAttribute("nombre",listprof.size() );        
             request.setAttribute("listeprofs",listprof);  
             }
             
       }
        catch (ExceptionsJPA e) {
            message = e.getMessage();
        } 
         catch (Exception e) {
            message = "un problème est survenu";
            e.printStackTrace();
        } 
        
       request.setAttribute("message", message);
       return ("PageProfesseur.jsp");   
    }
}
