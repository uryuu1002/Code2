float theta;

void setup() {
  size(700, 800);
}

void draw() {
  background(255);
  translate(width/2, height);
  theta = map(mouseX, 0, width, 0, PI/2);
  branch(200);
  noLoop();
}

void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);
  theta = random(5, 40);

  len *= random(0.3, 0.8);

  if (len > 2 ) {
    float r = random(10);

    if (r > 3) {
      pushMatrix();
      rotate(radians(theta));
      branch(len);
      popMatrix();
    } 
    pushMatrix();
    rotate(radians(-theta));
    branch(len);
    popMatrix();
  }
}
