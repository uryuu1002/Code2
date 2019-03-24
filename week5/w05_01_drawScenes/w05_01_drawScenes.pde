// bryan ma for code 2 sp 19

int scene = 0;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  fill(0);
  switch (scene) {
  case 0:
    textSize(32);
    fill(255, 0, 0);
    text("PRESS RIGHT", 300, 300); 
    fill(0);
    ellipse(200, 200, 100, 100);

    break;
  case 1:
    textSize(32);
    fill(255, 0, 0);
    text("PRESS LEFT", 300, 290); 
    fill(0);
    rect(300, 300, 100, 100);
    break;
  case 2:
    textSize(32);
    fill(255, 0, 0);
    text("WELL DONE!", 400,500); 
    fill(0);
    triangle(0, 0, width, 0, width/2, height);
    break;
  case 3:
    text("fin", 100, 100);
    break;
  default:
    break;
  }
}

void keyPressed() {
  switch (scene) {
  case 0:
    if (keyCode == RIGHT) {
      advance();
    }
  case 1:
    if (keyCode == LEFT) {
      advance1();
    }
  case 2:
    break;
  case 3:
    break;
  default:
    break;
  }
}

void advance() {
  scene = 1;
}

void advance1() {
  scene = 2;
}
