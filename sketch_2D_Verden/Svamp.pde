class Svamp extends Terrain {
  
  Svamp() {   
   img = loadImage("Isspand.png");
  }
  
  void display() { 
    image(img,x - TerrainWidth/2,y - TerrainHeight / 2,TerrainWidth,TerrainHeight);
  }
}
