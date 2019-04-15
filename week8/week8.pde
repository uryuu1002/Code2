//Sprint / Pendulum inspired by Daniel Shiffman Nature of Code Chapter 3

float frequency = 0.5;
ArrayList<Circle> circles = new ArrayList<Circle>();
PVector origin;
Mover b;
Mover d;
Mover e;
float restLength;
float restLength2;
float restLength3;

void setup() {
  size(720, 500);
  noStroke();
  colorMode(HSB, 1);
  restLength = 200;
  restLength2 = 100;
  restLength3 = 50;
  origin = new PVector (width/2, 0);
  b = new Mover (width/2, 240);
  d = new Mover(b.pos.x, b.pos.y);
  e = new Mover(d.pos.x, d.pos.y);

  for (int i = 0; i < 20; i++) {
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


  PVector spring = PVector.sub(b.pos, origin);
  float currentLength = spring.mag();
  spring.normalize();
  float k = 0.05;
  float stretch = currentLength - restLength;
  spring.mult(-k * stretch);  
  b.applyForce(spring);
  PVector gravity = new PVector(0, 0.2);
  PVector pen = new PVector (0.1, 0);
  b.applyForce(pen);
  b.applyForce(gravity);
  b.update();
  b.display();


  stroke(1);
  strokeWeight(3);
  line(b.pos.x, b.pos.y, d.pos.x, d.pos.y);
  PVector spring2 = PVector.sub(d.pos, b.pos);
  float currentLength2 = spring2.mag();
  spring2.normalize();
  float k2 = 0.05;
  float stretch2 = currentLength2 - restLength2;
  spring2.mult(-k2 * stretch2);  
  d.applyForce(spring2);
  PVector gravity2 = new PVector(0, 0.2);
  PVector pen2 = new PVector (-0.1, 0);
  d.applyForce(pen2);
  d.applyForce(gravity2);
  d.update();
  d.display();
  
  stroke(1);
  strokeWeight(3);
  line(d.pos.x, d.pos.y, e.pos.x, e.pos.y);
  PVector spring3 = PVector.sub(e.pos, d.pos);
  float currentLength3 = spring3.mag();
  spring3.normalize();
  float k3 = 0.05;
  float stretch3 = currentLength3 - restLength3;
  spring3.mult(-k3 * stretch3);  
  e.applyForce(spring3);
  PVector gravity3 = new PVector(0, 0.2);
  PVector pen3 = new PVector (0.1, 0);
  e.applyForce(pen3);
  e.applyForce(gravity3);
  e.update();
  e.display();


  for (int i = 0; i < circles.size(); i++) {
    Circle c = circles.get(i);
    PVector force = new PVector(b.pos.x, b.pos.y);
    force.sub(c.pos);
    float d = force.mag();
    if (d < (c.r/2)+(b.mass)) {
      force.normalize();
      force.mult(-2);
      c.applyForce(force);
    } else {
      force.normalize();
      force.mult(0.05);
      c.applyForce(force);
    }
  }

  for (Circle c : circles) {
    c. update();
    c.display();
  }
}
