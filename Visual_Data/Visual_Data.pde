Knap knap = new Knap(1200, 400, 100, 100, color(255), 0, color(0, 100, 0));
loadingScreen screen = new loadingScreen(0, 0, 1500, 900, color(0), 0, 0);
boolean isActive;

//float strokeweight = 0;
Table table;

void setup() {
  size(1400, 900);
  table();
  textSize(12);
}

void draw() {
  clear();
  //loadingScreen();

  knap.display();

  push();
  fill(0);
  textAlign(CENTER);
  text("Sort by size", width - 150, height / 2);
  pop();

  table();

  if (mouseX >= knap.x && mouseX <= knap.x + 100 && mouseY >= knap.y && mouseY <= knap.y + 100) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void table() {
  int xlevel;
  int ylevel = 10;

  table = loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");

  for (TableRow row: table.rows()) {

    String stateName = row.getString("state");
    int stateArea = row.getInt("area (sq. mi)");

    xlevel = (stateArea / 550);

    rect(10, ylevel, xlevel, 13.5);

    ylevel = ylevel + 15;

    text(" " + stateName + ": " + stateArea + " square miles", (xlevel + 10), ylevel - 3);

  }

}

void mousePressed() {

  if (mouseX >= knap.x && mouseY >= knap.y && mouseX <= knap.x + 100 && mouseY <= knap.y + 100) {
    isActive = true;
    println(isActive);
  } else {
    isActive = false;
  }
}

void loadingScreen() {

  for (int i = 0; i < 100; i++) {
    push();
    clear();
    textSize(40);
    textAlign(CENTER);
    text("loading  " + i + " %", width / 2, height / 2);
    pop();
  }
}
