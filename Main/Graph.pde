  class Graph {

    Table graph;
    boolean isActive;
    float i = 0;
    float g = 0;
    float d;

    void displayGraph() {

      int xlevel = 0;

      graph = loadTable("https://raw.githubusercontent.com/nytimes/covid-19-data/1d7dac8f74e9d3ad4c6a91721ef015916d54617c/live/us-states.csv", "header");

      for (TableRow row: graph.rows()) {

        String stateName = row.getString("state");
        int stateCase = row.getInt("cases");
        int stateDeath = row.getInt("deaths");

        if (!stateName.equals("New York") && !stateName.equals("Minnesota") &&
          !stateName.equals("Wisconsin") && !stateName.equals("Michigan") &&
          !stateName.equals("Ohio") && !stateName.equals("Pennsylvania") &&
          !stateName.equals("Indiana") && !stateName.equals("Iowa") &&
          !stateName.equals("South Dakota") && !stateName.equals("Illinois") &&
          !stateName.equals("Ohio")) {
          continue;
        }

        xlevel = xlevel + width / 11;

        float caseHeight = -(stateCase / 3000);
        float deathHeight = -(stateDeath / 100);

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

        fill(204, 204, 0);
        rect(xlevel, height, 40, (caseHeight / 100) * i);

        fill(205, 0, 0);
        rect(xlevel + 50, height, 40, (deathHeight / 100) * g);

        if (i > 100) {
          push();
          fill(0);
          textSize(20);
          text(stateName, xlevel, height + (caseHeight / 100 * i) - 37.5);
          pop();

        }

        float d = dist(mouseX, mouseY, xlevel, height + caseHeight / 100 * i);

        if (d < width / 10) {
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

      }
    }
  }
