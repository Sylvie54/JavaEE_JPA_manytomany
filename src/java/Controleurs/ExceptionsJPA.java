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
public class ExceptionsJPA extends RuntimeException {
   
    public ExceptionsJPA(String message) {
           super( message );
    }
}
