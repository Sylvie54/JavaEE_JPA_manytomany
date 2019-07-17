<%-- 
    Document   : SaisieProf
    Created on : 4 mars 2019, 10:00:25
    Author     : Utilisateur
--%>
<%@page import="Classes.Session"%> 
<%@page import="Classes.Matiere"%> 
<!DOCTYPE html>
<html>
    <!-- on inclut le contenu HTML de l'ent�te standard (navbar) de l'application et les m�tadonn�es -->   
    <%@ include file="Header.jsp" %>
    
    <main>
     <h3>saisie prof</h3>
     <p class='jaune'> ${ requestScope.message }  ${ requestScope.nom }  ${ requestScope.prenom }  </p>
     <form name="SaisieProf" method="post">
        <input type="hidden" name="cmd" id="cmd" value="page4" />
        Nom du Professeur : <input type="text" name="NomProf" id="NomProf" value="${ requestScope.ancnom }" size="50" /><br>
        Pr�nom du Professeur : <input type="text" name="PrenomProf" id="PrenomProf" value="${ requestScope.ancprenom }" size="50" /><br>
        <br>
        <p>Choisissez une mati�re : 
        <select id="matiere" name = "matiere">
            <c:forEach var="matiere" begin="0" items="${requestScope.listeMatieres}">
                <option value="${ matiere.id }">  ${ matiere.nom }  </option> 
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
