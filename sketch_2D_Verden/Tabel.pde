class Tabel extends Verden {

  PImage baggrund;
  PImage tree;
  PImage bush;
  PImage cow;
  PImage cat;
  PImage swamp;

  void display() {
    for (int i = 0; i <= 4; i++) {
      rect(20, 20 + (i * 100), 50, 50);

    }
    baggrund = loadImage("Grass_Background.png");
    tree = loadImage("tree.png");
    bush = loadImage("bush.jpeg");
    cow = loadImage("cow.png");
    cat = loadImage("cat.png");
    swamp = loadImage("swamp.png");

    tree.resize(49, 49);
    image(tree, 21, 21);

    bush.resize(49, 49);
    image(bush, 21, 121);

    cow.resize(49, 49);
    image(cow, 21, 221);

    cat.resize(49, 49);
    image(cat, 21, 321);

    swamp.resize(49, 49);
    image(swamp, 21, 421);

  }

  void keyPressed() {

   
  }
}
