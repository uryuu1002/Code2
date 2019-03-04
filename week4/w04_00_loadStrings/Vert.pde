class Vert {
  float x;
  float c;
  float y;

  Vert(int i, int h) {
   x = map(i, 0, 6, 50, width);
   c = map(i, 0, 6, 0, 255);
   y = int(h);
        
  }

  void display() {

    fill(c);
    rect(x, height/2, 20, y);
  }
}
