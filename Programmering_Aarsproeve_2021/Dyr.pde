class Dyr {
  // forskellige variabler og datatyper som bliver brugt at underklasserne og i funktionerne i klassen.
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
  
  void display() { //skal bruges så at underklasserne kan override værdierne i funktionen.
  int  a  =90;
  }
  
  void move() { // fortæller farten af ethvert dyr, og at de skal 'bounce' videre fra væg til væg.
  
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
