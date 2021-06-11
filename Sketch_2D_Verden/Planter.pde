class Planter {
  
  float x;
  float y;
  float growthSpeed = 1;
  float PlanteHeight = 30;
  float PlanteWidth = 30;
  PImage img;
  
  void display() {
  }
  
  void growth() {
  
    PlanteWidth = PlanteWidth + growthSpeed;
    PlanteHeight = PlanteHeight + growthSpeed;
    
     if(PlanteWidth >= 100 && PlanteHeight >= 100) {
       growthSpeed = 0;
   }
 }
  
  
}
