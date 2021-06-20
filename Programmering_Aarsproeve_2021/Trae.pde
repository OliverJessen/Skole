class Trae extends Planter { //Her gør jeg brug af nedarvning, hvor at klassen Trae nedarver variablerne fra klassen Planter.
  
  
  Trae() { //konstruktøren her giver en specifik værdi til datatypen som vi gav til variablen PImage img før.
    img = loadImage("Green tree.png");
  }
  
  void display() { //Her overrider funktionen Display() den anden funktion Display() i klassen Planter.
    image(img,x - PlanteWidth/2,y - PlanteHeight/2,PlanteWidth,PlanteHeight);   
  } 

}
