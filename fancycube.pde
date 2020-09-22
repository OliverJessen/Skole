

void setup(){
size(800,800); 
  rectMode(CENTER);

}

void draw(){
  clear();
for(int x = 80; x < 800; x = x + 80){
  for(int y = 80; y < 800; y = y + 80){
  float size = random(70,90);
  float c = +1;
         c = c+3;
         fill(0,(x+y)/c,(x+y)/c);
    rect(x,y,size,size);
    
  }   
 }
} 
