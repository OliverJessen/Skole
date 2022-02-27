class Car {

  CarDisplay Displayer = new CarDisplay();
  CarMovement Mover = new CarMovement();

  float x = 735;
  float y = 605;

  float rotationSpeed = 0.05;
  PVector location;
  PVector velocity;
  PVector direction;
  PVector tracks;
  PVector behind;
  float angle;

  Car() {
    forward = false;
    backward = false;
    left = false;
    right = false;
    location = new PVector(x, y);
    velocity = new PVector();
    direction = new PVector(0.025, 0);
  }

  void carShowcase() {

    Mover.overlap(this);
    Mover.tracks();
    Mover.move(this);
    Mover.engineStart();
    Displayer.display(this);
  }
}
