class CarDisplay {

  void display(Car c) { //Displayer bilens udseende og roterer billedet samtid med objektet.

    push();
    translate(c.location.x, c.location.y);
    rotate(c.angle);
    imageMode(CENTER);
    image(raceCar, 0, 0, 46.8, 27);
    pop();
  }
}
