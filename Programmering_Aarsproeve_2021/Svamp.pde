class Svamp extends Terrain { //Her gør jeg brug af nedarvning, hvor at klassen Svamp nedarver variablerne fra klassen Terrain.
  
  Svamp() { //konstruktøren her giver en specifik værdi til datatypen som vi gav til variablen PImage img før.
   img = loadImage("Isspand.png");
  }
  
  void display() { //Her overrider funktionen Display() den anden funktion Display() i klassen Dyr.
    image(img,x - TerrainWidth/2,y - TerrainHeight / 2,TerrainWidth,TerrainHeight);
  }
}
