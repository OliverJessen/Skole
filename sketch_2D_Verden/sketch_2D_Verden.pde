Verden v = new Verden();
Dyr d = new Dyr();
Planter p = new Planter();
Terrain t = new Terrain();

  void setup() {
   size(800, 700);
  }

  void draw() {
    clear();
    background(80);
   
    v.opdaterTerrain();
    v.opdaterPlanter();
    v.opdaterDyr();
    v.collision();
    v.mousePressed();
    v.overview();
  }
  
  void keyPressed() {
    
   if(key == '1') {  
   v.lavKat();
   }
   
   if(key == '2') {
   v.lavKo(); 
   }
   
   if(key == '3') {
   v.lavBlomst();
   }
   
   if(key == '4') {
   v.lavTrae();  
   }
   
   if(key == '5') {
   v.lavBusk();  
   }
   
   if(key == '6') {
   v.lavSvamp(); 
   }
 }
