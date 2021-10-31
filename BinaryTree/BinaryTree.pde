float vinkel = PI/8;

void setup() {

  size(500, 500);
}

void draw() {
  clear();
  push();
  strokeWeight(30);
  stroke(130, 73, 16);
  line(width/2, height, width/2, height - 100);
  pop();
  stroke(0, 150, 0);
  tegnGren(250, height -80, 0, -40, vinkel);
  tegnGren(250, height -80, 0, -40, -vinkel);
}

void tegnGren(float x, float y, float l, float h, float v) {

   strokeWeight(5);
  if (pow(l, 2) + pow(h, 2) > pow(10, 2)) {
    PVector p = new PVector(l, h);
    p.rotate(v);
    PVector newPos = PVector.add(p, new PVector(x, y));

    line(x, y, newPos.x, newPos.y);
    tegnGren(newPos.x, newPos.y, p.x*0.8, p.y*0.8, v);
    tegnGren(newPos.x, newPos.y, p.x*0.8, p.y*0.8, -v);
  }
}

void keyPressed() {

  if (key == 'w')
    vinkel = vinkel + 0.01;

  if (key == 's') 
    vinkel = vinkel - 0.01;
}
