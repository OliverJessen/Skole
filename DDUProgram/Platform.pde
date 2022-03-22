class Platform {

  Player e = new Player();

  float len = 100;
  PVector pos;
  PVector vel;

  Platform() {
    float x = random(10, 390);
    float y = 500;
    pos = new PVector(x, y);
    vel = new PVector(0, -3);
  }


  void show() {

    stroke(255);
    strokeWeight(4);

    line(pos.x, pos.y, pos.x + len, pos.y);

    textAlign(CENTER);
  }

  void update() {


    pos.add(vel);
  }

  void interact(Player e) {

    //line(e.pos.x, e.pos.y, pos.x + len/2, pos.y);

    float d = dist(e.pos.x, e.pos.y, pos.x + len/2, pos.y - e.r);
    text(d, pos.x + len/2, pos.y - 20);
    
    if(d < 200)
      line(e.pos.x, e.pos.y, pos.x + len/2, pos.y);

    if ( e.pos.x > pos.x - e.r && e.pos.x < pos.x + len + e.r) {
      if (e.pos.y < pos.y && e.pos.y > pos.y - e.r) {

        e.vel = new PVector(0, vel.y - 0.2);
        e.pos.y = pos.y - e.r;
      }
    }
  }
}
