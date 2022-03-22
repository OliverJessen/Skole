class Player {

  PVector pos;
  PVector vel;
  PVector acc;
  PVector mDir;
  float r = 10;
  float xdir;
  float variable;

  Player() {

    float x = width/2;
    float y = height/2;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    mDir = new PVector(mouseX, mouseY);
  }

  void show() {

    push();
    translate(pos.x, pos.y);
    ellipse(0, 0, r*2, r*2);
    pop();
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    pos.x += xdir*3;

    if (pos.x + r >= width)
      pos.x = width-r;

    if (pos.x - r <= 0)
      pos.x = 0+r;

    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    if (pos.y + r*2 >= 480) {
      pos.y = 460;
      gravity = new PVector(0, 0);
    } else {
      gravity = new PVector(0, 0.2);
    }
  }

  void setDir(int dir) {
    xdir = dir;
  }
}
