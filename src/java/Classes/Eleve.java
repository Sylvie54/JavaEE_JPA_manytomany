/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Acer
 */
@Entity
@Table(name = "eleve")
public class Eleve implements Comparable {
  //ID
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name = "ELEVE_ID")   
  private int id = 0;
  //Nom de l'élève
  
   @Column(name = "ELEVE_NOM") 
  private String nom = "";
  //Prénom de l'élève
   
   @Column(name = "ELEVE_PRENOM") 
  private String prenom = "";
   
   @Id
   @Column(name = "SESSION_ID")   
  private int session_id = 0;
   
  public Eleve(int id, String nom, String prenom)throws Exception {
    setId(id);
    setNom(nom);
    setPrenom(prenom);
 }
  public Eleve(){};
     
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getNom() {
    return nom;
  }

  public void setNom(String nom)throws Exception{
      if (nom.length() == 0)
        throw new ExceptionClasses("Veuillez saisir un nom");
    else
    this.nom = nom;
  }

  public String getPrenom() {
    return prenom;
  }

  public void setPrenom(String prenom) throws Exception {
     if (prenom.length() == 0)
        throw new ExceptionClasses("Veuillez saisir un prénom");
    else 
    this.prenom = prenom;
  } 
public int getSession_id() {
    return session_id;
  }

  public void setSessionId(int Session_id) {
    this.session_id = Session_id;
  } 
  @Override
   public int compareTo(Object o) {
      if(o.getClass().equals(Eleve.class)){
         //Nous allons trier sur le nom d'artiste
         Eleve eleve  = (Eleve)o;
         return nom.compareTo(eleve.getNom());
      }
      return -1;
   }
}
