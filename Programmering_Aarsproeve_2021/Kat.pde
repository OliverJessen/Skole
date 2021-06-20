class Kat extends Dyr { //Her gør jeg brug af nedarvning, hvor at klassen Kat nedarver variablerne fra klassen Dyr.
  
  Kat() { //konstruktøren her giver en specifik værdi til datatypen som vi gav til variablen PImage img før.
   img = loadImage("black cat.png");  
  }
  
  void display() { //Her overrider funktionen Display() den anden funktion Display() i klassen Dyr.
  image(img, x, y, DyrWidth, DyrHeight); 
  } 
}
  
  
