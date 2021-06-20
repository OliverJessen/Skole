Verden v;
Dyr d;
Planter p;
Terrain t;

  void setup() {
   v  = new Verden();
   d = new Dyr();
   p = new Planter();
   t = new Terrain();
   size(800,700);
   surface.setResizable(true);
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
