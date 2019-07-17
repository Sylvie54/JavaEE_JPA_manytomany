/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;
import java.util.*;

/**
 *
 * @author Acer
 */

    
import java.util.HashSet;
import java.util.Set;
import java.util.Collections;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "professeur")
public class Professeur implements Comparable{
  //ID
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name = "PROF_ID")     
  private int id = 0;
  //Nom du professeur
  
  @Column(name = "PROF_NOM")   
  private String nom = "";
  //Prénom du professeur
  @Column(name = "PROF_PRENOM")   
  private String prenom = "";
  
  //Liste des matières dispensées
  @OneToMany
  @JoinColumn(name="PROF_ID")
  private List<Matiere> listMatiere = new ArrayList<Matiere>();

  public Professeur(int id, String nom, String prenom) throws Exception {
    this.setId(id);
    this.setNom(nom);
    this.setPrenom(prenom);
     }
   
    public Professeur(String nom, String prenom)throws Exception {
    this.setNom(nom);
    this.setPrenom(prenom);
  }

   public Professeur(String nom)throws Exception {
    this.setNom(nom);
  }

  public Professeur(){}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getNom() {
    return nom;
  }

  public void setNom(String nom) throws Exception {
    if (nom.length() == 0)
        throw new ExceptionClasses("Veuillez saisir un nom ");
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
 
  public List<Matiere> getListMatiere() {
    Collections.sort(listMatiere);  
    return listMatiere;
  }

  public void setListMatiere(List<Matiere> listMatiere) {
   this.listMatiere = listMatiere;
  }

  //Ajoute une matière à un professeur
  public void addMatiere(Matiere matiere){
    this.listMatiere.add(matiere);
  }

  //Retire une matière à un professeur
  public void removeMatiere(Matiere matiere){
    this.listMatiere.remove(matiere);
  }
  
  @Override
   public int compareTo(Object o) {
      if(o.getClass().equals(Professeur.class)){
         //Nous allons trier sur le nom d'artiste
         Professeur professeur  = (Professeur)o;
         return nom.compareTo(professeur.getNom());
      }
      return -1;
   }
}
