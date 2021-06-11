class Verden {

ArrayList<Dyr> dyreListe = new ArrayList <Dyr>(); //Arrayliste til alle dyr, planter og terræner. Så kan man lave flere og gøre andre ting med dem.
ArrayList<Planter> planteListe = new ArrayList<Planter>();
ArrayList<Terrain> terrainListe = new ArrayList<Terrain>();

PImage baggrund;
PImage tree;
PImage bush;
PImage cow;
PImage cat;
PImage swamp;
PImage flower;

float speedX;
float speedY;

void mousePressed() { //kan slette manuelt
  if(mousePressed && dyreListe.size() != 0) {
  dyreListe.remove(0);
  }
}

void overview() { //holder styr over hvor mange der er.
  if(dyreListe.size() != 0) {
    text("der er " + dyreListe.size() + " dyr lige nu", 20,20); 
  } else {text("der er ingen dyr lige nu", 20,20);
 }
  if(planteListe.size() != 0) {
    text("der er " + planteListe.size() + " planter lige nu", 20,40); 
  } else {text("der er ingen planter lige nu", 20,40);
 }
 if(terrainListe.size() != 0) {
    text("der er " + terrainListe.size() + " terræner lige nu", 20,60); 
  } else {text("der er ingen terræner lige nu", 20,60);
 }
}
void lavKat() {
  
  Kat k = new Kat();
  k.x = mouseX;
  k.y = mouseY;
  dyreListe.add(k);
}

void lavKo() {
  
  Ko c = new Ko();
  c.x = mouseX;
  c.y = mouseY;
  dyreListe.add(c);
}

void lavTrae() {
  
  Trae t = new Trae();
  t.x = mouseX;
  t.y = mouseY;
  planteListe.add(t); 
}

void lavBlomst() {
  
  Blomst b = new Blomst();
  b.x = mouseX;
  b.y = mouseY;
  planteListe.add(b); 
}

void lavBusk() {
  Busk u = new Busk();
  u.x = mouseX;
  u.y = mouseY;
  planteListe.add(u);
}

void lavSvamp() {
  
  Svamp s = new Svamp();
  s.x = mouseX;
  s.y = mouseY;
  terrainListe.add(s);
  
}

  void opdaterDyr() {
    
    for(Dyr d : dyreListe) { 
    d.display();
    d.move(); 
    
     }  
     
    if(dyreListe.size() > 100) {
    dyreListe.remove(0);
    }
   } 
   
  void opdaterPlanter() {
    
    for(Planter p : planteListe) {
    p.display();
    p.growth();
    }
    
    if(planteListe.size() > 20) {
    planteListe.remove(0); 
    }
  }
  
  void opdaterTerrain() {
    
    for(Terrain t : terrainListe) {
    t.display();
    t.effect();
    }
    
    if(terrainListe.size() > 10) {
    terrainListe.remove(0); 
    }
    
  }
  
  void collision() {
   
   for(Terrain t : terrainListe) {
     for(Dyr d : dyreListe) {
       if(d.y < t.y + (t.TerrainHeight - t.TerrainHeight/2) - 20 && d.x < t.x + (t.TerrainWidth - t.TerrainWidth/2) - 20) {
         if(d.y > t.y - (t.TerrainHeight - t.TerrainHeight/2) - 20 && d.x > t.x - (t.TerrainWidth - t.TerrainWidth/2) - 20) {
        d.speedX *= 0.5;
        d.speedY *= 0.5;
       } else {}
       }  
     }
   }  
 }
  
  void display() {
    
  }
  
  void billeder() {
  
  tree = loadImage("Green tree.png");
  bush = loadImage("cute bush.png");
  cow = loadImage("cute cow.png");
  cat = loadImage("black cat.png");
  swamp = loadImage("Isspand.png");
  flower = loadImage("rose.png");
  }
}
