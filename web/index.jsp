<%-- 
    Document   : index
    Created on : 2 mars 2019, 16:47:31
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
        <%@ include file="Header.html" %>
    
        <main>
        <br>    
        <h4>PROJET JAVAEE - DEMO </h4>
        <br>
        <h3>Gestion d'une session de formation</h3>
         <p class='jaune'> ${ requestScope.message }  </p>
           <div class="image"> <img id="classeCours" src="classeCoursHumour.png"  alt="une salle de cours"/>
           </div> 
        </main>
    
  
<aside> 
    <section>  </section>
    <article>
                <section> 
                    <div class="image"> <img id="monimage" src="mer.png" width="259" height="194" alt="mer"/>
                    </div>    
                  <div id="PostIt"></div>  
                </section>
    </article>
</aside>
      <footer>
</footer>
</body>        
       <%@ include file="footer.html" %>
</html>
