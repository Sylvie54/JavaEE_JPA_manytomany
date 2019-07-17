<%-- 
    Document   : ClasseProfesseur
    Created on : 4 mars 2019, 09:59:54
    Author     : Utilisateur
--%>

<%@page import="Classes.Professeur"%> 

<!DOCTYPE html>
<html>
    <head>
       <title> Page liste des Professeurs</title>
    </head>
    <body>
<!-- on inclut le contenu HTML de l'entête standard (navbar) de l'application et les métadonnées -->             
        <%@ include file="Header.html" %>
        <main>
        <h3>Liste des Professeurs</h3>
        <p class='jaune'> ${ requestScope.message }  </p>
<!-- si il n'y a pas de message d'erreur, on affiche le nombre de professeurs -->              
        <c:if test="${empty requestScope.message}" >
            <p>nombre de prof : ${ requestScope.nombre }  </p>
        </c:if>
<!-- lecture de la liste des objets professeurs et affichage des attributs de ces objets -->              
        <c:forEach var="prof" begin="0" items="${requestScope.listeprofs}">
            ${prof.id} : ${prof.nom} ${prof.prenom} 
            <br>
<!-- pour chaque professeur, lecture de la liste des objets matiere remontés avec l'objet professeur (attribut collection) -->
<!-- et affichage des attributs des objets -->                  
            <c:forEach var="matiere" begin="0" items="${prof.getListMatiere()}">
                &nbsp;&nbsp; ${matiere.id} : ${matiere.nom} <br>
            </c:forEach> 
            <br>
        </c:forEach> 
        <br> 
        </main>
        <aside>
            <div class="image"> <img id="monimage" src="professeur.jpg"  alt="salle de cours"/>
            </div>
        </aside>
    </body>
    <!-- on inclut le contenu HTML du pied de page standard de l'application --> 
    <%@ include file="footer.html" %>
</html>
