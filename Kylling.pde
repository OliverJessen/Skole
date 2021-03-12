class Kylling extends Dyr {
  
   
  
  void display() {

    fill(255,0,0);
    rect(x-25,y+20,20,40,10,10,10,10);
    rect(x+5,y+20,20,40,10,10,10,10);
    ellipse(x-30,y,20,50);
    super.display();
    
    fill(255);
    ellipse(x+15,y-20,40,20);
    
    }
}
