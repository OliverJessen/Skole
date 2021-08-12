Verden v;
Dyr d;
Planter p;
Terrain t;

  void setup() {
   v  = new Verden(); //laver et objekt ud af alle klasserne, der indeholder et sæt af variabler med værdier og funktioner.
   d = new Dyr();
   p = new Planter();
   t = new Terrain();
   size(800,700);
   surface.setResizable(true);
  }

  void draw() {
    clear();
    background(80);
    v.opdaterAlt();
  }
  
  void keyPressed() { //hvis man klikker på en af tasterne vil man lave et nyt dyr/planter/terræn.
    
   if(key == '1') { v.lavKat(); }
   if(key == '2') { v.lavKo(); }
   if(key == '3') { v.lavBlomst(); }
   if(key == '4') { v.lavTrae(); }
   if(key == '5') { v.lavBusk(); }
   if(key == '6') { v.lavSvamp(); }
   
 }
