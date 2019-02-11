class Paddle {
  PVector pos;
  int w, h;

  Paddle() {
    w = 100;
    h = 20;
    pos = new PVector (width/2, 550);
  }

  void display() {
    fill(0);
    rect(pos.x, pos.y, w, h);
  }

  void update() {
  }

  void mLeft() {
    pos.x -= 20;
    if (pos.x < 0) {
      pos.x = 0;
    }
  }

  void mRight() {
    pos.x += 20;
    if (pos.x > width-100) {
      pos.x = width -100;
    }
  }
}
