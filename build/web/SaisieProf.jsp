<%-- 
    Document   : SaisieProf
    Created on : 4 mars 2019, 10:00:25
    Author     : Utilisateur
--%>
<%@page import="Classes.Session"%> 

<!DOCTYPE html>
<html>
    <!-- on inclut le contenu HTML de l'entête standard (navbar) de l'application et les métadonnées -->   
    <%@ include file="Header.jsp" %>
    
    <main>
     <h3>saisie prof</h3>
     <p class='jaune'> ${ requestScope.message }  ${ requestScope.nom }  ${ requestScope.prenom }  </p>
     <form name="SaisieProf" method="post">
        <input type="hidden" name="cmd" id="cmd" value="page4" />
        Nom du Professeur : <input type="text" name="NomProf" id="NomProf" value="${ requestScope.ancnom }" size="50" /><br>
        Prénom du Professeur : <input type="text" name="PrenomProf" id="PrenomProf" value="${ requestScope.ancprenom }" size="50" /><br>
        <br>
        <p>Choisissez une session : 
        <select id="sessions" name = "sessions">
            <c:forEach var="session" begin="0" items="${requestScope.listSessions}">
                <option value="${ session.id }">  ${ session.nom }  </option> 
            </c:forEach> 
        </select>
        </p>
        <p>
        <input type="submit" value="Valider" name="BtnSubmit" /> </p>
     </form>
    </main>
    <aside></aside>
    </body>
     <!-- on inclut le contenu HTML du pied de page standard de l'application --> 
    <%@ include file="footer.html" %>
</html>
