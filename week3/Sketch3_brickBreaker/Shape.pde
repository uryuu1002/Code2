class Shape {
  PVector pos;
  float x;
  float y;
  float w;
  float h;
  boolean active;

  Shape(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    active = true;

    pos = new PVector(x, y);
  }

  void display() {
  }
}
