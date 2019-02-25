class Brick2 extends Shape {
  
  Brick2(float x, float y, float w, float h) {
    super (x, y, w, h);
  }

  void display() {
    rectMode(CORNER);
    stroke(0);
    fill(255);
    rect(x, y, w, h);
  }
}
