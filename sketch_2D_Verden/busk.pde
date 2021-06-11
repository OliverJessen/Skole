class Busk extends Planter {
  
   Busk() {  
    img = loadImage("cute bush.png"); 
   }
   
   void display() { 
    image(img,x - PlanteWidth/2,y - PlanteWidth/2,PlanteHeight,PlanteWidth);  
   }
}
