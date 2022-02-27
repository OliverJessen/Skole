class CarMovement {

  ArrayList<PVector> wheelLeft = new ArrayList<PVector>();
  ArrayList<PVector> wheelRight = new ArrayList<PVector>();

  void move(Car c) { //Bevæger af bilen. Sørger for at bilen kan dreje og automatisk sætte farten ned hvis man ikke rører en knap.

    c.velocity.limit(3);

    if (forward == false && backward == false && c.velocity.magSq() < 0.1)
      c.velocity = new PVector();

    c.location.add(c.velocity);

    if (forward == true) {
      c.velocity.add(c.direction);
    }

    if (backward == true) {
      c.velocity.sub(c.direction);
    }

    //Denne blok af kode var skrevet med hjælp af Marcus Wegmann. Hjælper med at sætte farten ned for køretøjet.
    if (forward == false && backward == false) {
      if (c.velocity.x > 0 && c.direction.x > 0)
        c.velocity.sub(c.direction);
      if (c.velocity.x < 0 && c.direction.x > 0)
        c.velocity.add(c.direction);
      if (c.velocity.x > 0 && c.direction.x < 0)
        c.velocity.add(c.direction);
      if (c.velocity.x < 0 && c.direction.x < 0)
        c.velocity.sub(c.direction);
    }

    if (left == true) {
      c.direction.rotate(-c.rotationSpeed);
      c.velocity.rotate(-c.rotationSpeed);
      c.angle -= c.rotationSpeed;
    }

    if (right == true) {
      c.direction.rotate(c.rotationSpeed);
      c.velocity.rotate(c.rotationSpeed);
      c.angle += c.rotationSpeed;
    }
  }

  void engineStart() { //Tæller ned fra 3 til at man kan begynde at køre ligesom i andre racerspil. Denne del var fundet på af Daniel Ahmadi og lavet med hjælp af Christopher Bik.

    timer = millis()/1000 - preTimer;

    if (TryAgainYes) {

      preTimer = millis()/1000;
      TryAgainYes = false;
    }

    push();

    textSize(70);
    textAlign(CENTER);
    fill(255, 0, 0);

    if (timer < 4) {
      forward = false;
      if (timer > 0) {
        text("3", 0.3*width, height/2);
      }
      if (timer > 1) {
        text("2", 0.5*width, height/2);
      }
      if (timer > 2) {
        text("1", 0.7*width, height/2);
      }
    }
    if (timer > 3 && timer < 5) {
      text("GO!", width/2, height/2);
    }

    pop();
  }

  void tracks() { //tegner spor efter bilen.

    push();
    noStroke();
    fill(0);

    PVector behindLeft = new PVector(-15, -7);
    PVector behindRight = new PVector(-15, 7);
    behindLeft.rotate(c.angle);
    behindRight.rotate(c.angle);
    behindLeft.add(c.location);
    behindRight.add(c.location);

    if (c.velocity.mag() > 2) { //Tegner kun hvis bilen bevæger en hvis hastighed
      wheelLeft.add(new PVector(behindLeft.x, behindLeft.y));
      wheelRight.add(new PVector(behindRight.x, behindRight.y));
    }

    if (wheelLeft.size() >= 26 || wheelLeft.size() > 0 && c.velocity.mag() < 2) //Hvis bilen sætter farten ned eller der er for mange cirkler, sletter den den første.
      wheelLeft.remove(0);

    if (wheelRight.size() >= 26 || wheelRight.size() > 0 && c.velocity.mag() < 2)
      wheelRight.remove(0);

    for (PVector p : wheelLeft) {
      ellipse(p.x, p.y, 10, 10);
    }

    for (PVector p : wheelRight) {
      ellipse(p.x, p.y, 10, 10);
    }

    pop();
  }

  void overlap(Car c) { //Tjekker om bilens position er udenfor banen. Hvis den er, sætter programmet topfarten ned for bilen.

    color color_car_position = get(int(c.location.x), int(c.location.y));

    // println(red(color_car_position), blue(color_car_position), green(color_car_position));

    if (red(color_car_position) == 139 && blue(color_car_position) == 74 && green(color_car_position) == 195) { //græs
      c.velocity.limit(1.5);
    }
    if (red(color_car_position) == 255 && blue(color_car_position) == 59 && green(color_car_position) == 235) { //sand
      c.velocity.limit(1.3);
    }
    if (red(color_car_position) == 56 && blue(color_car_position) == 60 && green(color_car_position) == 142 ) { //mørt græs
      c.velocity.limit(1.4);
    }
    if (red(color_car_position) == 46 && blue(color_car_position) == 50 && green(color_car_position) == 125 ) { //banekanten
      c.velocity.limit(0.8);
    }
  }
}
