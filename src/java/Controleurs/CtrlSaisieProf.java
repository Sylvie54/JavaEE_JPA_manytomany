/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleurs;

import Classes.*;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceUnit;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Acer
 */

public class CtrlSaisieProf extends HttpServlet implements ICommand  {
    
     
   
    public String execute(HttpServletRequest request, HttpServletResponse response) 
    { 
        String vue = "SaisieProf.jsp";           
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("basejpa");
        EntityManager em = emf.createEntityManager();
        EntityManager em2 = emf.createEntityManager();
        EntityTransaction utx = em.getTransaction();
       
        //   List listprof = em.createQuery("select p from Professeur p where p.id = 1").getResultList();
        List listMatieres = em2.createQuery("select m from Matiere m ").getResultList();
        request.setAttribute("listeMatieres",listMatieres);  
        
        String message= "";
                 // test si le parametre "NomProf" est dans la liste des paramètres, sinon c'est le premier passage donc on ne fait rien    
        if (request.getParameterMap().containsKey("NomProf")) { 
           
        
            String nomProf  = (String) request.getParameter("NomProf");
            String prenomProf  = (String) request.getParameter("PrenomProf");
            // recup valeur sélectionnée de la combobox 
            
            String matiere = (String) request.getParameter("matiere");
            int numMatiere = Integer.parseInt(matiere);
            
            try
                {
 
                    Professeur leprof = new Professeur(nomProf, prenomProf);
                        
                    //begin a transaction
                    utx.begin();

                    //persist the person entity
                    em.persist(leprof);
                    
                    
                    //commit transaction which will trigger the em to 
                    //commit newly created entity into database
                    utx.commit();
                  
                  //  redirection vers la liste des professeurs 
                  CtrlPageProf ctrlPageProf = new CtrlPageProf();
                  
                  vue = ctrlPageProf.execute(request, response);;
               }
                catch (ExceptionClasses e) {
                    message = e.getMessage();
                    request.setAttribute("ancnom", nomProf);
                    request.setAttribute("ancprenom", prenomProf);
                }  
                catch (Exception e) {
                    message = "un problème est survenu";
                    e.printStackTrace();
                }  
           } 
        
        request.setAttribute("message", message);
       
        // donne la page à afficher
        return (vue);   
    }
}
