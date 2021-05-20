Table table;
boolean isActive;
float i = 0;
float g = 0;
float d;

void setup() {

  fullScreen();
}

void draw() {
  clear();
  background(255);

  push();
  fill(255);
  strokeWeight(2);
  rect(10, 10, 485, 150);

  pop();

  table();

  push();
  fill(0);
  textSize(20);
  text("Yellow is how many there are currently infected.", 20, 40);
  text("Red is how many there have died.", 20, 90);
  text("Hold cursor near graph, to see the index.", 20, 140);
  pop();

}
void table() {
  int xlevel = 0;

  table = loadTable("https://raw.githubusercontent.com/nytimes/covid-19-data/1d7dac8f74e9d3ad4c6a91721ef015916d54617c/live/us-states.csv", "header");

  for (TableRow row: table.rows()) {

    String stateName = row.getString("state");
    int stateCase = row.getInt("cases");
    int stateDeath = row.getInt("deaths");
    //int ExpectedstateCase = row.getInt("probable_cases");
    //int ExpectedstateDeath = row.getInt("probable_deaths");

    if (!stateName.equals("New York") && !stateName.equals("Minnesota") &&
      !stateName.equals("Wisconsin") && !stateName.equals("Michigan")) {
      continue;

    }
    xlevel = xlevel + width / 5;

    float caseHeight = -(stateCase / 3000);
    float deathHeight = -(stateDeath / 100);
    //float Expected1 = -(ExpectedstateCase / 200);
    //float Expected2 = -(ExpectedstateDeath / 200);

    if (i <= 100) {
      i += 1;
      push();
      textSize(20);
      fill(0);
      text(i + "%", xlevel + 10, height + (caseHeight / 100) * i - 25);
      pop();
    }

    if (g <= 100) {
      g += 1;
    }

    float d = dist(mouseX, mouseY, xlevel, height + caseHeight / 100 * i);

    if (!isActive) {
      cursor(ARROW);
      if (d < width / 6) {
        line(mouseX, mouseY, xlevel + 40, height + (caseHeight / 100) * i - 55);
        push();
        fill(0);
        textSize(20);
        push();
        fill(255);
        rect(mouseX - 70, mouseY - 60, 160, 60);
        pop();
        text(stateCase + " cases. ", mouseX - 60, mouseY - 35);
        text(stateDeath + " deaths.", mouseX - 60, mouseY - 10);
        pop();

      } else if (d > width / 6) {}
    } else if (isActive) {
      noCursor();
      if (d < width / 6) {
        line(mouseX, mouseY, xlevel + 40, height + (caseHeight / 100) * i - 55);
        push();
        fill(0);
        textSize(20);
        push();
        fill(255);
        rect(mouseX - 70, mouseY - 80, 160, 60);
        pop();
        text(stateCase + " cases. ", mouseX - 60, mouseY - 55);
        text(stateDeath + " deaths.", mouseX - 60, mouseY - 30);
        pop();

      } else if (d > width / 6) {}
      push();
      fill(0);
      ellipse(mouseX, mouseY, 10, 10);
      ellipse(mouseX + 10, mouseY - 10, 10, 10);
      ellipse(mouseX - 10, mouseY - 10, 10, 10);
      ellipse(mouseX, mouseY - 20, 10, 10);
      pop();
    }

    fill(235, 235, 0);
    rect(xlevel, height, 40, (caseHeight / 100) * i);

    fill(205, 0, 0);
    rect(xlevel + 50, height, 40, (deathHeight / 100) * g);

    if (mouseX > xlevel && mouseX < xlevel + 80 && i > 100) {
      push();
      fill(0);
      textSize(20);
      text(stateName, xlevel, height + (caseHeight / 100 * i) - 37.5);
      pop();
      /*push();
      fill(0);
      textSize(20);
      text(stateCase + " cases. ", xlevel - 15, height + (caseHeight / 100 * i) - 50);
      text(stateDeath + " deaths.", xlevel - 15, (height + (caseHeight / 100 * i) - 25));
      pop();*/
    } else if (i > 100) {
      push();
      fill(0);
      textSize(20);
      text(stateName, xlevel, height + (caseHeight / 100 * i) - 37.5);
      pop();
    }
  }
}

void mousePressed() {

  isActive = !isActive;

}
