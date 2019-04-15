float frequency = 0.5;
ArrayList<Circle> circles = new ArrayList<Circle>();
PVector gravity = new PVector(0, 0.1);

void setup() {
  size(720, 500);
  noStroke();
  colorMode(HSB, 1);
  for (int i = 0; i < 100; i++) {
    boolean overlapping = false;
    Circle circle = new Circle(i);

    for (int j = 0; j < circles.size(); j++) {
      Circle other = circles.get(j);
      float d = dist(circle.pos.x, circle.pos.y, other.pos.x, other.pos.y);
      if (d < circle.r + other.r) {
        overlapping = true;
        break;
      }
    }

    if (!overlapping) {
      circles.add(circle);
    }
  }
}

void draw() {
  background(0, 0, 0.2);
  for (int i = 0; i < 10; i++) {
    boolean overlapping = false;
    Circle circle = new Circle(i);

    for (int j = 0; j < circles.size(); j++) {
      Circle other = circles.get(j);
      float d = dist(circle.pos.x, circle.pos.y, other.pos.x, other.pos.y);
      if (d < circle.r + other.r) {
        overlapping = true;
        break;
      }
    }

    if (!overlapping) {
      for (Circle c : circles) {
        c.applyForce(gravity);
        c.update();
        c.display();
      }
    }
  }
}
