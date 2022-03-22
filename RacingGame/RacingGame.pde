PImage worldMap;
PImage raceCar;
PImage goldCoin;
PImage penguin;
boolean forward;
boolean backward;
boolean left;
boolean right;
int start = 0;
int preTimer;
int timer;
boolean TryAgainYes;
boolean TryAgainNo;

Car c = new Car();
Checkpoints cp = new Checkpoints();
Timer t = new Timer();

void setup() {

  size(1280, 720);

  worldMap = loadImage("racing map.png");
  raceCar = loadImage("8_bit_racer.png");
  goldCoin = loadImage("8 bit gold coin.png");
  penguin = loadImage("penguin.png");
}

void draw() {

  displayAll();
}

void keyPressed() {

  if (key == 'w') {
    forward = true;
  }
  if (key == 's') {
    backward = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 'd') {
    right = true;
  }
}

void keyReleased() {

  if (key == 'w') {
    forward = false;
  }
  if (key == 's') {
    backward = false;
  }
  if (key == 'a') {
    left = false;
  }
  if (key == 'd') {
    right = false;
  }
}

void mouseClicked() {

  if (mouseX > width/2 - 235 && mouseX < width/2 - (235-80) && mouseY > height/2 + 245 && mouseY < height/2 + 285) {
    TryAgainYes = true;
  }

  if (mouseX > width/2 - 115 && mouseX < width/2 - (115-80) && mouseY > height/2 + 245 && mouseY < height/2 + 285) {
    TryAgainNo = true;
  }

  if (TryAgainYes) {
    restartGame();
  }

  if (TryAgainNo == true) {
    exit();
  }
}

void restartGame() {

  t.currentTime = 0 + t.startTime;
  t.hasSaved = false;
  cp.checkpointCount = 0;
  c.location = new PVector(735, 605);
  cursor(ARROW);
}

void displayAll() {

  clear();
  background(worldMap);
  c.carShowcase();
  cp.checkpointShowcase();
  t.timeShowcase();
}
