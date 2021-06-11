class Trae extends Planter {
  
  Trae() { 
    img = loadImage("Green tree.png");
  }
  
  void display() {  
    image(img,x - PlanteWidth/2,y - PlanteHeight/2,PlanteWidth,PlanteHeight);   
  } 
}
