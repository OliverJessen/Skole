ArrayList<Dyr> dyreListe = new ArrayList<Dyr>();

 PImage Baggrund;
 
  void setup() {  
  Baggrund = loadImage("maxresdefault.jpg");
  surface.setResizable(true);
  size(1920,950);
  
}

  void draw() {
  image(Baggrund,0,0,1920,950);
  
  fill(255);
  textSize(20);
  text("Press number 1 to spawn red Among Us.",20,40);
  text("Press number 2 to spawn brown Among Us.",20,70);
  text("Press number 3 to spawn blue Among Us.",20,100);
  text("Press the mouse button to de-spawn Among Us.",20,height-30);
  
  for(Dyr d : dyreListe) { 
    d.display();
    d.move();
  }   
  if(dyreListe.size() > 40) {
    dyreListe.remove(0);
  }
}

  void keyPressed() {
   if(key == '1'){ dyreListe.add(new Kylling());  }
   if(key == '2'){ dyreListe.add(new Hest());  }
   if(key == '3'){ dyreListe.add(new Gris());  }
}

void mousePressed() {
 if(dyreListe.size() != 0) {
  dyreListe.remove(dyreListe.size()-1);
  }
}
