ArrayList<Dyr> dyreListe = new ArrayList <Dyr>();

PImage baggrund;

boolean isActive = false;

Verden verden = new Verden();
Tabel tabel = new Tabel();
Dyr dyr = new Dyr();

void setup() {

  size(800, 700);
  baggrund = loadImage("Grass_Background.png");
  frameRate(24);
}

void draw() {

  baggrund.resize(width, height);
  image(baggrund, 0, 0);

  verden.display();

 for(Dyr d : dyreListe) { 
    d.display();
    d.move();
  }   
  if(dyreListe.size() > 10) {
    dyreListe.remove(0);
  }
}




class Verden {

  void display() {

    tabel.display();
    tabel.keyPressed();
    
    dyr.display();
    dyr.move();
    
  }
}

void mousePressed() {
  
   //{ dyreListe.add(new Kat());  }
  // if(key == '2'){ dyreListe.add(new Hest());  }
  // if(key == '3'){ dyreListe.add(new Gris());  }
  
 if(dyreListe.size() != 0) {
  dyreListe.remove(dyreListe.size()-1);
  }
}
