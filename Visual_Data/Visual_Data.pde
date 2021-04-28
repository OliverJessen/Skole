Knap knap = new Knap(1200, 400, 100, 100, color(255), 0, color(0, 100, 0));

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

  int xlevel;
  int ylevel = 10;

  for (TableRow row: table.rows()) {

    String stateName = row.getString("state");
    int stateArea = row.getInt("area (sq. mi)");

    xlevel = (stateArea / 550);

    rect(10, ylevel, xlevel, 13.5);

    ylevel = ylevel + 17;

    text(" " + stateName + ": " + stateArea + " square miles", (xlevel + 10), ylevel - 5.5);

  }

  knap.display();

  if (isActive) {
    push();
    fill(0);
    textAlign(CENTER);
    textSize(11);
    text("SORT BY LETTER", width - 150, height / 2);
    pop();

  } else {
    push();
    fill(0);
    textAlign(CENTER);
    text("SORT BY SIZE", width - 150, height / 2);
    pop();
  }
  if (mouseX >= knap.x && mouseX <= knap.x + 100 && mouseY >= knap.y && mouseY <= knap.y + 100) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void table() {
  table = loadTable("https://raw.githubusercontent.com/jakevdp/data-USstates/master/state-areas.csv", "header");

  table.setColumnType("area (sq. mi)", Table.INT); //basically sorterer det således at "area" er tal i stedet for bogstaver.
}

void mousePressed() {

  if (mouseX >= knap.x && mouseY >= knap.y && mouseX <= knap.x + 100 && mouseY <= knap.y + 100) {
    isActive = !isActive;

    if (isActive) {
      //en enkel ting der sorterer csv filen.
      table.sortReverse(1);

    } else {
      table.sort(0);
    }
  }

}

/*void loadingScreen() {
  boolean loadingisActive = false;
  
  for (int j = 0; j < 10000;) {
    frameRate(1);
    j = j + int(random(1,2));
    push();
    clear();
    textSize(40);
    textAlign(CENTER);
    text("loading  " + j/100 + " %", width / 2, height / 2);
    //println(j);
    pop();
   
  }
}
*/
