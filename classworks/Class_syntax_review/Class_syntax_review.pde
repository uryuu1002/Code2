class Star {
  float x, y;
  int s;

  Star() {
    x = random(0, width);
    y = random(0, height);
  }

  void update() {
  }

  void display() {
    ellipse(x, y, s, s);
  }
}
