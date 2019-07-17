// change l'image et modifie la couleur et la taille du footer

var image = document.getElementById('monimage');

image.addEventListener("mouseover",modifimg , false);

function modifimg()
{
    var monImage = document.querySelector("#monimage"); 
    monImage.src = "./images/montagne.png" ;  // modifie sur la source de l’image 
    monImage.alt = "montagne";
    var lefooter = document.querySelector("footer");
    lefooter.style.backgroundColor = '#D8BFD8';
    lefooter.style.height = '100px';
  
}
