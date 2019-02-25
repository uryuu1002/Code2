class Brick extends Shape {
  
  Brick(float x, float y, float w, float h) {
    super (x, y, w, h);
  }

  void display() {
    rectMode(CORNER);
    stroke(255);
    fill(0);
    rect(pos.x, pos.y, w, h);
  }
}
