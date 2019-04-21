class Mover { 
  PVector pos;
  PVector vel;
  PVector acc;
  float mass = 50;

  // Arbitrary damping to simulate friction / drag 
  float damping = 1;
  float screenSize = int(width*height/spacing);
  float x1 = int(map(song.position(), 0, song.length(), 0, screenSize));
  float ySteps = x1/width;
  float freqMix = song.mix.get(int(x1));
  float amplitude = song.mix.level();
  float size = freqMix * spacing/1.5 * amplification;

  // Constructor
  Mover(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    x1 -= width*ySteps;
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
    
    pushMatrix();
    translate(pos.x, pos.y, 0);
    rotateX(radians(frameCount*0.3));
    rotateY(radians(frameCount*0.5));  
    rotateZ(radians(frameCount*0.1));
    fill(0, 0, 0);
    strokeWeight(3);
    stroke(100);
    sphereDetail(10);
    sphere(map(size, 0, 10, 100, 120));
    popMatrix();

    stroke(100);
    strokeWeight(30);
    line(origin.x, origin.y, n.pos.x, n.pos.y);
  }
}
