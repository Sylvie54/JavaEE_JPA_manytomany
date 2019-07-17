/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Classes;

/**
 *
 * @author Acer
 */
import java.util.*;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

//CTRL + SHIFT + O pour générer les imports
@Entity
@Table(name = "session")
public class Session implements Comparable {
  //ID
  @Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name = "SESSION_ID")     
  private int id = 0;
  //Nom du professeur
  @Column(name = "SESSION_NOM")     
  private String nom = "";
  //Liste des professeurs
  @ManyToMany(cascade = {
	CascadeType.PERSIST,
	CascadeType.MERGE
  })
  @JoinTable(name = "enseignants",
		  joinColumns = @JoinColumn (name = "SESSION_ID"),
		  inverseJoinColumns = @JoinColumn(name = "PROF_ID")
  )
  private List<Professeur> listProfesseur = new ArrayList<Professeur>();
  //Liste des élèves
  @OneToMany
  @JoinColumn(name="SESSION_ID")
  private List<Eleve> listEleve = new ArrayList<Eleve>();

  public Session(int id, String nom)throws Exception {
    this.setId(id);
    this.setNom(nom);
  }
  public Session(){}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getNom() {
    return nom;
  }

  public void setNom(String nom)throws Exception {
    if (nom.length() == 0)
        throw new ExceptionClasses("Veuillez saisir le nom de la session");
    else
    this.nom = nom;
  }

  public List<Professeur> getListProfesseur() {
   // tri ascendant    
   Collections.sort(listProfesseur); 
  // tri descendant
 // Comparator c = Collections.reverseOrder();
 // Collections.sort(listProfesseur,c);
  return listProfesseur;
  }

  public void setListProfesseur(List<Professeur> listProfesseur) {
    this.listProfesseur = listProfesseur;
  }

  public void addProfesseur(Professeur prof) {
    if(!listProfesseur.contains(prof))
      listProfesseur.add(prof);
  }

  public void removeProfesseur(Professeur prof ) {
    this.listProfesseur.remove(prof);
  }

  public List<Eleve> getListEleve() {
      Collections.sort(listEleve);
    return listEleve;
  }

  public void setListEleve(List<Eleve> listEleve) {
    this.listEleve = listEleve;
  }

  //Ajoute un élève à la classe
  public void addEleve(Eleve eleve){
    if(!this.listEleve.contains(eleve))
      this.listEleve.add(eleve);
  }

  //Retire un élève de la classe
  public void removeEleve(Eleve eleve){
    this.listEleve.remove(eleve);
  }

  public boolean equals(Session cls){
    return this.getId() == cls.getId();
  }
  @Override
   public int compareTo(Object o) {
      if(o.getClass().equals(Session.class)){
         //Nous allons trier sur le nom d'artiste
         Session session  = (Session)o;
         return this.nom.compareTo(session.getNom());
      }
      return -1;
   }
}
