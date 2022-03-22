import java.util.Arrays;
import java.util.List;

class Timer {

  TimerHighscore th = new TimerHighscore();

  boolean isDriving = false;
  boolean isDone = false;
  boolean hasSaved = false;
  int startTime;
  int currentTime;
  String[] array = new String[5];
  String[] pladsholder;
  PVector point1 = new PVector(787, 581);
  PVector point2 = new PVector(787, 631);
  PVector middlePoint = new PVector((point1.x + point2.x) /2, (point1.y+point2.y)/2);

  void timeShowcase() {
    t.startTime(c.location);
  }

  void startTime(PVector pos) {

    push();
    textSize(13);
    text("  Seconds: " + ((float)(t.currentTime - t.startTime) / 1000), 5, 40);
    pop();

    float d = dist(middlePoint.x, middlePoint.y, pos.x, pos.y); //distancen mellem bilen og slutstriben.

    if (d < 30) {
      if (cp.checkpointCount == 0) {
        isDriving = true;
        startTime = millis();
      }
      if (cp.checkpointCount == cp.checkpoints.size()) {
        isDriving = false;
        isDone = true;
      }
    }

    if ( cp.checkpointCount == cp.checkpoints.size() && !isDriving) {
      finishedLap();
    }
    if (isDriving) {
      currentTime = millis();
    }
  }

  void finishedLap() {

    int halfW = width/2;
    int halfH = height/2;

    push();

    //Lykønsker at du er færdig.
    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    rect(halfW, halfH, 500, 80);
    fill(0);
    textSize(60);
    text("Finished the race!", halfW, halfH + 20);
    image(penguin, halfW - 425, halfH - 125, 200, 200);
    image(penguin, halfW + 225, halfH - 125, 200, 200);
    rectMode(CORNER);

    //Din egen køretid.
    textSize(30);
    fill(255);
    rect(halfW - 250, halfH + 80, 230, 80);
    fill(0);
    text("Your time: ", halfW - 135, halfH + 110);
    text(((float)(t.currentTime - t.startTime) / 1000) + " seconds", halfW - 135, halfH + 145);

    //Genstarte banen.
    fill(255);
    rect(halfW - 250, halfH + 180, 230, 150);
    if ( cp.checkpointCount == cp.checkpoints.size() && !isDriving) {
      if (mouseX > halfW - 235 && mouseX < halfW - (235-80) && mouseY > halfH + 245 && mouseY < halfH + 285) {
        cursor(HAND);
        fill(0, 255, 0);
        rect(halfW - 235, halfH + 245, 80, 40);
      } else {
        cursor(ARROW);
        fill(255);
        rect(halfW - 235, halfH + 245, 80, 40);
      }

      if (mouseX > halfW - 115 && mouseX < halfW - (115-80) && mouseY > halfH + 245 && mouseY < halfH + 285) {
        cursor(HAND);
        fill(255, 0, 0);
        rect(halfW - 115, halfH + 245, 80, 40);
      } else {
        fill(255);
        rect(halfW - 115, halfH + 245, 80, 40);
      }
    }
    fill(0);
    text("Try again?", halfW - 135, halfH + 215);
    text("Yes", halfW - 195, halfH + 275);
    text("No", halfW- 75, halfH + 275);

    //De top 5 bedste tider.
    th.displayHighscores(this);

    pop();

    //Sammenligner din køretid med de top 5. Hvis din køretid er bedre, erstatter den en af tiderne.
    if (isDone && !hasSaved) {
      th.saveHighscore(this);
    }
  }
}
