class Bullet {

  PVector pos;
  PVector dir;
  PVector vel;

  Bullet() {
    
    float x1 = e.pos.x;
    float y1 = e.pos.y;
    float x2 = mouseX;
    float y2 = mouseY;

    pos = new PVector(x1,y1);
    dir = new PVector(x2-x1, y2-y1);
   
  }


  void show(Player e) {

    ellipse(e.pos.x, e.pos.y, 10, 10);
  }


  void update() {

    pos.add(dir);
 
  }
}
