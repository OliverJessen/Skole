float x = 1;
float farve = 10;
void setup(){


background(135, 206, 235);
size(1100,800);
fill(224,172,105);
rect(275,325,550,400);
fill(255,99,71);
triangle(245,325,850,325,550,125);
fill(126,200,80);
rect(0,725,1100,75);
fill(102, 51, 0);
rect(680,515,100,210);
fill(253, 184, 19);
rect(925,0,175,175);
}

void draw(){
farve = farve + 1;
fill(farve,0,0);
x = x + 1;
rect(x,0,0,800);
}
