class Dyr {

  float x;
  float y;
  float variable = -1;
  float speedX = random(-5,5);
  float speedY = random(-5,5);
  float DyrHeight = 50;
  float DyrWidth = 50;
  PImage img;
  float ySpeedOrg = random(-5,5);
  float xSpeedOrg = random(-5,5);
  
  void display() {
  }
  
  void move() {
    
   
    
    x += speedX;
    y += speedY;   
   
    if (x > width - 45 || x < 5){
       xSpeedOrg *= -1;
    }
    if (y > height - 45 || y < 5){
      ySpeedOrg  *= -1;
    }
     
     speedX = xSpeedOrg;
     speedY = ySpeedOrg;
  }
}
