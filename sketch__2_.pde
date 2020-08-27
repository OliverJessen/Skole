float x = 125;
float y = 75;
float z = 225;
float v = 175;
float glas = 60;
float speedX = 8;
float speedY = -8;
void setup(){
size(1200,700);

}

void draw(){
x = x + 4;
y = y + 4;
z = z + 4;
v = v + 4;
speedX = speedX + 12;
speedY = speedY - 12;
background(288,288,288);
/*rect(600,250,50,200);
rect(610,150,30,100);
rect(590,50,70,130);
fill(100,0,0);
rect(600,glas,50,110);*/
fill(100,142,116);
rect(x,200,100,100);
line(x,300,y,400);
fill(0,0,0);
line(z,300,v,400);
fill(300,162,116);
rect(0,400,10000,300);

if(y> z){
    speedX = -speedX;
  }
  if(y> x){
    speedY = -speedY;
  }
  
}
