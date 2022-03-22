class TimerHighscore {

  void saveHighscore(Timer t) { //Denne funktion var lavet med hjælp fra min klassekammerat Marcus Wegmann.

    ArrayList<String> lines = new ArrayList<String>(Arrays.asList(loadStrings("Highscore.txt")));
    String newTime = (t.currentTime - t.startTime) + "";
    lines.add(newTime);
    lines.sort((a, b) -> Integer.parseInt(a) - Integer.parseInt(b)); //Sorterer ved at minusse det første i listen med det andet. Hvis tallet bliver positivt rykekr man det en ned, men hvis det er negativ forbliver det der.
    List<String> newLines = lines.subList(0, 5); //subList tillader mig at hente en portion af en arrayList fra start indeks inklusiv, til slutindeks eksklusiv.
    t.pladsholder = newLines.toArray(t.array);
    saveStrings("Highscore.txt", t.pladsholder);
    t.hasSaved = true;
  }

  void displayHighscores(Timer t) {

    ArrayList<String> lines = new ArrayList<String>(Arrays.asList(loadStrings("Highscore.txt")));
    List<String> newLines = lines.subList(0, 5);
    t.pladsholder = newLines.toArray(t.array);

    push();
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER);
    translate(width/2, height/2);
    rect(135, 205, 230, 250);
    fill(0);
    text("Top 5 times: ", 140, 110);
    for (int i = 0; i < t.pladsholder.length; i++) {
      text(Integer.parseInt(t.pladsholder[i]) / 1000f + " seconds", 140, 150 + 40*i);
    }
    rectMode(CORNER);
    textAlign(CORNER);
    pop();
  }
}
