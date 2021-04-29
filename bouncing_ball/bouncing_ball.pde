float leftCorner = 600;
float rightCorner = 600;
float x = 340;
float y = 100;
float speedx = 12;
float speedy = 11;
float speedleftCorner = -1;
float speedrightCorner = -1;
float d = 0;
float e = 0;
float Kasse = leftCorner/2 + rightCorner/2;
void setup(){
size(1500,900);
  
  
}

void draw(){
rightCorner = rightCorner + speedrightCorner;
leftCorner = leftCorner + speedleftCorner;
x = x + speedx;
y = y + speedy;
e = e + 1;
background(0,0,0); 

stroke(255);
noFill();
rectMode(CENTER);
rect(width/2,height/2,leftCorner,rightCorner); 

ellipse(x,y,10,10);
 
 if(x > width/2 + leftCorner/2){
   speedx = speedx * (-1);
   speedy = speedy * (1);
 }
 if(y > height/2 + rightCorner/2){
   speedx = speedx * (1);
   speedy = speedy * (-1);
 }
 if(x < width/2 -(leftCorner/2)){
   speedx = speedx * (-1);
   speedy = speedy * (1);
 }
 if(y < height/2 -(rightCorner/2)){
   speedx = speedx * (1);
   speedy = speedy * (-1);
 }
 if(x > width/2+leftCorner/2){
    x = width/2+leftCorner/2;
 }
  if(x < width/2-leftCorner/2){
    x = width/2-leftCorner/2;
}
  if(y > height/2+rightCorner/2){
    y = height/2+rightCorner/2;
  }
  if(y < height/2-rightCorner/2){
    y = height/2-rightCorner/2;
  }
  if(leftCorner == 50){
  leftCorner = 50 ;
  speedleftCorner = 1;
  rightCorner = 50;
  speedrightCorner = 1;
  }
  if(leftCorner == 605){
  leftCorner = 605 ;
  speedleftCorner = -1;
  rightCorner = 605;
  speedrightCorner = -1;
  }
}
