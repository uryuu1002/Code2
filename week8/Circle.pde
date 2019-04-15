class Circle {
  PVector pos;
  PVector vel;
  PVector acc;     
  float mass;
  float r;

  Circle(int i) {
    pos = new PVector (random(width), random(height));
    vel = new PVector (random (-3, 3), random(-3, 3));
    acc = new PVector (0, 0);
    r = noise(i*frequency, 10)*50;
    mass = random(5,15);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
    for (int i = 0; i < circles.size(); i++) {
      noStroke();
      float h = map(circles.get(i).r, 0, 20, 1, 0.3);
      float s = 1;
      float b = 1;
      fill(h, s, b);
      ellipse(circles.get(i).pos.x, circles.get(i).pos.y, circles.get(i).r, circles.get(i).r);
      noFill();
      stroke(h,s,b,0.1);
      strokeWeight(0.5);
      ellipse(circles.get(i).pos.x, circles.get(i).pos.y, circles.get(i).r+15, circles.get(i).r+15);
      ellipse(circles.get(i).pos.x, circles.get(i).pos.y, circles.get(i).r+30, circles.get(i).r+30);
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
}
