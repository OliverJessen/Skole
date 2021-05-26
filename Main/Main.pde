Graph graph = new Graph();

void setup() {

  fullScreen();

}

void draw() {

  clear();
  background(255);

  graph.displayGraph();

  fill(255);
  strokeWeight(2);
  rect(10, 10, 485, 150);
  fill(0);
  textSize(20);
  text("Yellow is how many there are currently infected.", 20, 40);
  text("Red is how many there have died.", 20, 90);
  text("Hold cursor near graph, to see the index.", 20, 140);

}
