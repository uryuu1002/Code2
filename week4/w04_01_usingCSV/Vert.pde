class Vert {
  float x;
  float c;
  float y;

  Vert(int i, int h) {
   x = map(i, 0, data.getRowCount()-1, 100, 700);
   c = map(i, 0, data.getRowCount()-1, 0, 255);
   y = int(h);
        
  }

  void display() {

    fill(c);
    rect(x, height/2, 50, y);
  }
}
