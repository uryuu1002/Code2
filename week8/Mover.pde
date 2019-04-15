class Mover { 
  PVector pos;
  PVector vel;
  PVector acc;
  float mass = 50;


  // Arbitrary damping to simulate friction / drag 
  float damping = 1;

  // Constructor
  Mover(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  } 

  // Standard Euler integration
  void update() { 
    vel.add(acc);
    vel.mult(damping);
    pos.add(vel);
    acc.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  void display() { 
    stroke(1);
    strokeWeight(2);
    fill(1);
    ellipse(pos.x, pos.y, mass, mass);

    stroke(1);
    strokeWeight(0.5);
    noFill();
    ellipse(pos.x, pos.y, mass + 25, mass + 20);
    ellipse(pos.x, pos.y, mass + 20, mass + 25);
    ellipse(pos.x, pos.y, mass + 45, mass + 30);
    ellipse(pos.x, pos.y, mass + 30, mass + 45);


    stroke(1);
    strokeWeight(3);
    line(origin.x, origin.y, b.pos.x, b.pos.y);
  }
}
