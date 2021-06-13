class Blomst extends Planter {
  
   Blomst() {  
    img = loadImage("rose.png"); 
   }
   
   void display() {
    image(img,x - PlanteWidth/2,y - PlanteWidth/2,PlanteHeight,PlanteWidth);   
   }  
}
