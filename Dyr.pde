class Dyr {
  
  float x;
  float y;
  float Xdirection = random(-2,2);
  float Ydirection = random(-2,2);
  float speed = 1;
  
  Dyr() {
    
     x = random(50,width-50);
     y = random(50, height-50);
    
  }
   
  Dyr(float tempspeed) { //her vises der overload af konstruktører, eftersom at objektet Dyr leder efter en værdi, og finder så den anden objekt Dyr() ovenover.
    
     this(); //refererer til selve klassen
     speed = tempspeed;
    
  }
  
  void display() {
    
    stroke(0);
     ellipse(x,y,64,104);
  }
  
  void move() {
    
     x+= Xdirection*speed;
     y+= Ydirection*speed;
     
   if(x > width-30 || (x <40 && Xdirection < 0)) {
     Xdirection *= -1;
   }
   if(y > height-58 || (y < 50 && Ydirection < 0)) {
     Ydirection *= -1;
   }
  }
}
