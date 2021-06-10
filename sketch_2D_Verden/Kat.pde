class Kat extends Dyr {
  
  
   
  void display() {
   
  PImage cat;
  
  cat = loadImage("cat.png");  
    
  cat.resize(49, 49);
  image(cat, x, y);
    
  } 
    
  void keyPressed() {
   if(key == '1') { 
   cursor(HAND); 
   
   super.display();
   }
  }
}
  
  
