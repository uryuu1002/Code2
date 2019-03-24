int state = 0;
Rotation r;

void setup() {
  size(600, 600); 
  rectMode(CENTER);
  r = new Rotation();
}

void draw() {
  background(50);
  
  fill(255,0,0);
  text("Press RIGHT to change color (i.e. change states)", width/4, 10);
  text("Press LEFT to blink color (i.e. change states)", width/4, 25);
  
  
  r.display();
  r.update();
}

void keyPressed() {
}

class Rotation {
  int state;
  float a = 0.0;
  float aVelocity = 0.0;
  float aAcceleration;

  Rotation() {
  }

  void display() {   
    switch (state) {
    case 0:
      stroke(255);
      break;
    case 1:
      stroke(0);
      break;
    default:
      break;
    }
    translate(width/2, height/2);
    noFill();
    for (int d = 500; d>0; d-=10) {
      rect(0, 0, d, d);
      rotate(a);
    }
  }

  void update() {
    switch(state) {
    case 0:
      if (keyCode == RIGHT) {
        advance();
      }
    case 1:
      if (keyCode == LEFT) {
        advance();
      }
      break;
    default:
      break;
    }

    aAcceleration = map(mouseX, 0, width, -0.00001, 0.00001);
    a += aVelocity;
    aVelocity += aAcceleration;
  }

  void advance() {
    state++;
    if (state > 1){
    state = 0;
    }
  }
}
