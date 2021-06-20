class Blomst extends Planter { //Her gør jeg brug af nedarvning, hvor at klassen Blomst nedarver variablerne fra klassen Planter.
  
   Blomst() { //konstruktøren her giver en specifik værdi til datatypen som vi gav til variablen PImage img før.
    img = loadImage("rose.png"); 
   }
   
   void display() { //Her overrider funktionen Display() den anden funktion Display() i klassen Planter.
    image(img,x - PlanteWidth/2,y - PlanteWidth/2,PlanteHeight,PlanteWidth);   
   }  
}
