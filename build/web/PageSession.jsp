<%-- 
    Document   : PageClasse
    Created on : 4 mars 2019, 09:59:21
    Author     : Utilisateur
--%>
<%@page import="Classes.Session"%> 

<!DOCTYPE html>
<html>
    <head>
        
        <title> Page liste des Sessions</title>
    </head>
    <body>
        <!-- on inclut le contenu HTML de l'entête standard (navbar) de l'application et les métadonnées -->    
        <%@ include file="Header.jsp" %>
         
        <main>
        <h3>Liste des Sessions et leurs professeurs</h3>
        
        <p class='jaune'> ${ requestScope.message }  </p>
        <!-- si il n'y a pas de message d'erreur, on affiche le nombre de professeurs -->    
        <c:if test="${empty requestScope.message}" >
            <p>nombre de sessions : ${ requestScope.nombre }  <br>
        </c:if>     
        <!-- lecture de la liste des objets sessions et affichage des attributs de ces objets -->        
            <c:forEach var="session" begin="0" items="${requestScope.listesessions}">  
                <br>    Session  ${ session.id } : ${ session.nom } <br>
                <c:if test="${!empty session.getListEleve()}" >
                    Les élèves :   
                    <c:forEach var="eleve" begin="0" items="${session.getListEleve()}">
                        ${eleve.id} : ${eleve.nom}  ${eleve.prenom}  &nbsp;&nbsp;
                    </c:forEach> 
                    <br>    
                </c:if>     
                
                <c:if test="${!empty session.getListProfesseur()}" >
                    Les professeurs : 
                    <c:forEach var="prof" begin="0" items="${session.getListProfesseur()}">
                        ${prof.id} : ${prof.nom}  ${prof.prenom} &nbsp;&nbsp; 
                    </c:forEach>
                    <br>    
                </c:if>    
            </c:forEach>   
         
       
        </main>
        <aside>
            <div class="image"> <img id="monimage" src="./images/sallecours.jpg"  alt="salle de cours"/>
            </div>
        </aside>
          
    </body>
      <%@ include file="footer.html" %>
</html>
