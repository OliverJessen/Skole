Platform p;
Player e;
PVector gravity;
ArrayList<Platform> platforms;

void setup() {

  size(500, 500);
  gravity = new PVector(0, 0.2);
  platforms = new ArrayList<Platform>();
  p = new Platform();
  e = new Player();
}

void draw() {


  background(0);
  if (random(1) < 0.05) {
    platforms.add(new Platform());
  }
  for (int i = platforms.size() - 1; i >= 0; i--) {
    PVector yPos = platforms.get(i).pos;

    if (yPos.y <= 0) {
      platforms.remove(i);
      i--;
    }
  }

  e.show();
  e.update();
  e.applyForce(gravity);

  for (Platform p : platforms) {
    p.show();
    p.update();
    p.interact(e);
  }
}

void keyPressed() {

  if (key == 'd') {
    e.setDir(1);
  }
  if (key == 'a') {
    e.setDir(-1);
  }
  if (key == ' ') {
    e.vel = new PVector(0, -6);
  }
  if (key == 's') {
    e.pos.y += e.r*2;
  }
}

void keyReleased() {

  if (key == 'd') {
    e.setDir(0);
  }
  if (key == 'a') {
    e.setDir(0);
  }
  if (key == ' ') {
    gravity = new PVector(0, 0.2);
  }
  if (key == 's') {
    e.pos.y += 0;
  }
}
