class Knap {

  float x;
  float y;
  float w;
  float h;
  color c;
  int s;
  color l;

  Knap(float _x, float _y, float _w, float _h, color _c, int _s, color _l) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
    s = _s;
    l = _l;
  }

  void display() {
    push();
    stroke(l);
    strokeWeight(s);
    fill(c);
    rect(x, y, w, h);

    /* if(isActive) {
       s = 5;
       
     }
     else {
       s = 0; 
     }
     */
    pop();
  }

}
