class Bullet {

  PVector pos;
  PVector dir;
  PVector vel;

  Bullet(float x1, float y1) {

    float x2 = mouseX;
    float y2 = mouseY;

    pos = new PVector();
    dir = new PVector(x2-x1, y2-y1);
    vel = new PVector(0, 0.25);
  }


  void show() {

    ellipse(pos.x, pos.y, 10, 10);
  }


  void update() {

    pos.add(dir);
  }
}
