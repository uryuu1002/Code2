class Circle {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float mass;
  

  Circle(int i) {
    pos = new PVector (random(width), random(height));
    vel = new PVector (random (-3, 3), random(-3, 3));
    acc = new PVector (0, 0);
    r = noise(i*frequency, 10)*50;
    mass = random(15, 50);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);

    if (pos.x < r/2) {
      pos.x = r/2;
      vel.x *= -1;
    } else if (pos.x > width - r/2) {
      pos.x = width - r/2;
      vel.x *= -1;
    }

    if (pos.y > height - r/2) {
      pos.y = height - r/2;
      vel.y *= -1;
    }
  }

  void display() {
    for (int i = 0; i < circles.size(); i++) {
      float h = map(circles.get(i).r, 0, 20, 1, 0);
      float s = 1.;
      float b = 1.;
      fill(h, s, b);
      ellipse(circles.get(i).pos.x, circles.get(i).pos.y, circles.get(i).r, circles.get(i).r);
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
}
