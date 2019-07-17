<%-- 
    Document   : SaisieClasse
    Created on : 4 mars 2019, 10:00:51
    Author     : Utilisateur
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="bootstrap.css" />
         <link rel="stylesheet" type="text/css" href="cssIndex.css" /> 
        <title>  saisie Session</title>
    </head>
    <body>
            <%@ include file="Header.html" %>
       
        <main>
        <h3>Saisie Session</h3>
        <p class='jaune'> ${ requestScope.message }  </p>
   
     <form name="SaisieClasse" method="post">
         <input type="hidden" name="cmd" id="cmd" value="page3" />
        Nom de la session : <input type="text"  name="NomSession" value="" size="50" /><br>
        
         <p>Choisissez un prof : 
        <select multiple id="prof" name = "prof"  >
            <c:forEach var="leprof" begin="0" items="${requestScope.listProf}">
                <option value="${ leprof.id }">  ${ leprof.nom }  </option> 
            </c:forEach> 
              
         <input type="submit" value="Envoi" name="BtnSubmit" />
    </form>
        </main>
     <aside></aside> 
     <footer></footer>  
    </body>
    <%@ include file="footer.html" %>
</html>
