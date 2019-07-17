<%-- 
    Document   : SaisieClasse
    Created on : 4 mars 2019, 10:00:51
    Author     : Utilisateur
--%>

<!DOCTYPE html>
<html>
    <head>
        <title>  saisie d'une session</title>
    </head>
    <body>
      <!-- on inclut le contenu HTML de l'entête standard (navbar) de l'application et les métadonnées -->   
      <%@ include file="Header.html" %>
       
      <main>
        <h3>Saisie d'une session</h3>
        <p class='jaune'> ${ requestScope.message }  </p>
   
        <form name="SaisieClasse" method="post">
            <input type="hidden" name="cmd" id="cmd" value="page3" />
            Nom de la session : <input type="text"  name="NomSession" value="" size="50" /><br>
            <p>Choisissez les professeurs (Ctrl + Click gauche pour choix multiple) : <br>
            &nbsp;&nbsp;<select multiple id="prof" size ="3" name = "prof"  >
                <c:forEach var="leprof" begin="0" items="${requestScope.listProf}">
                    <option value="${ leprof.id }">  ${ leprof.nom }  </option> 
                </c:forEach>
            </select>        
                <br><br>     
            <input type="submit" value="Envoi" name="BtnSubmit" />
        </form>
      </main>
      <aside></aside> 
    </body>
     <!-- on inclut le contenu HTML du pied de page standard de l'application --> 
    <%@ include file="footer.html" %>
</html>
