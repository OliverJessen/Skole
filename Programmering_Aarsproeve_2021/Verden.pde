class Verden {

ArrayList<Dyr> dyreListe = new ArrayList <Dyr>(); //Arrayliste til alle dyr, planter og terræner. Med ArrayListen kan man lave flere dyr/planter/terræn ved at tilføje til listen.
ArrayList<Planter> planteListe = new ArrayList<Planter>();
ArrayList<Terrain> terrainListe = new ArrayList<Terrain>();

PImage baggrund;
PImage tree;
PImage bush;
PImage cow;
PImage cat;
PImage swamp;
PImage flower;

void mousePressed() { //kan slette manuelt dyrene fra ArrayListen dyreListe hvis det skulle være.
  if(mousePressed && dyreListe.size() != 0) { dyreListe.remove(0); }
}

void overview() { //holder styr over hvor mange styks indenfor de forskellige arter der er.
  if(dyreListe.size() != 0) {
    text("der er " + dyreListe.size() + " dyr lige nu", 20,20); 
  } else {text("der er ingen dyr lige nu", 20,20); }
  if(planteListe.size() != 0) {
    text("der er " + planteListe.size() + " planter lige nu", 20,40); 
  } else {text("der er ingen planter lige nu", 20,40); }
 if(terrainListe.size() != 0) {
    text("der er " + terrainListe.size() + " terræner lige nu", 20,60); 
  } else {text("der er ingen terræner lige nu", 20,60); }

}

void lavKat() { //Denne funktion er med til at programmere hvorhenne man skal "lave" en kat på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed(). 
  Kat k = new Kat();
  k.x = mouseX;
  k.y = mouseY;
  dyreListe.add(k);
}

void lavKo() { //Denne funktion er med til at programmere hvorhenne man skal "lave" en ko på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed().
  Ko c = new Ko();
  c.x = mouseX;
  c.y = mouseY;
  dyreListe.add(c);
}

void lavTrae() { //Denne funktion er med til at programmere hvorhenne man skal "lave" et træ på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed().
  Trae t = new Trae();
  t.x = mouseX;
  t.y = mouseY;
  planteListe.add(t); 
}

void lavBlomst() { //Denne funktion er med til at programmere hvorhenne man skal "lave" en blomst på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed().
  Blomst b = new Blomst();
  b.x = mouseX;
  b.y = mouseY;
  planteListe.add(b); 
}

void lavBusk() { //Denne funktion er med til at programmere hvorhenne man skal "lave" en busk på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed().
  Busk u = new Busk();
  u.x = mouseX;
  u.y = mouseY;
  planteListe.add(u);
}

void lavSvamp() { //Denne funktion er med til at programmere hvorhenne man skal "lave" en svamp på skærmen. Jeg fortæller hvad x og y-værdien skal være når jeg bruger void keyPressed().
  Svamp s = new Svamp();
  s.x = mouseX;
  s.y = mouseY;
  terrainListe.add(s);
  
}

  void opdaterDyr() { // i denne funktion referencerer jeg til Dyr klassen, og kalder på klassens display() og move().
    
    for(Dyr d : dyreListe) { 
    d.display();
    d.move(); 
    }  
     
    if(dyreListe.size() > 100) { // hvis ArrayListen bliver for stor, vil den automatisk slette den første der blev kaldt.
    dyreListe.remove(0);
    }   
 } 
   
  void opdaterPlanter() { // i denne funktion referencerer jeg til Planter klassen, og kalder på klassens display() og growth().
    
    for(Planter p : planteListe) {
    p.display();
    p.growth();
    }
    
    if(planteListe.size() > 20) { // hvis ArrayListen bliver for stor, vil den automatisk slette den første der blev kaldt.
    planteListe.remove(0); 
    }
  }
  
  void opdaterTerrain() { // i denne funktion referencerer jeg til Terrain klassen, og kalder på klassens display().
    
    for(Terrain t : terrainListe) {
    t.display();
    }
    
    if(terrainListe.size() > 10) { // hvis ArrayListen bliver for stor, vil den automatisk slette den første der blev kaldt.
    terrainListe.remove(0); 
    }
    
  }
  
  void collision() { //For hvert terræn og for hvert dyr, hvis x og y-værdierne mellem de to objekter bliver mindre end en vis værdi, vil farten på dyrene være langsommere.
   
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
    
  void billeder() { // Herinde har jeg de forskellige billeder for dyrene, som jeg bruger hver gang jeg skal lave et nyt dyr. Den behøver ikke at blive kaldt, den skal bare være i en funktion.
  
  tree = loadImage("Green tree.png");
  bush = loadImage("cute bush.png");
  cow = loadImage("cute cow.png");
  cat = loadImage("black cat.png");
  swamp = loadImage("Isspand.png");
  flower = loadImage("rose.png");
  }
  
  void opdaterAlt() {
  
    v.opdaterTerrain(); //har sat opdater-funktionerne først før collision og overview så de tegnes bagefter og ikke vises under baggrunden og de forskellige arter.
    v.opdaterPlanter();
    v.opdaterDyr();
    v.collision();
    v.mousePressed();
    v.overview();
  
  }
}
