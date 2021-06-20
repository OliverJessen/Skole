class Planter {
  // forskellige variabler og datatyper som bliver brugt at underklasserne og i funktionerne i klassen.
  float x;
  float y;
  float growthSpeed = 1;
  float PlanteHeight = 30;
  float PlanteWidth = 30;
  PImage img;
  
  void display() { //skal bruges så at underklasserne kan override værdierne i funktionen.
  }
  
  void growth() { //fortæller væksten af planterne
  
    PlanteWidth += growthSpeed;
    PlanteHeight += growthSpeed;
    
   if(PlanteWidth >= 100) {
     growthSpeed = 0;
   }
 }
  
  
}
