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
@Table(name = "matiere")
public class Matiere implements Comparable{
  //ID
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 @Column(name = "MAT_ID")   
  private int id;
  //Nom du professeur
  @Column(name = "MAT_NOM")  
  private String nom;
  
  @Column(name = "PROF_ID")  
  private int prof_id;

  public Matiere(int id, String nom, int prof_id) throws Exception  {
    setId(id);
    setNom(nom);
  }

  public Matiere(){}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
  
  public int getProf_id() {
    return prof_id;
  }

  public void setProf_id(int prof_id) {
    this.prof_id = prof_id;
  }
  public String getNom() {
    return nom;
  }

  public void setNom(String nom) throws Exception {
      if (nom.length() == 0)
        throw new ExceptionClasses("Veuillez saisir un nom");
    else
    this.nom = nom;
  } 
@Override
   public int compareTo(Object o) {
      if(o.getClass().equals(Matiere.class)){
         //Nous allons trier sur le nom d'artiste
         Matiere matiere  = (Matiere)o;
         return nom.compareTo(matiere.getNom());
      }
      return -1;
   }  
}