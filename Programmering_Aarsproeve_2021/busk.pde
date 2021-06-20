class Busk extends Planter { //Her gør jeg brug af nedarvning, hvor at klassen Busk nedarver variablerne fra klassen Planter.
  
   Busk() { //konstruktøren her giver en specifik værdi til datatypen som vi gav til variablen PImage img før.
    img = loadImage("cute bush.png"); 
   }
   
   void display() { //Her overrider funktionen Display() den anden funktion Display() i klassen Planter.
    image(img,x - PlanteWidth/2,y - PlanteWidth/2,PlanteHeight,PlanteWidth);  
   }
}
