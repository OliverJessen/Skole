class Checkpoints {

  ArrayList<PVector> checkpoints = new ArrayList<PVector>();
  CheckpointsList cpl = new CheckpointsList();
  Timer t = new Timer();

  int checkpointCount;

  Checkpoints() {

    cpl.List(this);
  }

  void checkpointShowcase() {

    cp.display();
    cp.CheckpointReached(c.location);
  }

  void display() {

    pushMatrix();

    for (int i = checkpointCount; i < checkpoints.size(); i++) {
      PVector p = checkpoints.get(i);
      circle(p.x, p.y, 20);
      imageMode(CENTER);
      image(goldCoin, p.x, p.y, 30, 30);
      imageMode(CORNER);
    }

    fill(255);
    strokeWeight(2);
    rect(5, 5, 200, 40);
    fill(0);
    textSize(13);
    text("Checkpoints reached: " + checkpointCount + "/" + checkpoints.size(), 10, 20);
    popMatrix();
  }


  void CheckpointReached(PVector position) {

    if (checkpointCount < checkpoints.size()) {

      PVector p = checkpoints.get(checkpointCount);
      float d = dist(p.x, p.y, position.x, position.y);

      if (d < 20) {
        checkpointCount++;
      }
    }
  }
}
