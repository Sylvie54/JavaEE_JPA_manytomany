/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controleurs;

import Classes.Session;
import Classes.ExceptionClasses;
import Classes.Professeur;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;


/**
 *
 * @author Acer
 */
public class CtrlSaisieSession extends HttpServlet implements ICommand {
    
    private static String vue = "SaisieSession.jsp";
   
    
    // méthode override interface ICommand 
   public String execute(HttpServletRequest request, HttpServletResponse response) 
    { 
        
        EntityManagerFactory emf;
        emf = Persistence.createEntityManagerFactory("basejpa");
        EntityManager em = emf.createEntityManager();
        EntityTransaction utx = em.getTransaction();
        
         List listProf = em.createQuery("select p from Professeur p ").getResultList();
        request.setAttribute("listProf",listProf);  
        String message = "";
        
        // test si le parametre "NomClasse" est dans la liste des paramètres, sinon c'est le premier passage donc on ne fait rien    
        if (request.getParameterMap().containsKey("NomSession")) { 
            String nomSession  = (String) request.getParameter("NomSession");
         //   String Prof = (String) request.getParameter("prof");
         //   int numProf = Integer.parseInt(Prof);
            try
            {
                    Session laSession = new Session();
                    laSession.setNom(nomSession);
                       String[] Profs = request.getParameterValues("prof");
            for(int i=0;i<Profs.length;i++)
            {
                    Professeur leProfesseur = em.find(Professeur.class, Integer.parseInt(Profs[i]));
                    laSession.addProfesseur(leProfesseur);
            }    
                    
                //    Professeur leProfesseur = em.find(Professeur.class, numProf);
                //    laSession.addProfesseur(leProfesseur);
                    //begin a transaction
                    utx.begin();

                    //persist the person entity
                    em.persist(laSession);

                    //commit transaction which will trigger the em to 
                    //commit newly created entity into database
                    utx.commit();

                    message = "Session crée";
                 
            }
            catch (ExceptionClasses e) {
                    message =  e.getMessage();
            }  
            catch (Exception e) {
                    message =  "un problème est survenu";
                    e.printStackTrace();
            }  
        }            
        // envoie un paramètre en réponse
        
        request.setAttribute("message", message);
       
        // donne la page à afficher
        return (vue);   
    }
    
}
